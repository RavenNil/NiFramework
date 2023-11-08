/******************************************************
  > File Name: ni_obj_pool.h
  > Author: NilRaven
  > Description:
  >
  > Created Time: Wed 25 Oct 2023 04:38:32 AM PDT
 *****************************************************/

#pragma once

#include "niexport.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct ni_obj_pool_impl_s ni_obj_pool_impl_t;

typedef struct NI_EXPORT ni_obj_pool_s {
    int s32ObjSize;
    ni_obj_pool_impl_t* pImpl = nullptr;
} ni_obj_pool_t;

NI_EXPORT ni_obj_pool_t* ni_opool_alloc();
NI_EXPORT int ni_opool_init(ni_obj_pool_t* pObjPool, int s32ObjCnt, int s32ObjSize);
NI_EXPORT int ni_opool_free(ni_obj_pool_t* pObjPool);

NI_EXPORT int ni_opool_get_osize(ni_obj_pool_t* pObjPool);
NI_EXPORT int ni_opool_get_len(ni_obj_pool_t* pObjPool);
NI_EXPORT int ni_opool_get_available(ni_obj_pool_t* pObjPool);

NI_EXPORT void* ni_opool_alloc_obj(ni_obj_pool_t* pObjPool);
NI_EXPORT int ni_opool_free_obj(ni_obj_pool_t* pObjPool, void* pObj);

#ifdef __cplusplus
}
#endif



#ifdef __cplusplus

#include <memory>

template <typename T>
class CNiObjPool
{
   public:
    CNiObjPool() : m_pObjPool(ni_opool_alloc()) {}
    ~CNiObjPool() { ni_opool_free(m_pObjPool); }

    /**
     * @brief 初始化提前分配好的对象个数
     *
     * @param s32InitSize
     * @return
     */
    int InitSize(int s32InitSize) { return ni_opool_init(m_pObjPool, s32InitSize, sizeof(T)); }

    /**
     * @brief 尝试分配一个对象
     *
     * @return 
     */
    T* AllocObj() { return reinterpret_cast<T*>(ni_opool_alloc_obj(m_pObjPool)); }

    /**
     * @brief 释放对象
     *
     * @param objptr 
     * @return 
     */
    int FreeObj(T* objptr) { return ni_opool_free_obj(m_pObjPool, objptr); }

    /**
     * @brief
     *
     * @return
     */
    int GetObjSize() { return sizeof(T); }

    /**
     * @brief 获取对象池的长度
     *
     * @return 
     */
    int GetPoolLen() { return ni_opool_get_len(m_pObjPool); }

    /**
     * @brief 获取对象池中可用的对象数量
     *
     * @return
     */
    int GetPoolAvailable() { return ni_opool_get_available(m_pObjPool); }

   private:
    ni_obj_pool_t* m_pObjPool = nullptr;
};

#endif
