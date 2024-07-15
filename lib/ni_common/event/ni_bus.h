/******************************************************
  > File Name: lib/common/event/ni_bus.h
  > Author: NilRaven
  >
  > Created Time: 2023年04月09日 星期日 22时22分32秒
 *****************************************************/

#pragma once

#include "ni_iactor.h"
#include "ni_singleton.h"
#include "niexport.h"
#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

struct ni_bus_t;

typedef int (*cb_event_t)(void* pListener, uint64_t u64EventId, void* pData);

NI_EXPORT ni_bus_t* ni_bus_alloc();
NI_EXPORT int ni_bus_free(ni_bus_t* pBus);

NI_EXPORT int ni_bus_reg_event(ni_bus_t* pBus, uint64_t u64EventId, void* pListener,
                               cb_event_t cb);
NI_EXPORT int ni_bus_unreg_event(ni_bus_t* pBus, uint64_t u64EventId, void* pListener,
                                 cb_event_t cb);
NI_EXPORT int ni_bus_request(ni_bus_t* pBus, uint64_t u64EventId, void* pstEvent);
NI_EXPORT int ni_bus_post_msg(ni_bus_t* pBus, uint64_t u64EventId, void* pstEvent);

#if defined(__cplusplus)
}
#endif


#if defined(__cplusplus)

#include <type_traits>
#include <cstdint>

class CNiActor;
static int OnMessage(void* pListener, uint64_t u64EventId, void* pEvent)
{
    ((INiActor*)pListener)->MsgHandle(u64EventId, pEvent);
    return 0;
}

class CNiBusBase
{
   protected:
    CNiBusBase()
    {
        if (!m_pBus) {
            m_pBus = ni_bus_alloc();
        }
    }

    int RegisterEvent(CNiActor& stActor, uint64_t u64EventId)
    {
        return ni_bus_reg_event(m_pBus, u64EventId, &stActor, OnMessage);
    }

    int UnRegisterEvent(CNiActor& stActor, const uint64_t u64EventId)
    {
        return ni_bus_unreg_event(m_pBus, u64EventId, &stActor, OnMessage);
    };

    int Request(void* pstEvent, const uint64_t u64EventId)
    {
        return ni_bus_request(m_pBus, u64EventId, pstEvent);
    }

    int PostEvent(void* pstEvent, const uint64_t u64EventId)
    {
        return ni_bus_post_msg(m_pBus, u64EventId, pstEvent);
    }

   private:
    ni_bus_t* m_pBus = nullptr;

};

template <typename TBusType>
class CNiBus : private CNiBusBase
{
    NI_SINGLETON_DECLARE(CNiBus<TBusType>)

   public:
    CNiBus() : CNiBusBase() {}

    template <typename TEvent>
    int RegisterEvent(CNiActor& stActor)
    {
        return CNiBusBase::RegisterEvent(stActor, std::decay_t<TEvent>::hash());
    }

    template <typename TEvent>
    int UnRegisterEvent(CNiActor& stActor)
    {
        return CNiBusBase::UnRegisterEvent(stActor, std::decay_t<TEvent>::hash());
    };

    template <typename TEvent>
    int Request(TEvent&& stEvent)
    {
        return CNiBusBase::Request(&stEvent, std::decay_t<TEvent>::hash());
    }

    template <typename TEvent>
    int PostEvent(TEvent&& stEvent)
    {
        return CNiBusBase::PostEvent(&stEvent, std::decay_t<TEvent>::hash());
    }
};

//全局的默认事件总线
using CNiBusDefault = CNiBus<void>;

#endif
