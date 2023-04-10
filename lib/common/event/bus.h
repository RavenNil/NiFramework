/******************************************************
  > File Name: lib/common/event/bus.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月09日 星期日 22时22分32秒
 *****************************************************/

#pragma once

#include "actor.h"

#include <algorithm>
#include <string>
#include <typeinfo>
#include <unordered_map>
#include <vector>

class CNiBus
{
   public:
    CNiBus(std::string& strName) : m_strName(strName){};

    void RegisterEvent(std::size_t eventHash, CActor* pObj);

   private:
    const std::string m_strName;

    using AnyObjType = CActor*;
    using EventHash = std::size_t;
    std::unordered_map<EventHash, std::vector<AnyObjType>> m_eventListeners;
};
