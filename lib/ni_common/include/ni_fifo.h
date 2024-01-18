/******************************************************
  > File Name: ni_fifo.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Wed 01 Nov 2023 11:28:20 AM CST
 *****************************************************/

#pragma once

#include "niexport.h"
#include <memory.h>
#include <stdint.h>
#include <stdio.h>
#include <utility>

typedef struct ni_fifo_u {
    uint32_t m_in = 0;
    uint32_t m_out = 0;
    uint32_t m_mask = 0;
    uint32_t m_esize = 0;
    char* m_data = nullptr;
} ni_fifo_t;

/**
 * @brief 分配空间，会自动适配到2的幂次方
 *
 * @param size
 * @return
 */
NI_EXPORT ni_fifo_t* ni_fifo_alloc(uint32_t size, uint32_t esize);

/**
 * @brief 释放FIFO
 *
 * @param size
 * @param esize
 * @return
 */
NI_EXPORT int ni_fifo_free(ni_fifo_t* pFifo);

/**
 * @brief 写入多个对象
 *
 * @param buf 地址
 * @param len 对象个数
 * @return 返回成功写入个数
 */
NI_EXPORT int ni_fifo_in(ni_fifo_t* pFifo, const void* buf, uint32_t len);

/**
 * @brief 获取多个对象
 *
 * @param buf 地址
 * @param len 对象个数
 * @return 返回成功获取的对象个数
 */
NI_EXPORT int ni_fifo_out(ni_fifo_t* pFifo, void* buf, uint32_t len);

/**
 * @brief 同Out，但是不改变out索引
 *
 */
NI_EXPORT int ni_fifo_out_peek(ni_fifo_t* pFifo, void* buf, uint32_t len);

/**
 * @brief FIFO是否已经满了
 *
 * @return
 */
NI_EXPORT bool ni_fifo_is_full(ni_fifo_t* pFifo);

/**

* @brief FIFO是否为空
 *
 * @return
 */
NI_EXPORT bool ni_fifo_is_empty(ni_fifo_t* pFifo);

/**
 * @brief 返回FIFO中生成了，但是还没消费的空间大小
 *
 * @return
 */
NI_EXPORT int ni_fifo_len(ni_fifo_t* pFifo);

/**
 * @brief 清除还没有消费的数据
 */
NI_EXPORT void ni_fifo_reset_out(ni_fifo_t* pFifo);

/**
 * @brief 重置FIFO
 */
NI_EXPORT void ni_fifo_reset(ni_fifo_t* pFifo);

/**
 * @brief 返回FIFO空间的大小
 *
 * @return
 */
NI_EXPORT int ni_fifo_size(ni_fifo_t* pFifo);

/**
 * @brief 是否已经初始化
 *
 * @return
 */
NI_EXPORT bool ni_fifo_inited(ni_fifo_t* pFifo);

/**
 * @brief 和Unused一样
 *
 * @return
 */
NI_EXPORT int ni_fifo_avail(ni_fifo_t* pFifo);

/**
 * @brief 检查未使用的空间大小，单位字节
 *
 * @return
 */
NI_EXPORT int ni_fifo_unused(ni_fifo_t* pFifo);

#if defined (__cplusplus)
#include <atomic>
#include <cstdint>
#include <memory>

template <typename T>
class CNiFifo
{
   public:
    /**
     * @brief 分配元素数，实际空间会自动适配到2的幂次方
     *
     * @param size 元素个数
     * @return
     */
    int Init(uint32_t size)
    {
        m_pFifo = ni_fifo_alloc(size, sizeof(T));
        return 0;
    }

    bool Put(T&& val) { return Put(val); }
    bool Put(T& val)
    {
        if (!ni_fifo_is_full(m_pFifo)) {
            memcpy(&((T*)m_pFifo->m_data)[(m_pFifo->m_in & m_pFifo->m_mask)], &val, sizeof(val));
            std::atomic_thread_fence(std::memory_order_release);
            m_pFifo->m_in++;
            return true;
        }
        return false;
    }

    bool Get(T&& val) { return Get(val); }
    bool Get(T& val)
    {
        if (!ni_fifo_is_empty(m_pFifo)) {
            memcpy(&val, &((T*)m_pFifo->m_data)[(m_pFifo->m_out & m_pFifo->m_mask)], sizeof(val));
            std::atomic_thread_fence(std::memory_order_release);
            m_pFifo->m_out++;
            return true;
        }
        return false;
    }

    uint32_t Esize() { return m_pFifo->m_esize; }

   private:
    ni_fifo_t* m_pFifo = nullptr;
};
#endif
