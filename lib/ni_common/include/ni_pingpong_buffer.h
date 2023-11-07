/******************************************************
  > File Name: ni_pingpong_buffer.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Tue 07 Nov 2023 09:26:14 AM CST
 *****************************************************/

#pragma once

#include <atomic>

/**
 * @brief 简单实现pingpong buffer，适合小型对象，大型对象会产生拷贝
 *
 * @tparam T
 * @param data
 */
template <typename T>
class CNiPingPongBuffer
{
   private:
    T buffers[2];
    std::atomic<int> active_index{0};  // Assume 0 is the initial active index

   public:
    void Set(const T &data)
    {
        int inactive_index = active_index.load(std::memory_order_acquire) ^ 1;
        buffers[inactive_index] = data;
        active_index.store(inactive_index, std::memory_order_release);
    }

    T Get()
    {
        int current_index = active_index.load(std::memory_order_acquire);
        return buffers[current_index];
    }
};
