/******************************************************
  > File Name: ni_spdlog.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Fri 18 Aug 2023 02:59:34 PM CST
 *****************************************************/

#pragma once

#include "ni_singleton.h"
#include "spdlog/common.h"
#include "spdlog/sinks/rotating_file_sink.h"
#include "spdlog/spdlog.h"

#include <cstddef>

class CSpdLogger
{
    NI_SINGLETON_DECLARE(CSpdLogger)
   public:
    CSpdLogger()
    {
        const char *strPattern = "[%Y%m%d %H:%M:%S %z][%^%l%$] [thread %t] %v";
        spdlog::set_pattern(strPattern);

//debug模式，要加打印
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

    void Info(const char *msg)
    {
        spdlog::info(msg);
        spdlog::get("file")->info(msg);
    }
    void Debug(const char *msg)
    {
        spdlog::debug(msg);
        spdlog::get("file")->debug(msg);
    }
    void Warn(const char *msg)
    {
        spdlog::warn(msg);
        spdlog::get("file")->warn(msg);
    }
    void Error(const char *msg)
    {
        spdlog::error(msg);
        spdlog::get("file")->error(msg);
    }
};
