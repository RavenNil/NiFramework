/******************************************************
  > File Name: ni_fifo.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Wed 01 Nov 2023 11:28:20 AM CST
 *****************************************************/

#pragma once

#include <memory.h>
#include <stdio.h>

#include <atomic>
#include <cstdint>
#include <memory>

class CNiFifoImpl
{
   public:
    ~CNiFifoImpl()
    {
        if (m_data) {
            free(m_data);
        }
    }

    /**
     * @brief 分配空间，会自动适配到2的幂次方
     *
     * @param size
     * @return
     */
    int Alloc(uint32_t size, uint32_t esize);

    /**
     * @brief 写入多个对象
     *
     * @param buf 地址
     * @param len 对象个数
     * @return 返回成功写入个数
     */
    uint32_t In(const void* buf, uint32_t len);

    /**
     * @brief 获取多个对象
     *
     * @param buf 地址
     * @param len 对象个数
     * @return 返回成功获取的对象个数
     */
    uint32_t Out(void* buf, uint32_t len);

    /**
     * @brief 同Out，但是不改变out索引
     *
     */
    uint32_t OutPeek(void* buf, uint32_t len);

    /**
     * @brief FIFO是否已经满了
     *
     * @return 
     */
    bool IsFull() { return Len() > m_mask; }

    /**
     * @brief FIFO是否为空
     *
     * @return 
     */
    bool IsEmpty() { return m_in == m_out; }


    /**
     * @brief 返回FIFO中生成了，但是还没消费的空间大小
     *
     * @return 
     */
    uint32_t Len() { return m_in - m_out; }

    /**
     * @brief 清除还没有消费的数据
     */
    void ResetOut() { m_out = m_in; }

    /**
     * @brief 重置FIFO
     */
    void Reset() { m_out = m_in = 0; }

    /**
     * @brief 返回FIFO空间的大小
     *
     * @return 
     */
    uint32_t Size() { return m_mask + 1; }

    /**
     * @brief 是否已经初始化
     *
     * @return 
     */
    bool Initialized() { return m_mask > 0; }

    /**
     * @brief 和Unused一样
     *
     * @return 
     */
    uint32_t Avail() { return Size() - Len(); }

    /**
     * @brief 检查未使用的空间大小，单位字节
     *
     * @return
     */
    uint32_t Unused() { return (m_mask + 1) - (m_in - m_out); }

   protected:
    void CopyIn(const void* src, uint32_t len, uint32_t off);
    void CopyOut(void* dst, uint32_t len, uint32_t off);

    uint32_t m_in = 0;
    uint32_t m_out = 0;
    uint32_t m_mask = 0;
    uint32_t m_esize = 0;

    char* m_data = nullptr;
};

template <typename T>
class CNiFifo : public CNiFifoImpl
{
   public:
    /**
     * @brief 分配元素数，实际空间会自动适配到2的幂次方
     *
     * @param size 元素个数
     * @return
     */
    int Alloc(uint32_t size)
    {
        //
        return CNiFifoImpl::Alloc(size, sizeof(T));
    }

    bool Put(T& val)
    {
        if (!CNiFifoImpl::IsFull()) {
            memcpy(&((T*)m_data)[(m_in & m_mask)], &val, sizeof(val));
            std::atomic_thread_fence(std::memory_order_release);
            m_in++;
            return true;
        }
        return false;
    }

    bool Get(T& val)
    {
        if (!CNiFifoImpl::IsEmpty()) {
            memcpy(&val, &((T*)m_data)[(m_out & m_mask)], sizeof(val));
            std::atomic_thread_fence(std::memory_order_release);
            m_out++;
            return true;
        }
        return false;
    }

    uint32_t Esize() { return m_esize; }

};
