/******************************************************
  > File Name: main.cpp
  > Author: NilRaven
  > 
  > Created Time: 2023年04月02日 星期日 19时01分02秒
 *****************************************************/

#include <chrono>
#include <iostream>
#include <thread>
using namespace std;

#include "ni_common/ni_common.h"

#include "CLI11.hpp"

struct Event_1 : public CNIEVENT(Event_1) {
    int a;
    double b;
};
struct Event_2 : public CNIEVENT(Event_2) {
    int a;
    double b;
    double c;
    double h;
};

class Test1 : public CNiActor
{
   public:
    int MsgHandle(uint64_t eventid, void* param2) final
    {
        printf("test 1 handle msg %lu eventid\n", eventid);
        return 0;
    }
};

class Test2 : public CNiActor
{
   public:
    int MsgHandle(uint64_t eventid, void* param2) final
    {
        switch (eventid) {
            case Event_2::hash():
                printf("test 2 handle msg %lu eventid\n", eventid);
        }

        return 0;
    }
};

int main (int argc, char *argv[])
{

    Test1 test1;
    test1.RegisterEvent<Event_1>();
    test1.RegisterEvent<Event_2>();

    Test2 test2;
    test1.RegisterEvent<Event_1>();
    test1.RegisterEvent<Event_2>();


    while (1) {
        Event_1 event;
        test1.PostEvent(event);

        Event_2 event_2;
        test1.PostEvent(event_2);

        std::this_thread::sleep_for(std::chrono::seconds(1));
    }


    return 0;
}
