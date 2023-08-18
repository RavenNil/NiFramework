/******************************************************
  > File Name: ni_log.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Fri 18 Aug 2023 01:55:46 PM CST
 *****************************************************/
#pragma once

#include "niconfig.h"
#include "niexport.h"

#ifdef __cplusplus
extern "C" {
#endif

enum NI_LOG_LEVEL_E {
    NI_LOG_LEVEL_DBG,
    NI_LOG_LEVEL_INFO,
    NI_LOG_LEVEL_WARN,
    NI_LOG_LEVEL_ERR,
};

NI_EXPORT int ni_log_print(NI_LOG_LEVEL_E eLevel, const char *format, ...);

#ifdef __cplusplus
}
#endif
