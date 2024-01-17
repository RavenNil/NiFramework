/******************************************************
  > File Name: actor.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月09日 星期日 23时25分43秒
 *****************************************************/

#pragma once

#include "niexport.h"
#include <unistd.h>

#include <cstdint>

#if defined(__cplusplus)

class CActor
{
   public:
    static int OnMessage(void* pListener, uint64_t u64EventId, void* pEvent)
    {
        ((CActor*)pListener)->MsgHandle(u64EventId, pEvent);
        return 0;
    }

    virtual ~CActor(){};
    virtual int MsgHandle(size_t eventid, void* param2) = 0;
};

#endif
