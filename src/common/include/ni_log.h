/******************************************************
  > File Name: ni_log.h
  > Author: NilRaven
  > 
  > Created Time: 2023年04月02日 星期日 23时27分42秒
 *****************************************************/

#ifndef __NI_LOG_H__
#define __NI_LOG_H__

class CNiLog
{
   public:
    static CNiLog& Instance()
    {
        static CNiLog ins;
        return ins;
    };

   private:
    void Info(const char* fmt, ...);
    void Debug(const char* fmt, ...);
    void Error(const char* fmt, ...);

    CNiLog();
    ~CNiLog(){};
    CNiLog(const CNiLog&) = delete;
    CNiLog(CNiLog&&) = delete;
    CNiLog& operator=(CNiLog&) = delete;
};

#endif
