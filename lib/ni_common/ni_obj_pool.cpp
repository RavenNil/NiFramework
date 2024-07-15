/******************************************************
  > File Name: ni_obj_pool.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Wed 08 Nov 2023 11:00:25 AM CST
 *****************************************************/

#include "include/ni_obj_pool.h"

#include <memory.h>
#include <cstdio>
#include <cstdlib>

static constexpr int NEXT_IS_NULL = -1;

struct obj_stack_node {
    obj_stack_node() : pData(nullptr), s32Next(NEXT_IS_NULL) {}
    void* pData;
    int s32Next;
};

struct obj_cache_list_node {
    void* pData = nullptr;
    obj_cache_list_node* next = nullptr;
    obj_cache_list_node* prev = nullptr;
};

typedef struct ni_obj_pool_impl_s {
    void* pPreBufBegin = nullptr;
    void* pPreBufEnd = nullptr;
    std::unique_ptr<obj_stack_node[]> mng_array;
    obj_stack_node free_stack;            // dummy stack head
    obj_stack_node used_stack;            // dummy stack head

    obj_cache_list_node free_cache_list_head;
    obj_cache_list_node free_cache_list_tail;

    obj_cache_list_node used_cache_list_head;
    obj_cache_list_node used_cache_list_tail;

    int s32AvailAble;  //可分配的元素个数
    int s32Len;        //总元素个数
} ni_obj_pool_impl_t;

static void list_push_front(obj_cache_list_node& head, obj_cache_list_node* node)
{
    node->next = head.next;
    node->prev = &head;
    node->next->prev = node;
    node->prev->next = node;
}

static obj_cache_list_node* list_pop_front(obj_cache_list_node& head)
{
    if (!head.next || !head.next->next) return nullptr;

    obj_cache_list_node* curNode = head.next;
    head.next = curNode->next;
    curNode->next->prev = &head;

    return curNode;
}

static void list_pop(obj_cache_list_node* node)
{
    node->next->prev = node->prev;
    node->prev->next = node->next;
}

//判断是否在预分配的pool中
static bool is_obj_in_prealloced(ni_obj_pool_impl_t& objPool, void* objptr)
{
    if (objptr < objPool.pPreBufBegin || objptr > objPool.pPreBufEnd) return false;

    return true;
}

static int free_obj_in_cache_stack(ni_obj_pool_impl_t& objPool, void* objptr)
{
    //
    obj_cache_list_node& freeListHead = objPool.free_cache_list_head;
    obj_cache_list_node& usedListHead = objPool.used_cache_list_head;
    obj_cache_list_node& usedListTail = objPool.used_cache_list_tail;

    //释放给池，需要确认确实用到该地址才行
    obj_cache_list_node* curNode = usedListHead.next;
    while (curNode != &usedListTail) {
        if (curNode->pData != objptr) {
            curNode = curNode->next;
            continue;
        }
        list_pop(curNode);
        list_push_front(freeListHead, curNode);

        ++objPool.s32AvailAble;
        return 0;
    }

    printf("WARN: try to free a non managed addres\n");
    return -1;
}

static int free_prealloced_obj(ni_obj_pool_impl_t& objPool, void* objptr)
{
    obj_stack_node& usedStack = objPool.used_stack;
    obj_stack_node& freeStack = objPool.free_stack;
    obj_stack_node* mngArray = objPool.mng_array.get();

    if (NEXT_IS_NULL == usedStack.s32Next) {
        printf("Used Stack is Max, do not allow free any\n");
        return -1;
    }

    int s32UsedIdx = usedStack.s32Next;
    usedStack.s32Next = mngArray[s32UsedIdx].s32Next;
    mngArray[s32UsedIdx].pData = objptr;
    // pNode->s32Next = nullptr;//非必须，同上

    mngArray[s32UsedIdx].s32Next = freeStack.s32Next;
    freeStack.s32Next = s32UsedIdx;

    ++objPool.s32AvailAble;

    return 0;
}

static void* alloc_obj_in_prealloc_pool(ni_obj_pool_impl_t& objPool)
{
    obj_stack_node& usedStack = objPool.used_stack;
    obj_stack_node& freeStack = objPool.free_stack;
    obj_stack_node* mngArray = objPool.mng_array.get();

    if (NEXT_IS_NULL == freeStack.s32Next) {
        printf("not enough space in prealloc pool\n");
        return nullptr;
    }
    int s32FreeIdx = freeStack.s32Next;
    freeStack.s32Next = mngArray[s32FreeIdx].s32Next;

    mngArray[s32FreeIdx].s32Next = usedStack.s32Next;
    usedStack.s32Next = s32FreeIdx;

    --objPool.s32AvailAble;

    return mngArray[s32FreeIdx].pData;
}


static void* alloc_obj_in_cache_stack(ni_obj_pool_impl_t& objPool, int objsize)
{
    obj_cache_list_node& freeListHead = objPool.free_cache_list_head;
    obj_cache_list_node& usedListHead = objPool.used_cache_list_head;

    obj_cache_list_node* node = list_pop_front(freeListHead);
    if (node) {
        list_push_front(usedListHead, node);
        --objPool.s32AvailAble;
        return node->pData;
    }

    //已经没有空闲的
    printf("cache stack is full, try  malloc new one\n");
    obj_cache_list_node* pNewNode = (obj_cache_list_node*)malloc(sizeof(obj_cache_list_node));
    if (!pNewNode) {
        printf("error: malloc obj_cache_stack_node fail\n");
        return nullptr;
    }
    pNewNode->pData = malloc(objsize);
    if (!pNewNode->pData) {
        free(pNewNode);
        printf("error malloc obj_cache_stack_node->pData fail\n");
        return nullptr;
    }

    list_push_front(freeListHead, pNewNode);
    ++objPool.s32Len;
    ++objPool.s32AvailAble;

    return alloc_obj_in_cache_stack(objPool, objsize);
}

ni_obj_pool_t* ni_opool_alloc()
{
    //
    ni_obj_pool_t* newObjPool = nullptr;
    newObjPool = (ni_obj_pool_t*)malloc(sizeof(ni_obj_pool_t));
    if (!newObjPool) {
        printf("ni_obj_pool_t malloc fail\n");
        return nullptr;
    }

    newObjPool->pImpl = (ni_obj_pool_impl_t*)malloc(sizeof(ni_obj_pool_impl_t));
    if (!newObjPool->pImpl) {
        free(newObjPool);
        printf("ni_obj_pool_impl_t malloc fail\n");
        return nullptr;
    }
    newObjPool->pImpl->free_stack.s32Next = NEXT_IS_NULL;
    newObjPool->pImpl->used_stack.s32Next = NEXT_IS_NULL;

    newObjPool->pImpl->free_cache_list_head.prev = nullptr;
    newObjPool->pImpl->free_cache_list_head.next = &newObjPool->pImpl->free_cache_list_tail;
    newObjPool->pImpl->free_cache_list_tail.next = nullptr;
    newObjPool->pImpl->free_cache_list_tail.prev = &newObjPool->pImpl->free_cache_list_head;

    newObjPool->pImpl->used_cache_list_head.prev = nullptr;
    newObjPool->pImpl->used_cache_list_head.next = &newObjPool->pImpl->used_cache_list_tail;
    newObjPool->pImpl->used_cache_list_tail.next = nullptr;
    newObjPool->pImpl->used_cache_list_tail.prev = &newObjPool->pImpl->used_cache_list_head;

    return newObjPool;
}

int ni_opool_init(ni_obj_pool_t* pObjPool, int s32ObjCnt, int s32ObjSize)
{
    if (pObjPool == nullptr || pObjPool->pImpl == nullptr || s32ObjCnt <= 0 || s32ObjSize <= 0) {
        printf("ni_opool_init fail param not legal\n");
        return -1;
    }

    pObjPool->s32ObjSize = s32ObjSize;

    ni_obj_pool_impl_t& objPoolImpl = *pObjPool->pImpl;

    //申请初始资源存储内存
    objPoolImpl.pPreBufBegin = malloc(s32ObjCnt * s32ObjSize);
    if (!objPoolImpl.pPreBufBegin) {
        printf("objpool obj stack malloc fail\n");
        return -1;
    }
    memset(objPoolImpl.pPreBufBegin, 0, s32ObjCnt * s32ObjSize);
    objPoolImpl.pPreBufEnd = (uint8_t*)objPoolImpl.pPreBufBegin + (s32ObjCnt - 1) * s32ObjSize;
    objPoolImpl.s32AvailAble = s32ObjCnt;
    objPoolImpl.s32Len = s32ObjCnt;

    //为默认预分配对象池的管理结构申请空间
    objPoolImpl.mng_array = std::make_unique<obj_stack_node[]>(s32ObjCnt);
    if (!objPoolImpl.mng_array) {
        printf("stack_array Error: malloc fail\n");
        return -1;
    }
    obj_stack_node* mngArray = objPoolImpl.mng_array.get();
    obj_stack_node& freeStack = objPoolImpl.free_stack;
    obj_stack_node& usedStack = objPoolImpl.used_stack;
    for (int i = 0; i < s32ObjCnt; i++) {
        mngArray[i].pData = (uint8_t*)objPoolImpl.pPreBufBegin + i * s32ObjSize;
        mngArray[i].s32Next = freeStack.s32Next;
        freeStack.s32Next = i;
    }

    return 0;
}

int ni_opool_free(ni_obj_pool_t* pObjPool)
{
    if (pObjPool == nullptr) return -1;

    if (pObjPool->pImpl) {
        free(pObjPool->pImpl);
    }
    free(pObjPool);

    return 0;
}

int ni_opool_get_osize(ni_obj_pool_t* pObjPool)
{
    if (pObjPool) {
        return pObjPool->s32ObjSize;
    }
    return 0;
}

void* ni_opool_alloc_obj(ni_obj_pool_t* pObjPool)
{
    if (!pObjPool) {
        return nullptr;
    }

    void* newobj = alloc_obj_in_prealloc_pool(*pObjPool->pImpl);
    if (newobj == nullptr) {
        printf("prealloced pool is full\n");
        newobj = alloc_obj_in_cache_stack(*pObjPool->pImpl, pObjPool->s32ObjSize);
    }

    if (newobj == nullptr) {
    }
    return newobj;
}

int ni_opool_free_obj(ni_obj_pool_t* pObjPool, void* pObj)
{
    if (!pObjPool || !pObjPool->pImpl || !pObj) {
        printf("obj pool or impl is nullptr\n");
        return -1;
    }

    if (is_obj_in_prealloced(*pObjPool->pImpl, pObj)) {
        return free_prealloced_obj(*pObjPool->pImpl, pObj);
    }

    return free_obj_in_cache_stack(*pObjPool->pImpl, pObj);
}

int ni_opool_get_len(ni_obj_pool_t* pObjPool)
{
    if (pObjPool && pObjPool->pImpl) {
        return pObjPool->pImpl->s32Len;
    }
    return 0;
}

int ni_opool_get_available(ni_obj_pool_t* pObjPool)
{

    if (pObjPool && pObjPool->pImpl) {
        return pObjPool->pImpl->s32AvailAble;
    }
    return 0;
}
