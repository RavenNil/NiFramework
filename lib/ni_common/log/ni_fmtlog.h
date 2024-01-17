/******************************************************
  > File Name: ni_fmtlog.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Fri 18 Aug 2023 03:12:43 PM CST
 *****************************************************/

#pragma once

#include "fmt/printf.h"
#include "ni_singleton.h"

class CFmtLogger
{
    NI_SINGLETON_DECLARE(CFmtLogger)
   public:
    void Init() {}
    void Info(const char *msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Debug(const char *msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Warn(const char *msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Error(const char *msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
};
