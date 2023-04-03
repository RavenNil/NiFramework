/******************************************************
  > File Name: ni_log.cpp
  > Author: NilRaven
  > 
  > Created Time: 2023年04月03日 星期一 23时04分06秒
 *****************************************************/

#include "ni_log.h"

#include "spdlog/common.h"
#include "spdlog/sinks/rotating_file_sink.h"
#include "spdlog/spdlog.h"

#include <cstdio>
#include <stdarg.h>
#include <string>

using namespace std;

CNiLog::CNiLog()
{
    const char* strPattern = "[%Y%m%d %H:%M:%S %z][%^%l%$] [thread %t] %v";
    spdlog::set_pattern(strPattern);

#ifndef NDEBUG
    spdlog::set_level(spdlog::level::debug);
#else
    spdlog::set_level(spdlog::level::off);
#endif

    size_t max_size = 500 * 1024;
    size_t max_files = 5;
    spdlog::rotating_logger_mt("file", "./ni.log", max_size, max_files);
    spdlog::get("file")->set_pattern(strPattern);
    spdlog::get("file")->set_level(spdlog::level::info);
    spdlog::flush_every(std::chrono::seconds(2));
}

void CNiLog::Info(const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    // spdlog::info(fmt, args);
    // spdlog::get("file")->info(fmt, args);
    va_end(args);
}

void CNiLog::Debug(const char* fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    // spdlog::debug(fmt, args);
    // spdlog::get("file")->debug(fmt, args);
    va_end(args);
}

void CNiLog::Error(const char* fmt, ...){
    va_list args;
    va_start(args, fmt);
    // spdlog::error(fmt, args);
    // spdlog::get("file")->error(fmt, args);
    va_end(args);

}
