/******************************************************
  > File Name: ni_spinlock.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Sun 03 Nov 2024 09:40:56 PM CST
 *****************************************************/

#include "ni_spinlock.h"

#include <pthread.h>

#include <atomic>
#include <cstdlib>
#include <thread>

struct ni_spinlock_t
{
    void* pLock;
    int type;
    std::atomic<bool> lockFlag = {false};  // Initially unlocked
    pthread_spinlock_t spinLock;
};

// ATOMIC 实现自选锁的函数签名
static ni_spinlock_t* __spinlock_alloc_atomic();
static void __spinlock_free_atomic(ni_spinlock_t* pLock);
static void __spinlock_lock_atomic(ni_spinlock_t* pLock);
static void __spinlock_unlock_atomic(ni_spinlock_t* pLock);

// PTHREAD 实现自选锁的函数签名
static ni_spinlock_t* __spinlock_alloc_pthread();
static void __spinlock_free_pthread(ni_spinlock_t* pLock);
static void __spinlock_lock_pthread(ni_spinlock_t* pLock);
static void __spinlock_unlock_pthread(ni_spinlock_t* pLock);

/**
 * @brief
 *
 * @param type  see spinlock_type
 * @return
 */
ni_spinlock_t* ni_spinlock_alloc_type(int type)
{
    if (type == NI_SPINLOCK_ATOMIC) {
        return __spinlock_alloc_atomic();
    } else {
        return __spinlock_alloc_pthread();
    }
}

void ni_spinlock_free(ni_spinlock_t* pLock)
{
    if (pLock->type == NI_SPINLOCK_ATOMIC) {
        return __spinlock_free_atomic(pLock);
    } else {
        return __spinlock_free_pthread(pLock);
    }
}

 void ni_spinlock_lock(ni_spinlock_t* pLock)
 {
    if (pLock->type == NI_SPINLOCK_ATOMIC) {
        return __spinlock_unlock_atomic(pLock);
    }else{
        return __spinlock_lock_pthread(pLock);
    }
 }

void ni_spinlock_unlock(ni_spinlock_t* pLock)
{
    if (pLock->type == NI_SPINLOCK_ATOMIC) {
        return __spinlock_unlock_atomic(pLock);
    } else {
        return __spinlock_unlock_pthread(pLock);
    }
}


//============PTHREAD SPINLOCK IMPLEMENTATION===============
ni_spinlock_t* __spinlock_alloc_pthread()
{
    ni_spinlock_t* pLock = (ni_spinlock_t*)malloc(sizeof(ni_spinlock_t));
    pLock->type = NI_SPINLOCK_PTHREAD;
    pthread_spin_init(&pLock->spinLock, PTHREAD_PROCESS_PRIVATE);
    return pLock;
}

void __spinlock_lock_pthread(ni_spinlock_t* pLock)
{
    //
    pthread_spin_lock(&pLock->spinLock);
}

void __spinlock_unlock_pthread(ni_spinlock_t* pLock)
{
    //
    pthread_spin_unlock(&pLock->spinLock);
}
void __spinlock_free_pthread(ni_spinlock_t* pLock)
{
    pthread_spin_destroy(&pLock->spinLock);
    free(pLock);
}

//============ATOMIC SPINLOCK IMPLEMENTATION===============
ni_spinlock_t* __spinlock_alloc_atomic()
{
    ni_spinlock_t* pLock = (ni_spinlock_t*)malloc(sizeof(ni_spinlock_t));
    pLock->type = NI_SPINLOCK_ATOMIC;
    pLock->lockFlag.store(false);
    return pLock;
}

void __spinlock_lock_atomic(ni_spinlock_t* pLock)
{
    bool expected = false;
    // Spin until the lock is acquired
    while (!pLock->lockFlag.compare_exchange_strong(expected, true)) {
        expected = false;           // Reset expected after a failed attempt
        std::this_thread::yield();  // Yield to other threads (optional, but can improve
                                    // performance)
    }
}

void __spinlock_unlock_atomic(ni_spinlock_t* pLock) { pLock->lockFlag.store(false); }

void __spinlock_free_atomic(ni_spinlock_t* pLock)
{
    pLock->lockFlag.store(false);
    free(pLock);
}

