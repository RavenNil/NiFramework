/******************************************************
  > File Name: ni_fifo.cpp
  > Author: NilRaven
  > Description:
  >
  > Created Time: Thu 02 Nov 2023 10:08:59 AM CST
 *****************************************************/

#include "ni_fifo.h"

#include "ni_log.h"
#include <memory.h>
#include <cstdlib>


template <typename T>
T min(T x, T y)
{
    return x < y ? x : y;
}

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


static void ni_fifo_copy_in(ni_fifo_t* pFifo, const void* src, uint32_t len, uint32_t off)
{
    uint32_t size = pFifo->m_mask + 1;
    uint32_t esize = pFifo->m_esize;
    uint32_t l;

    off &= pFifo->m_mask;
    if (esize != 1) {
        off *= esize;
        size *= esize;
        len *= esize;
    }
    l = min(len, size - off);

    memcpy((char*)pFifo->m_data + off, src, l);
    memcpy(pFifo->m_data, (char*)src + l, len - l);

    std::atomic_thread_fence(std::memory_order_release);
}
static void ni_fifo_copy_out(ni_fifo_t* pFifo, void* dst, uint32_t len, uint32_t off)
{
    uint32_t size = pFifo->m_mask + 1;
    uint32_t esize = pFifo->m_esize;
    uint32_t l;

    off &= pFifo->m_mask;
    if (esize != 1) {
        off *= esize;
        size *= esize;
        len *= esize;
    }
    l = min(len, size - off);

    memcpy(dst, pFifo->m_data + off, l);
    memcpy((char*)dst + l, pFifo->m_data, len - l);

    std::atomic_thread_fence(std::memory_order_release);
}

ni_fifo_t* ni_fifo_alloc(uint32_t size, uint32_t esize)
{
    ni_fifo_t* newfifo = new ni_fifo_t;
    size = roundup_pow_of_two(size);

    newfifo->m_in = 0;
    newfifo->m_out = 0;
    newfifo->m_esize = esize;

    if (size < 2) {
        newfifo->m_data = nullptr;
        newfifo->m_mask = 0;
        ni_log_print(NI_LOG_LEVEL_WARN, "should not less than 2\n");
        delete newfifo;
        return nullptr;
    }
    newfifo->m_data = (char*)malloc(esize * size);
    if (!newfifo->m_data) {
        newfifo->m_mask = 0;
        ni_log_print(NI_LOG_LEVEL_WARN, "memory malloc failed\n");
        delete newfifo;
        return nullptr;
    }

    newfifo->m_mask = size - 1;
    return newfifo;
}

int ni_fifo_free(ni_fifo_t* pFifo)
{
    if (pFifo->m_data) {
        free(pFifo->m_data);
    }
    delete pFifo;
    return 0;
}

int ni_fifo_in(ni_fifo_t* pFifo, const void* buf, uint32_t len)
{
    int l;
    l = ni_fifo_unused(pFifo);
    if (len > l) len = l;

    ni_fifo_copy_in(pFifo, buf, len, pFifo->m_in);
    pFifo->m_in += len;
    return len;
}

int ni_fifo_out_peek(ni_fifo_t* pFifo, void* buf, uint32_t len)
{
    int l;
    l = pFifo->m_in - pFifo->m_out;
    if(len > l) len = l;

    ni_fifo_copy_out(pFifo, buf, len, pFifo->m_out);
    return len;
}

int ni_fifo_out(ni_fifo_t* pFifo, void* buf, uint32_t len)
{
    len = ni_fifo_out_peek(pFifo, buf, len);
    pFifo->m_out += len;
    return len;
}

bool ni_fifo_is_full(ni_fifo_t* pFifo)
{  //
    return ni_fifo_len(pFifo) > pFifo->m_mask;
}

bool ni_fifo_is_empty(ni_fifo_t* pFifo)
{
    //
    return pFifo->m_in == pFifo->m_out;
}

int ni_fifo_len(ni_fifo_t* pFifo)
{
    //
    return pFifo->m_in - pFifo->m_out;
}

void ni_fifo_reset_out(ni_fifo_t* pFifo)
{
    //
    pFifo->m_out = pFifo->m_in;
}

void ni_fifo_reset(ni_fifo_t* pFifo)
{
    //
    pFifo->m_out = pFifo->m_in = 0;
}

int ni_fifo_size(ni_fifo_t* pFifo)
{
    //
    return pFifo->m_mask +1;
}

bool ni_fifo_inited(ni_fifo_t* pFifo)
{
    //
    return pFifo->m_mask > 0;
}

/**
 * @brief 和Unused一样
 *
 * @return
 */

int ni_fifo_avail(ni_fifo_t* pFifo)
{
    //
    return ni_fifo_size(pFifo) - ni_fifo_len(pFifo);
}

int ni_fifo_unused(ni_fifo_t* pFifo)
{
    //
    return (pFifo->m_mask + 1) - (pFifo->m_in - pFifo->m_out);
}
