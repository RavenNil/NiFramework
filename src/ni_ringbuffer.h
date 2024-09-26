/******************************************************
  > File Name: ni_ringbuffer.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Sun 04 Aug 2024 01:24:26 PM CST
 *****************************************************/

#pragma once


#include <stdint.h>

//todo use include ni_export.h
#define NI_EXPORT


struct ni_rbuff_t;

NI_EXPORT ni_rbuff_t* ni_rbuff_alloc(int32_t size, bool bCompact);

NI_EXPORT int ni_rbuff_free(ni_rbuff_t* pRbuff);

/**
 * @brief 往环形缓冲区写入数据
 *
 * @param pRbuff 
 * @param pData 
 * @param len 
 * @return 写入的位置，如果写入失败，返回-1
 */
NI_EXPORT int ni_rbuff_write(ni_rbuff_t* pRbuff, void* pData, uint32_t len);

NI_EXPORT int ni_rbuff_hexdump(ni_rbuff_t* pRbuff, uint32_t offset, uint32_t len);

NI_EXPORT uint8_t* ni_rbuff_raw(ni_rbuff_t* pRbuff);

NI_EXPORT int32_t ni_rbuff_getsize(ni_rbuff_t* pRbuff);


#ifdef __cplusplus

#include <cstdio>
#include <memory>

class CNiRBuff
{
   public:
    explicit CNiRBuff(int32_t size, int32_t align = 1, bool bCompact = false)
    {
        if (size % align) size += (align - size % align);

        m_pRbuff = ni_rbuff_alloc(size, bCompact);
        if (!m_pRbuff) {
            printf("CNiRBuffBase: ni_rbuff_alloc failed\n");
        }
    }

    template <typename T>
    int Write(T& data)
    {
        return ni_rbuff_write(m_pRbuff, &data, sizeof(T));
    }

    int Write(void* pData, uint32_t len) { return ni_rbuff_write(m_pRbuff, pData, len); }

    int HexDump(uint32_t offset, uint32_t len) { return ni_rbuff_hexdump(m_pRbuff, offset, len); }

    uint8_t* Raw() { return ni_rbuff_raw(m_pRbuff); }

    int32_t Size() { return ni_rbuff_getsize(m_pRbuff); }

    ~CNiRBuff()
    {
        if (m_pRbuff) {
            ni_rbuff_free(m_pRbuff);
            m_pRbuff = nullptr;
        }
    }

   private:
    ni_rbuff_t* m_pRbuff{nullptr};
};



class CNiFixedRBuff
{
   public:
    explicit CNiFixedRBuff(int32_t s32AtleastSize, int32_t s32DeadSize)
        : mpBuf(std::make_unique<CNiRBuff>(s32AtleastSize + s32DeadSize))
    {
    }

    int WriteFrame(void* pData, int32_t s32Len) { return mpBuf->Write(pData, s32Len); }

    int ReadFrame(void* pData, int32_t s32Len) { return 0; }

   private:
    std::unique_ptr<CNiRBuff> mpBuf{nullptr};
};

#endif
