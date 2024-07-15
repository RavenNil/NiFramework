/******************************************************
  > File Name: ni_bus.cpp
  > Author: NilRaven
  > 
  > Created Time: 2023年04月08日 星期六 19时47分55秒
 *****************************************************/

#include "ni_bus.h"

#include "ni_actor.h"
#include "ni_log.h"

#include <algorithm>
#include <condition_variable>
#include <mutex>
#include <shared_mutex>
#include <unordered_map>
#include <vector>

struct ni_bus_t {
    int test_id;
    std::shared_timed_mutex m_eventListenersMtx;
    std::unordered_map<uint64_t, std::vector<void*>> m_eventListeners;
    std::unordered_map<void*, cb_event_t> m_actorCb;
    std::condition_variable m_eventCond;
};

ni_bus_t* ni_bus_alloc()
{
    //
    return new ni_bus_t;
}

int ni_bus_free(ni_bus_t* pBus)
{
    delete pBus;
    return 0;
}

int ni_bus_reg_event(ni_bus_t* pBus, uint64_t u64EventId, void* pListener, cb_event_t cb)
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

int ni_bus_post_msg(ni_bus_t* pBus, uint64_t u64EventId, void* pstEvent)
{
    // todo 建立事件循环来实现
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

    return 0;
}
