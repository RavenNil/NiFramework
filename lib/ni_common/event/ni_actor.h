/******************************************************
  > File Name: ni_actor.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月09日 星期日 23时25分43秒
 *****************************************************/

#pragma once

#include "niexport.h"
#include <unistd.h>


#if defined(__cplusplus)
#include "ni_bus.h"
#include "ni_iactor.h"

#include <cstdint>
#include <type_traits>
#include <utility>

class CNiActor: public INiActor
{
   public:
    template <typename TEvent, typename TEventBus = CNiBusDefault>
    int RegisterEvent()
    {
        return TEventBus::Instance().template RegisterEvent<TEvent>(*this);
    }

    template <typename TEvent, typename TEventBus = CNiBusDefault>
    int UnRegisterEvent()
    {
        return TEventBus::Instance().template UnRegisterEvent<TEvent>(*this);
    };

    template <typename TEvent, typename TEventBus = CNiBusDefault>
    int PostEvent(TEvent&& stEvent)
    {
        return TEventBus::Instance().template PostEvent<TEvent>(std::forward<TEvent>(stEvent));
    }

    template <typename TEvent, typename TEventBus = CNiBusDefault>
    int Request(TEvent&& stEvent)
    {
        return TEventBus::Instance().template Request(std::forward<TEvent>(stEvent));
    }

    virtual ~CNiActor() = default;
};

#endif
