/******************************************************
  > File Name: lib/common/event/bus.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月09日 星期日 22时22分32秒
 *****************************************************/

#pragma once

#include "actor.h"

#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

using NiEventHash_t = std::size_t;
class CNiBus
{
   public:
    CNiBus(std::string& strName) : m_strName(strName){};

    void RegisterEvent(CActor* pstAcotr, const NiEventHash_t eventHash);
    void UnRegisterEvent(CActor* pstAcotr, const NiEventHash_t eventHash);
    void SendEvent(const NiEventHash_t eventHash);
    void PostEvent(const NiEventHash_t eventHash);

   private:
    const std::string m_strName;
    std::mutex m_eventListenersMtx;
    std::unordered_map<NiEventHash_t, std::vector<CActor*>> m_eventListeners;
};

