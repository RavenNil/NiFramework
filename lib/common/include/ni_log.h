/******************************************************
  > File Name: ni_log.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月02日 星期日 23时27分42秒
 *****************************************************/

#ifndef __NI_LOG_H__
#define __NI_LOG_H__

#include <string>

template <typename TLogger>
class TCNiLog
{
   public:
    static TCNiLog &Instance()
    {
        static TCNiLog ins;
        return ins;
    };

    void Info(const std::string &msg) { m_logger.Info(msg); }
    void Debug(const std::string &msg) { m_logger.Debug(msg); }
    void Warn(const std::string &msg) { m_logger.Warn(msg); }
    void Error(const std::string &msg) { m_logger.Error(msg); }

   private:
    TLogger m_logger;
    TCNiLog(){};
    ~TCNiLog(){};
    TCNiLog(const TCNiLog&) = delete;
    TCNiLog(TCNiLog&&) = delete;
    TCNiLog& operator=(TCNiLog&) = delete;
};

#if defined(WITH_SPDLOG)
#include "ni_spdlog.h"
using CNiLog = TCNiLog<CSpdLogger>;
#elif defined(WITH_GLOG)
#include "ni_glog.h"
using CNiLog = TCNiLog<CGLogger>;
#else
#include "ni_fmtlog.h"
using CNiLog = TCNiLog<CFmtLogger>;
#endif

#include "fmt/format.h"

inline void DEBUG(const char *msg) { CNiLog::Instance().Debug(msg); }
template <typename... Args>
inline void DEBUG(const char *fmt, Args &&...args)
{
    std::string msg = fmt::format(fmt, std::forward<Args>(args)...);
    CNiLog::Instance().Debug(msg);
}

inline void INFO(const char *msg) { CNiLog::Instance().Info(msg); }
template <typename... Args>
inline void INFO(const char *fmt, Args &&...args)
{
    std::string msg = fmt::format(fmt, std::forward<Args>(args)...);
    CNiLog::Instance().Info(msg);
}

inline void WARN(const char *msg) { CNiLog::Instance().Warn(msg); }
template <typename... Args>
inline void WARN(const char *fmt, Args &&...args)
{
    std::string msg = fmt::format(fmt, std::forward<Args>(args)...);
    CNiLog::Instance().Warn(msg);
}

inline void ERROR(const char *msg) { CNiLog::Instance().Error(msg); }
template <typename... Args>
inline void ERROR(const char *fmt, Args &&...args)
{
    std::string msg = fmt::format(fmt, std::forward<Args>(args)...);
    CNiLog::Instance().Error(msg);
}

#endif
