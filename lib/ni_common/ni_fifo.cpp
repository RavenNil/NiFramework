/******************************************************
  > File Name: ni_fifo.cpp
  > Author: NilRaven
  > Description:
  >
  > Created Time: Thu 02 Nov 2023 10:08:59 AM CST
 *****************************************************/

#include "ni_fifo.h"

#include <memory.h>

#define min(x, y) ((x) < (y) ? (x) : (y))

static inline uint32_t roundup_pow_of_two(uint32_t v)
{
    v--;
    v |= v >> 1;
    v |= v >> 2;
    v |= v >> 4;
    v |= v >> 8;
    v |= v >> 16;
    v++;
    return v;
}

int CNiFifoImpl::Alloc(uint32_t size, uint32_t esize)
{
    size = roundup_pow_of_two(size);

    m_in = 0;
    m_out = 0;
    m_esize = esize;

    if (size < 2) {
        m_data = nullptr;
        m_mask = 0;
        printf("should not less than 2\n");
        return -1;
    }
    m_data = (char*)malloc(esize * size);
    if (!m_data) {
        m_mask = 0;
        printf("memory malloc failed\n");
        return -2;
    }
    m_mask = size - 1;
    return 0;
}

void CNiFifoImpl::CopyIn(const void* src, uint32_t len, uint32_t off)
{
    uint32_t size = m_mask + 1;
    uint32_t esize = m_esize;
    uint32_t l;

    off &= m_mask;
    if (esize != 1) {
        off *= esize;
        size *= esize;
        len *= esize;
    }
    l = min(len, size - off);

    memcpy((char*)m_data + off, src, l);
    memcpy(m_data, (char*)src + l, len - l);

    std::atomic_thread_fence(std::memory_order_release);
}

uint32_t CNiFifoImpl::In(const void* buf, uint32_t len)
{
    uint32_t l;
    l = Unused();
    if (len > l) len = l;

    CopyIn(buf, len, m_in);
    m_in += len;
    return len;
}

void CNiFifoImpl::CopyOut(void* dst, uint32_t len, uint32_t off)
{
    uint32_t size = m_mask + 1;
    uint32_t esize = m_esize;
    uint32_t l;

    off &= m_mask;
    if (esize != 1) {
        off *= esize;
        size *= esize;
        len *= esize;
    }
    l = min(len, size - off);

    memcpy(dst, m_data + off, l);
    memcpy((char*)dst + l, m_data, len - l);

    std::atomic_thread_fence(std::memory_order_release);
}

uint32_t CNiFifoImpl::OutPeek(void* buf, uint32_t len)
{
    uint32_t l;
    l = m_in - m_out;
    if(len > l) len = l;

    CopyOut(buf, len, m_out);

    return len;
}

uint32_t CNiFifoImpl::Out(void* buf, uint32_t len)
{
    len = OutPeek(buf, len);
    m_out += len;
    return len;
}
