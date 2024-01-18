/******************************************************
  > File Name: lib/common/event/ni_bus.h
  > Author: NilRaven
  >
  > Created Time: 2023年04月09日 星期日 22时22分32秒
 *****************************************************/

#pragma once

#include "ni_actor.h"
#include "ni_singleton.h"
#include "niexport.h"
#include <stdint.h>

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

#include <type_traits>

template <typename TBusType>
class CNiBus
{
    NI_SINGLETON_DECLARE(CNiBus<TBusType>)
   public:
    int Init()
    {
        if (!m_pBus) {
            m_pBus = ni_bus_alloc();
        }

        return 0;
    }

    template <typename TEvent>
    int RegisterEvent(CNiActor& stActor)
    {
        return ni_bus_reg_event(m_pBus, std::decay_t<TEvent>::hash(), &stActor, CNiActor::OnMessage);
    }

    template <typename TEvent>
    int UnRegisterEvent(CNiActor& stActor, const uint64_t eventHash)
    {
        return ni_bus_unreg_event(m_pBus, std::decay_t<TEvent>::hash(), &stActor,
                                  CNiActor::OnMessage);
    };

    template <typename TEvent>
    int Request(TEvent&& stEvent)
    {
        return ni_bus_request(m_pBus, std::decay_t<TEvent>::hash(), &stEvent);
    }

    template <typename TEvent>
    int PostEvent(TEvent&& stEvent)
    {
        return ni_bus_post_msg(m_pBus, std::decay_t<TEvent>::hash(), &stEvent);
    }

   private:
    ni_bus_t* m_pBus = nullptr;
};

//全局的默认事件总线
using CNiBusDefault = CNiBus<void>;

#endif
