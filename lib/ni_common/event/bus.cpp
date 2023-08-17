/******************************************************
  > File Name: bus.cpp
  > Author: NilRaven
  > 
  > Created Time: 2023年04月08日 星期六 19时47分55秒
 *****************************************************/

#include "bus.h"

#include "actor.h"
#include "ni_log.h"

void CNiBus::RegisterEvent(size_t eventId, CActor* pObj)
{
    if (m_eventListeners.find(eventId) == m_eventListeners.end()) {
        m_eventListeners[eventId] = {};
    }

    //不允许多次注册
    auto vecIt = std::find(m_eventListeners.begin(), m_eventListeners.end(), pObj);
    if (vecIt == m_eventListeners.end()) {
        m_eventListeners[eventId].push_back(pObj);
    } else {
        ERROR("Not Allow Register multi event in one obj");
    }
}

void CNiBus::RegisterEvent(CActor* pstAcotr, const NiEventHash_t eventHash)
{
    DEBUG("Register Event");
}

void CNiBus::UnRegisterEvent(CActor* pstAcotr, const NiEventHash_t eventHash)
{
    DEBUG("UnRegisterEvent Event");
}

void CNiBus::SendEvent(const NiEventHash_t eventHash)
{
    DEBUG("SendEvent Event");
    DEBUG("SendEvent Event");
}

void CNiBus::PostEvent(const NiEventHash_t eventHash)
{
    DEBUG("PostEvent Event");
    DEBUG("PostEvent Event");
}
