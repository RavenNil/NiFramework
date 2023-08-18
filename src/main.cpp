/******************************************************
  > File Name: main.cpp
  > Author: NilNever
  > 
  > Created Time: 2023年04月02日 星期日 19时01分02秒
 *****************************************************/

#include <iostream>
using namespace std;

#include "ni_common/ni_log.h"

#include "asio.hpp"
#include "asio/executor_work_guard.hpp"

int main (int argc, char *argv[])
{
    
    asio::io_context ioc;

    asio::executor_work_guard<asio::io_context::executor_type> work_guard(
        ioc.get_executor());

    ni_log_print(NI_LOG_LEVEL_DBG, "teset test");

    ioc.run();

    return 0;
}
