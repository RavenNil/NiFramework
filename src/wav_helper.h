/******************************************************
  > File Name: wav_helper.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Thu 07 Dec 2023 02:57:13 PM CST
 *****************************************************/

#include <string>
#include <type_traits>

// 将小端数据转换为当前平台的格式（32位）
template <typename T,
          std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 4, void *> = nullptr>
T le_to_native(T value) {
    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    return value; // 小端平台，不需要转换
    #else
    return ((value >> 24) & 0xff) | ((value << 8) & 0xff0000) | ((value >> 8) & 0xff00) | ((value << 24) & 0xff000000);
    #endif
}

// 将小端数据转换为当前平台的格式（16位）
template <typename T,
          std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 2, void *> = nullptr>
T le_to_native(T value) {
    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
    return value; // 小端平台，不需要转换
    #else
    return (value >> 8) | (value << 8);
    #endif
}

// 将大端数据转换为当前平台的格式（16位）
template <typename T,
          std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 2, void *> = nullptr>
T be_to_native(T value) {
#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
  return value; // 大端平台，不需要转换
#else
  return (value >> 8) | (value << 8);
#endif
}
// 将大端数据转换为当前平台的格式（32位）
template <typename T,
          std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 4, void *> = nullptr>
T be_to_native(T value) {
#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
  return value; // 大端平台，不需要转换
#else
  return ((value >> 24) & 0xff) | ((value << 8) & 0xff0000) |
         ((value >> 8) & 0xff00) | ((value << 24) & 0xff000000);
#endif
}

struct WAVHeaderPacked {
  uint32_t u32riff_header_b; // string no need chagne
  uint32_t u32wav_size_l;
  uint32_t u32wave_header_b;
  uint32_t u32fmt_header_b;
  uint32_t u32fmt_chunk_size_l;
  uint16_t u16audio_format_l;
  uint16_t u16num_channels_l;
  uint32_t u32sample_rate_l;
  uint32_t u32byte_rate_l;
  uint16_t u16sample_alignment_l;
  uint16_t u16bit_depth_l;
  uint32_t u32sub_chunk_2_id_b;
  uint32_t u32sub_chunk_2_size_l;
} __attribute__((packed));

struct WAVHeader{
    union {
      uint32_t u32;
      char str[5];
    } uriff_header;
    uint32_t u32wav_size;
    union {
      uint32_t u32;
      char str[5];
    } uwave_header;
    union {
      uint32_t u32;
      char str[5];
    } ufmt_header;
    uint32_t u32fmt_chunk_size ;
    uint16_t u16audio_format;
    uint16_t u16num_channels;
    uint32_t u32sample_rate;
    uint32_t u32byte_rate;
    uint16_t u16sample_alignment;
    uint16_t u16bit_depth;
    union {
      uint32_t u32;
      char str[5];
    } usub_chunk_2_id;
    uint32_t u32sub_chunk_2_size;
};

int read_wav_header(const std::string& filename, WAVHeader &header);
