/******************************************************
  > File Name: ni_iactor.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Mon 15 Jul 2024 02:56:56 PM CST
 *****************************************************/

#pragma once

#if defined(__cplusplus)

#include <cstddef>
#include <cstdint>

class INiActor
{
   public:
    virtual ~INiActor() = default;
    virtual int MsgHandle(uint64_t eventid, void* param2) = 0;
};

#endif
