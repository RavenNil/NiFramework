/******************************************************
  > File Name: ni_spinlock.h
  > Author: NilRaven
  > Description:
  >
  > Created Time: Fri 27 Oct 2023 03:51:33 PM CST
 *****************************************************/

#pragma once

#include "niexport.h"

struct ni_spinlock_t;

// spinlock_type
#define NI_SPINLOCK_PTHREAD (0)
#define NI_SPINLOCK_ATOMIC (1)

#define ni_spinlock_alloc() ni_spinlock_alloc_type(NI_SPINLOCK_PTHREAD)

/**
 * @brief 
 *
 * @param type  see spinlock_type
 * @return 
 */
NI_EXPORT ni_spinlock_t* ni_spinlock_alloc_type(int type);

NI_EXPORT void ni_spinlock_free(ni_spinlock_t* pLock);

NI_EXPORT void ni_spinlock_lock(ni_spinlock_t* pLock);

NI_EXPORT void ni_spinlock_unlock(ni_spinlock_t* pLock);



#if defined(__cplusplus)

class CNiSpinLock
{
   public:
    CNiSpinLock(int type = NI_SPINLOCK_PTHREAD) { pLock = ni_spinlock_alloc_type(type); }
    ~CNiSpinLock() { ni_spinlock_free(pLock); }

    void Lock() { ni_spinlock_lock(pLock); }
    void Unlock() { ni_spinlock_unlock(pLock); }

   private:

    ni_spinlock_t* pLock = nullptr;
};

#endif
