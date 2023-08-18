/******************************************************
  > File Name: ni_log.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Fri 18 Aug 2023 02:25:29 PM CST
 *****************************************************/

#include "ni_log.h"
#include "ni_singleton.h"

#if defined(WITH_SPDLOG)

#include "ni_spdlog.h"
using CLogger = CNiSingleton<CSpdLogger>;

#elif defined(WITH_GLOG)

#include "ni_glog.h"
using CLogger = CNiSingleton<CGlogger>;

#else 

#include "ni_fmtlog.h"
using CLogger = CNiSingleton<CFmtLogger>;

#endif

int ni_log_print(NI_LOG_LEVEL_E eLevel, const char *format, ...)
{
    switch (eLevel) {
        case NI_LOG_LEVEL_DBG:
            CLogger::Instance().Debug(format);
            break;
        case NI_LOG_LEVEL_INFO:
            CLogger::Instance().Info(format);
            break;
        case NI_LOG_LEVEL_WARN:
            CLogger::Instance().Warn(format);
            break;
        case NI_LOG_LEVEL_ERR:
            CLogger::Instance().Error(format);
            break;
        default:
            CLogger::Instance().Debug(format);
            break;
    }

    return 0;
}
