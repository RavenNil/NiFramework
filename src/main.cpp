/******************************************************
  > File Name: main.cpp
  > Author: NilNever
  > 
  > Created Time: 2023年04月02日 星期日 19时01分02秒
 *****************************************************/

#include <chrono>
#include <iostream>
#include <thread>
using namespace std;

#include "ni_common/ni_common.h"

#include "CLI11.hpp"

class Event_1 : public CNIEVENT(Event_1)
{
    int a;
    double b;
};

class Test1 : public CNiActor
{
   public:
    virtual int MsgHandle(uint64_t eventid, void* param2) override final
    {
        printf("test 1 handle msg %lu eventid\n", eventid);
        return 0;
    }
};

class Test2 : public CNiActor
{
   public:
    virtual int MsgHandle(uint64_t eventid, void* param2) override final
    {
        printf("test 2 handle msg %lu eventid\n", eventid);
        return 0;
    }
};

int main (int argc, char *argv[])
{
    // auto& bus = CNiBusDefault::Instance();
    // bus.Init();
    //
    // Test1 test1;
    // bus.RegisterEvent<Event_1>(test1);
    //
    // Test2 test2;
    // bus.RegisterEvent<Event_1>(test2);
    //
    // while (1) {
    //     Event_1 event;
    //
    //     bus.PostEvent(event);
    //
    //     std::this_thread::sleep_for(std::chrono::seconds(1));
    // }

    char f = 'b';


    CNiFifo<char> fifo;
    fifo.Init(32);
    fifo.Put('c');
    fifo.Put(f);


    char res;
    fifo.Get(res);
    cout << res << endl;


    fifo.Get(res);
    cout << res << endl;

    return 0;
}
