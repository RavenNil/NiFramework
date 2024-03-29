/******************************************************
  > File Name: ni_condwaiter.h
  > Author: NilRaven
  > 
  > Created Time: Tue Aug  8 21:22:17 2023
 *****************************************************/
#pragma once



#if defined (__cplusplus)
#include <condition_variable>
#include <mutex>
#include <thread>

template <typename Derived>
class CNiCondWaiter
{
   protected:
    /**
     * @brief notify 
     */
    void NiCondNotify() { m_cond.notify_one(); }

    /**
     * @brief start while true routinue
     */
    void NiCondWaiterRun()
    {
        if (!m_bIsRuning) {
            std::thread(&CNiCondWaiter::NiRoutinue, this).detach();
            m_bIsRuning = true;
        }
    }

    /**
     * @brief Stop while true routinue
     */
    void NiCondWaiterStop() { m_bIsRuning = false; }

   private:
    std::condition_variable m_cond;
    std::mutex m_condMtx;
    bool NiPredicate() { return static_cast<Derived*>(this)->NiPredicateImpl(); }

    int NiRoutinue()
    {
        while (true) {
            if (!m_bIsRuning) break;
            // wait
            std::unique_lock<std::mutex> lock(m_condMtx);
            m_cond.wait(lock, [this]() -> bool { return NiPredicate(); });

            // do job
            static_cast<Derived*>(this)->NiRoutinueImpl();
        }
        return 0;
    }
    bool m_bIsRuning = false;
};

#endif
