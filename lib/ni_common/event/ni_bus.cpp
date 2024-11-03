/******************************************************
  > File Name: ni_bus.cpp
  > Author: NilRaven
  > 
  > Created Time: 2023年04月08日 星期六 19时47分55秒
 *****************************************************/

#include "ni_bus.h"

#include "ni_actor.h"
#include "ni_fifo.h"
#include "ni_log.h"
#include "ni_spinlock.h"

#include <algorithm>
#include <condition_variable>
#include <mutex>
#include <queue>
#include <shared_mutex>
#include <unordered_map>

#define DEBUG(fmt, ...) \
    ni_log_print(NI_LOG_LEVEL_DBG, "[{}:{}] " fmt, __FILE__, __LINE__, ##__VA_ARGS__)
#define INFO(fmt, ...) \
    ni_log_print(NI_LOG_LEVEL_INFO, "[{}:{}] " fmt, __FILE__, __LINE__, ##__VA_ARGS__)

// FIXME 先使用动态分配，后续改为内存池避免内存碎片问题
struct event_cache_t {
    uint64_t u64EventId;
    void* pstEvent;
};

struct ni_bus_t {
    int test_id;

    // 事件、监听者列表
    std::shared_timed_mutex m_eventListenersMtx;
    std::unordered_map<uint64_t, std::vector<void*>> m_eventListeners;
    std::unordered_map<void*, cb_event_t> m_actorCb;

    // 事件循环
    std::mutex m_eventCondMtx;
    std::condition_variable m_eventCond;
    // FIXME 先使用动态分配，后续改为内存池避免内存碎片问题
    std::queue<event_cache_t> m_eventCache;
    CNiSpinLock* m_pEventCacheLock;
};

ni_bus_t* ni_bus_alloc()
{
    ni_bus_t* pBus = new ni_bus_t;
    pBus->m_pEventCacheLock = new CNiSpinLock();

    return pBus;
}

int ni_bus_free(ni_bus_t* pBus)
{
    if(pBus != nullptr){
        if(pBus->m_pEventCacheLock != nullptr){
            delete pBus->m_pEventCacheLock;
        }
        delete pBus;
    }
    return 0;
}

int ni_bus_run(ni_bus_t* pBus)
{
    INFO("ni_bus_run start");
    while (true) {
        std::condition_variable& stCond = pBus->m_eventCond;

        std::unique_lock<std::mutex> lk(pBus->m_eventCondMtx);
        stCond.wait(lk, [pBus]() -> bool {
            bool bNeedWakeup = false;
            CNiSpinLock* pstLock = pBus->m_pEventCacheLock;
            pstLock->Lock();
            if (!pBus->m_eventCache.empty()) {
                bNeedWakeup = true;
            }
            pstLock->Unlock();

            return bNeedWakeup;
        });

        while (!pBus->m_eventCache.empty()) {
            ni_bus_run_once(pBus);
        }

    }

    INFO("ni_bus_run end");
    return 0;
}

int ni_bus_run_once(ni_bus_t* pBus)
{
    if (!pBus->m_eventCache.empty()) {
        event_cache_t stCache = pBus->m_eventCache.front();
        CNiSpinLock* pstLock = pBus->m_pEventCacheLock;

        pstLock->Lock();
        pBus->m_eventCache.pop();
        pstLock->Unlock();

        ni_bus_request(pBus, stCache.u64EventId, stCache.pstEvent);

        // FIXME 先使用动态分配，后续改为内存池避免内存碎片问题
        // 使用完了，销毁
        free(stCache.pstEvent);
        stCache.pstEvent = nullptr;
    }
    return 0;
}

int ni_bus_reg_event(ni_bus_t * pBus, uint64_t u64EventId, void* pListener, cb_event_t cb)
{
    std::unique_lock<std::shared_timed_mutex> lk(pBus->m_eventListenersMtx);
    pBus->m_eventListeners[u64EventId].push_back(pListener);
    pBus->m_actorCb[pListener] = cb;
    return 0;
}

int ni_bus_unreg_event(ni_bus_t* pBus, uint64_t u64EventId, void* pListener, cb_event_t cb)
{
    std::unique_lock<std::shared_timed_mutex> lk(pBus->m_eventListenersMtx);
    if (pBus->m_eventListeners.find(u64EventId) == pBus->m_eventListeners.end()) {
        return -1;
    }
    auto& vec = pBus->m_eventListeners[u64EventId];
    auto it = std::find(vec.begin(), vec.end(), pListener);
    if(it != vec.end()){
        pBus->m_eventListeners[u64EventId].erase(it);
    }
    pBus->m_actorCb[pListener] = nullptr;
    return 0;
}

int ni_bus_request(ni_bus_t* pBus, uint64_t u64EventId, void* pstEvent)
{
    std::shared_lock<std::shared_timed_mutex> lk(pBus->m_eventListenersMtx);
    if (pBus->m_eventListeners.find(u64EventId) == pBus->m_eventListeners.end()) {
        return -1;
    }

    auto& vec = pBus->m_eventListeners[u64EventId];
    for (void* pListener : vec) {
        cb_event_t cb = pBus->m_actorCb[pListener];
        if (cb) {
            cb(pListener, u64EventId, pstEvent);
        }
    }

    return 0 ;
}

int ni_bus_post_msg(ni_bus_t* pBus, uint64_t u64EventId, void* pstEvent, int32_t s32EventSize)
{
    CNiSpinLock* pstLock = pBus->m_pEventCacheLock;

    void* pstCacheEvent = malloc(s32EventSize);
    memcpy(pstCacheEvent, pstEvent, s32EventSize);
    event_cache_t stCache;
    stCache.u64EventId = u64EventId;
    stCache.pstEvent = pstCacheEvent;

    pstLock->Lock();
    pBus->m_eventCache.push(stCache);
    pstLock->Unlock();

    pBus->m_eventCond.notify_one();

    return 0;
}
