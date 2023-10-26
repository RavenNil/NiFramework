/******************************************************
  > File Name: ni_obj_fixed_pool.h
  > Author: NilRaven
  > Description:
  >
  > Created Time: Wed 25 Oct 2023 04:38:32 AM PDT
 *****************************************************/

#pragma once

#include <memory>

template <typename T>
class CNiObjFixedPool
{
   public:
    //给元素加上前指针和后指针形成链式结构
    template <typename T_ELEM>
    struct CObjStackNode {
        CObjStackNode() = default;

        T_ELEM* pData = nullptr;
        int s32Next = -1;
    };

    ~CNiObjFixedPool()
    {
        if (m_pObjBuf) {
            free(m_pObjBuf);
        }
        if (m_pObjManagerBuf) {
            free(m_pObjManagerBuf);
        }
    }

    int InitSize(int s32InitSize)
    {
        //申请初始资源存储内存
        m_pObjBuf = (T*)malloc(s32InitSize * sizeof(T));
        if (!m_pObjBuf) {
            printf("malloc fail\n");
            return -1;
        }
        memset(m_pObjBuf, 0, s32InitSize * sizeof(T));

        m_pLastObj = m_pObjBuf + (s32InitSize - 1) * sizeof(T);

        //申请管理用结构
        m_pObjManagerBuf = new CObjStackNode<T>[s32InitSize];
        for (int i = 0; i < s32InitSize; i++) {
            m_pObjManagerBuf[i].pData = m_pObjBuf + i * sizeof(T);
            m_pObjManagerBuf[i].s32Next = m_pFreeDummy.s32Next;
            m_pFreeDummy.s32Next = i;
        }

        return 0;
    }

    T* AllocObj()
    {
        if (-1 == m_pFreeDummy.s32Next) {
            printf("not enough space\n");
            return nullptr;
        }

        //存在可以使用的
        //从Free中取出node
        int s32Node = m_pFreeDummy.s32Next;
        m_pFreeDummy.s32Next = m_pObjManagerBuf[s32Node].s32Next;
        // pNode->s32Next = nullptr;//此行非必须，因为接下来会加入到Used中

        //加入到Used中
        m_pObjManagerBuf[s32Node].s32Next = m_pUsedDummy.s32Next;
        m_pUsedDummy.s32Next = s32Node;

        return m_pObjManagerBuf[s32Node].pData;
    }

    int DeallocObj(T* objptr)
    {
        if (!IsInMemRange(objptr)) {
            printf("NOT in managered Memory Range\n");
            return -1;
        }

        if (-1 == m_pUsedDummy.s32Next) {
            printf("Used is Max\n");
            return -2;
        }

        int s32Node = m_pUsedDummy.s32Next;
        m_pUsedDummy.s32Next = m_pObjManagerBuf[s32Node].s32Next;
        m_pObjManagerBuf[s32Node].pData = objptr;
        // pNode->s32Next = nullptr;//非必须，同上

        m_pObjManagerBuf[s32Node].s32Next = m_pFreeDummy.s32Next;
        m_pFreeDummy.s32Next = s32Node;

        return 0;
    }

   private:
    bool IsInMemRange(T* objptr)
    {
        if (objptr < m_pObjBuf || objptr > m_pLastObj) return false;

        return true;
    }

    //对象池的起始地址，管理内存
    T* m_pObjBuf = nullptr;
    //对象管理所需内存的起始地址，管理内存
    CObjStackNode<T>* m_pObjManagerBuf = nullptr;

    //对象池的最后一个对象的地址，用于判断越界，不管理内存
    T* m_pLastObj = nullptr;

    //管理使用的链表
    CObjStackNode<T> m_pFreeDummy;
    CObjStackNode<T> m_pUsedDummy;
};
