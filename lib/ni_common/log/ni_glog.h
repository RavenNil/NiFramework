/******************************************************
  > File Name: ni_glog.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Fri 18 Aug 2023 03:07:15 PM CST
 *****************************************************/

#pragma once

#include "glog/logging.h"
#include "ni_singleton.h"

class CGLogger
{
    NI_SINGLETON_DECLARE(CGLogger)
   public:
    void Init()
    {
        google::InitGoogleLogging("glog");
        // google::SetLogDestination(google::GLOG_INFO, "/path/to/log/file");  // 设置日志文件路径
        FLAGS_minloglevel = 0;
        FLAGS_logtostderr = true;
    }
    void Info(const char* msg) { LOG(INFO) << msg; }
    void Debug(const char* msg) { LOG(INFO) << msg; }
    void Warn(const char* msg) { LOG(WARNING) << msg; }
    void Error(const char* msg) { LOG(ERROR) << msg; }
};
