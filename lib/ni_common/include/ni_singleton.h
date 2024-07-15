/******************************************************
  > File Name: lib/common/include/ni_singleton.h
  > Author: NilRaven
  > 
  > Created Time: Wed Aug  9 00:30:17 2023
 *****************************************************/

#pragma once

// 单例宏，推荐在类的定义中，首行使用
// 必须自己实现构造函数
#define NI_SINGLETON_DECLARE(SingletonClass)                   \
   public:                                                     \
    static SingletonClass& Instance()                          \
    {                                                          \
        static SingletonClass instance;                        \
        return instance;                                       \
    }                                                          \
                                                               \
   private:                                                    \
    SingletonClass(const SingletonClass&) = delete;            \
    SingletonClass& operator=(const SingletonClass&) = delete; \
    SingletonClass(SingletonClass&&) = delete;                 \
    SingletonClass& operator=(SingletonClass&&) = delete;      \
    ~SingletonClass() = default;

//使用例子
// class CSingletonExample
// {
//     NI_SINGLETON_DECLARE(CSingletonDemo)
// public:
// int a;
// };
