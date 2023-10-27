/******************************************************
  > File Name: ni_spin_lock.h
  > Author: NilRaven
  > Description:
  >
  > Created Time: Fri 27 Oct 2023 03:51:33 PM CST
 *****************************************************/

#pragma once

#include <atomic>
#include <thread>
class CNiSnipLock
{
   public:
    void lock()
    {
        bool expected = false;
        // Spin until the lock is acquired
        while (!lockFlag.compare_exchange_strong(expected, true)) {
            expected = false;           // Reset expected after a failed attempt
            std::this_thread::yield();  // Yield to other threads (optional, but can improve
                                        // performance)
        }
    }
    void unlock() { lockFlag.store(false); }

   private:
    std::atomic<bool> lockFlag = {false};  // Initially unlocked
};
