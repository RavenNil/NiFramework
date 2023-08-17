/******************************************************
  > File Name: ni_glog.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月06日 星期四 00时00分19秒
 *****************************************************/

#ifndef __NI_GLOG_H__
#define __NI_GLOG_H__

#include "glog/logging.h"

#include <string>
class CGLogger
{
   public:
    CGLogger()
    {
        google::InitGoogleLogging("glog");
        // google::SetLogDestination(google::GLOG_INFO, "/path/to/log/file");  // 设置日志文件路径
        FLAGS_minloglevel = 0;
        FLAGS_logtostderr = true;
    }
    void Info(const std::string &msg) { LOG(INFO) << msg; }
    void Debug(const std::string &msg) { LOG(INFO) << msg; }
    void Warn(const std::string &msg) { LOG(WARNING) << msg; }
    void Error(const std::string &msg) { LOG(ERROR) << msg; }
};
#endif
