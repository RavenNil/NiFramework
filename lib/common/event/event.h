/******************************************************
  > File Name: event.h
  > Author: NilRaven
  >
  > Created Time: 2023年04月09日 星期日 22时41分39秒
 *****************************************************/

#pragma once

#include <typeinfo>

template <typename TEventType>
class CNiEventBase
{
   public:
    constexpr std::size_t id() { return typeid(TEventType).hash_code(); }
};

