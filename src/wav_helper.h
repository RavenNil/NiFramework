/******************************************************
  > File Name: wav_helper.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Thu 07 Dec 2023 02:57:13 PM CST
 *****************************************************/

// #include "alsa/asoundlib.h"
#include <endian.h>

#include <string>
#include <type_traits>

// 将小端数据转换为当前平台的格式（32位）
template <typename T, std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 4, void *> = nullptr>
T le_to_host(T value)
{
    return le32toh(value);
}

// 将小端数据转换为当前平台的格式（16位）
template <typename T, std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 2, void *> = nullptr>
T le_to_host(T value)
{
    return le16toh(value);
}

// 将大端数据转换为当前平台的格式（16位）
template <typename T, std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 2, void *> = nullptr>
T be_to_host(T value)
{
    return be16toh(value);
}
// 将大端数据转换为当前平台的格式（32位）
template <typename T, std::enable_if_t<std::is_integral<std::decay_t<T>>::value, void *> = nullptr,
          std::enable_if_t<sizeof(T) == 4, void *> = nullptr>
T be_to_host(T value)
{
    return be32toh(value);
}

struct WAVHeaderPacked {
  uint32_t u32riff_header_b; // string no need chagne
  uint32_t u32wav_size_l;
  uint32_t u32wave_header_b;
} __attribute__((packed));

struct WAVFmtChunkPacked {
  uint32_t u32fmt_header_b;
  uint32_t u32fmt_chunk_size_l;
  uint16_t u16audio_format_l;
  uint16_t u16num_channels_l;
  uint32_t u32sample_rate_l;
  uint32_t u32byte_rate_l;
  uint16_t u16sample_alignment_l;
  uint16_t u16bit_depth_l;
} __attribute__((packed));

struct WAVChunkDescPacked {
    uint32_t u32chunk_header_b;
    uint32_t u32chunk_chunk_size_l;
} __attribute__((packed));

struct WAVHeader {
    union {
      uint32_t u32;
      char str[5];
    } uriff_header;//RIFF
    uint32_t u32wav_size;  //文件长度 -8
    union {
      uint32_t u32;
      char str[5];
    } uwave_header;  // "WAVE"

    //fmt chunk信息
    uint32_t u32fmt_chunk_size;
    uint16_t u16audio_format;      //音频格式
    uint16_t u16num_channels;      //声道数
    uint32_t u32sample_rate;       //采样率
    uint32_t u32byte_rate;         //字节比特率
    uint16_t u16sample_alignment;  //数据块长度 (channel* sample_bit / 8);
    uint16_t u16bit_depth;         //位深度

    // data chunk信息
    uint32_t u32DataStartPos;      // data数据开始位置
    uint32_t u32DataSize;          // PCM音频数据大小
};

int read_wav_header(const std::string& filename, WAVHeader &header);

// snd_pcm_format_t trans_format(const uint16_t &u16format, const uint16_t &u16BitsPerSample);
