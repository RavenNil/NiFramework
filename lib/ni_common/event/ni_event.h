/******************************************************
  > File Name: event.h
  > Author: NilRaven
  >
  > Created Time: 2023年04月09日 星期日 22时41分39秒
 *****************************************************/

#pragma once

#include <stdint.h>

#if defined(__cplusplus)

constexpr uint64_t NIEVENT_DEFAULT_HASH = 0x811c9dc5;
constexpr uint64_t NIEVENT_HASH_FACTOR = 0x01000193;
inline constexpr uint64_t hash_fnv1a(const char* str, uint64_t value = NIEVENT_DEFAULT_HASH)
{
    return (*str == '\0') ? value : hash_fnv1a(str + 1, (value ^ *str) * NIEVENT_HASH_FACTOR);
}

inline constexpr uint64_t compile_time_hash(const char* str) { return hash_fnv1a(str); }

template <typename TDerived, uint64_t hash_id>
class CNiEventCRTPBase
{
   public:
    static constexpr uint64_t hash() { return hash_id; }
};

#define CNIEVENT(DERIVED) CNiEventCRTPBase<DERIVED, compile_time_hash(#DERIVED)>

#endif
