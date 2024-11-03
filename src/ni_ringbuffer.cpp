/******************************************************
  > File Name: ni_ringbuffer.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Sun 04 Aug 2024 03:52:47 PM CST
 *****************************************************/

#include "ni_ringbuffer.h"

#include <memory.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static int __ni_rbuff_write_split(ni_rbuff_t* pRbuff, void* pData, uint32_t len);
static int __ni_rbuff_write_nosplit(ni_rbuff_t* pRbuff, void* pData, uint32_t len);

struct ni_rbuff_t {
    bool mbCompact{false};
    uint8_t* mpData{nullptr};
    uint32_t mu32WritePos{0};
    int32_t ms32Size{-1};
    int32_t ms32Barrier{-1};  // 指示实际的数据边界
};

ni_rbuff_t* ni_rbuff_alloc(int32_t size, bool bCompact)
{
    ni_rbuff_t* rb = (ni_rbuff_t*)malloc(sizeof(ni_rbuff_t));

    if (!rb) return nullptr;

    rb->mpData = (uint8_t*)malloc(size);
    if (!rb->mpData) {
        free(rb);
        return nullptr;
    }
    rb->ms32Size = size;
    rb->ms32Barrier = size - 1;
    rb->mbCompact = bCompact;

    return rb;
}

int ni_rbuff_free(ni_rbuff_t* pRbuff)
{
    if (!pRbuff) return -1;

    if (pRbuff->mpData) {
        free(pRbuff->mpData);
    }
    free(pRbuff);
    return 0;
}

int ni_rbuff_set_split(ni_rbuff_t* pRbuff, bool bCompact)
{
    if (!pRbuff) return -1;
    pRbuff->mbCompact = bCompact;
    return 0;
}


/**
 * @brief 末尾分裂模式下写入数据
 *
 * @param pRbuff 
 * @param pData 
 * @param len 
 * @return 
 */
static int __ni_rbuff_write_split(ni_rbuff_t* pRbuff, void* pData, uint32_t len)
{
    int s32TailSize = pRbuff->ms32Size - pRbuff->mu32WritePos;
    if (len <= s32TailSize) {
        memcpy(pRbuff->mpData + pRbuff->mu32WritePos, pData, len);
        pRbuff->mu32WritePos += len;
    } else {
        memcpy(pRbuff->mpData + pRbuff->mu32WritePos, pData, s32TailSize);
        memcpy(pRbuff->mpData, (uint8_t*)pData + s32TailSize, len - s32TailSize);
        pRbuff->mu32WritePos = len - s32TailSize;
    }

    return 0;
}

/**
 * @brief 非末尾分裂模式写入数据
 *
 * @param pRbuff 
 * @param pData 
 * @param len 
 * @return 
 */
static int __ni_rbuff_write_nosplit(ni_rbuff_t* pRbuff, void* pData, uint32_t len)
{
    int s32TailSize = pRbuff->ms32Size - pRbuff->mu32WritePos;
    if (len <= s32TailSize) {
        memcpy(pRbuff->mpData + pRbuff->mu32WritePos, pData, len);
        pRbuff->mu32WritePos += len;
    } else {
        // 要写入的数据大于剩余空间，从头开始写
        memcpy(pRbuff->mpData, pData, len);
        pRbuff->ms32Barrier = pRbuff->mu32WritePos;
        pRbuff->mu32WritePos = len;
    }

    return 0;
}

int ni_rbuff_write(ni_rbuff_t* pRbuff, void* pData, uint32_t len)
{
    if(!pRbuff) return -1;
    if (len > pRbuff->ms32Size) return -2;
    int s32WritePos = pRbuff->mu32WritePos;

    if (!pRbuff->mbCompact) {
        __ni_rbuff_write_nosplit(pRbuff, pData, len);
    } else {
        __ni_rbuff_write_split(pRbuff, pData, len);
    }

    return s32WritePos;
}

uint8_t* ni_rbuff_raw(ni_rbuff_t* pRbuff)
{
    if (!pRbuff) return nullptr;
    return pRbuff->mpData;
}


int ni_rbuff_hexdump(ni_rbuff_t* pRbuff, uint32_t offset, uint32_t len)
{
    if (!pRbuff) return -1;
    if (offset + len > pRbuff->ms32Size) {
        // todo use ni_log
        printf("ni_rbuff_hexdump: offset + len > pRbuff->ms32Size\n");
        return -1;
    }

    for (int i = 0; i < len; i++) {
        // todo use ni_log
        printf("%02x ", pRbuff->mpData[offset + i]);
        if (i % 16 == 15) printf("\n");
    }

    return 0;
}

int32_t ni_rbuff_getsize(ni_rbuff_t* pRbuff)
{
    if (!pRbuff) return -1;
    return pRbuff->ms32Size;
}
