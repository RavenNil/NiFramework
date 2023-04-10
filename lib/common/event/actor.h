/******************************************************
  > File Name: actor.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月09日 星期日 23时25分43秒
 *****************************************************/

#pragma once

#include <unistd.h>

class CActor
{
   public:
    virtual ~CActor();
    virtual int OnMessage(size_t eventid, int param1, void* param2, int size) = 0;
};
