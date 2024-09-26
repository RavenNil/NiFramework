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
#include <utility>
#include <memory>

class CNiFifoBase
{
   protected:
    CNiFifoBase(std::size_t total_size, std::size_t sizeof_elem)
        : m_totalsize(total_size), m_elemsize(sizeof_elem)
    {
        m_pFifo = ni_fifo_alloc(m_totalsize, m_elemsize);
        printf("sizeof_elem size %lu\n", sizeof_elem);
        printf("total size %lu\n", total_size);
    }

    ~CNiFifoBase() noexcept { ni_fifo_free(m_pFifo); }

    uint32_t Esize() { return m_pFifo->m_esize; }

    bool Put(void* pVal)
    {
        if (!ni_fifo_is_full(m_pFifo)) {
            memcpy(m_pFifo->m_data + (m_pFifo->m_in & m_pFifo->m_mask) * m_elemsize, pVal,
                   m_elemsize);
            m_pFifo->m_in++;
            std::atomic_thread_fence(std::memory_order_release);
            return true;
        }
        return false;
    }

    bool Get(void* pVal)
    {
        if (!ni_fifo_is_empty(m_pFifo)) {
            memcpy(pVal, m_pFifo->m_data + (m_pFifo->m_out & m_pFifo->m_mask) * m_elemsize,
                   m_elemsize);
            std::atomic_thread_fence(std::memory_order_acquire);
            m_pFifo->m_out++;
            return true;
        }
        return false;
    }

   private:
    ni_fifo_t* m_pFifo{nullptr};
    std::size_t m_totalsize{0};
    std::size_t m_elemsize{0};
};

template <typename T>
class CNiFifo : private CNiFifoBase
{
   public:
    using value_type = T;

    explicit CNiFifo(std::size_t total_size) : CNiFifoBase(total_size, sizeof(value_type)) {}

    uint32_t Esize() { return CNiFifoBase::Esize(); }

    bool Put(value_type& val) { return CNiFifoBase::Put(&val); }
    bool Get(value_type& val) { return CNiFifoBase::Get(&val); }
    bool Put(value_type&& val) { return CNiFifoBase::Put(&val); }
    bool Get(value_type&& val) { return CNiFifoBase::Get(&val); }
};

#endif
