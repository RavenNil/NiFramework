/******************************************************
  > File Name: lib/common/include/ni_singleton.h
  > Author: NilRaven
  > 
  > Created Time: Wed Aug  9 00:30:17 2023
 *****************************************************/

#pragma once

/**
 * @brief CTRP mode, singleton helper ,you should add friend in your class
 *
 * @tparam Derived 
 * @return 
 */
template <typename Derived>
class CNiSingleton
{
   public:
    static Derived& Instance()
    {
        static Derived instance;
        return instance;
    }

   protected:
    CNiSingleton() = default;
    ~CNiSingleton() = default;
    CNiSingleton(const CNiSingleton&) = delete;
    CNiSingleton& operator=(const CNiSingleton&) = delete;
};
