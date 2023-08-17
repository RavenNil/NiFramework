/******************************************************
  > File Name: event.h
  > Author: NilRaven
  >
  > Created Time: 2023年04月09日 星期日 22时41分39秒
 *****************************************************/

#pragma once

#include <cstdint>

constexpr size_t NIEVENT_DEFAULT_HASH = 0x811c9dc5;
constexpr size_t NIEVENT_HASH_FACTOR = 0x01000193;
inline constexpr size_t hash_fnv1a(const char* str, size_t value = NIEVENT_DEFAULT_HASH)
{
    return (*str == '\0') ? value : hash_fnv1a(str + 1, (value ^ *str) * NIEVENT_HASH_FACTOR);
}

inline constexpr size_t compile_time_hash(const char* str) { return hash_fnv1a(str); }

template <typename TDerived, size_t hash_id>
class CNiEventCRTPBase
{
   public:
    static constexpr size_t hash() { return hash_id; }
};

#define NIEVENT(DERIVED) CNiEventCRTPBase<DERIVED, compile_time_hash(#DERIVED)>
