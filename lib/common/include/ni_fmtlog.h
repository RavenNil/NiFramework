/******************************************************
  > File Name: ni_fmtlog.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月05日 星期三 22时59分21秒
 *****************************************************/

#ifndef __NI_FMTLOG_H__
#define __NI_FMTLOG_H__

#include "fmt/printf.h"

#include <string>
class CFmtLogger
{
   public:
    CFmtLogger() {}
    void Info(const std::string &msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Debug(const std::string &msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Warn(const std::string &msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
    void Error(const std::string &msg)
    {
        fmt::printf(msg);
        fmt::printf("\n");
    }
};
#endif
