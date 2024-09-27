/******************************************************
  > File Name: wav_helper.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Thu 07 Dec 2023 02:57:13 PM CST
 *****************************************************/

#include "wav_helper.h"

#include <memory.h>

#include <cstdint>
#include <fstream>
#include <iostream>
#include <string>

// 读取 WAV 头部信息
int read_wav_header(const std::string &filename, WAVHeader &header)
{
    std::ifstream file(filename, std::ios::binary);

    if (!file.is_open()) {
        std::cout << "Unable to open file: " << filename << std::endl;
        return -1;
    }

    //判断文件大小是否至少44
    file.seekg(0, std::ios::end);
    std::streampos fileSize = file.tellg();
    file.seekg(0, std::ios::beg);
    if (fileSize < 44) {
        std::cout << "File too small: " << filename << std::endl;
        file.close();
        return -1;
    }

    WAVHeaderPacked raw;
    file.read(reinterpret_cast<char *>(&raw), sizeof(raw));

    header.uriff_header.u32 = raw.u32riff_header_b;  // string no need chagne
    header.u32wav_size = le_to_host(raw.u32wav_size_l);
    header.uwave_header.u32 = raw.u32wave_header_b;

    WAVChunkDescPacked stChunkDescPacked = {};
    while (file.read(reinterpret_cast<char *>(&stChunkDescPacked), sizeof(stChunkDescPacked))) {
        struct {
            union {
                uint32_t u32;
                char str[5];
            } uID = {};
            uint32_t u32Size;
        } stChunkDesc;

        stChunkDesc.uID.u32 = stChunkDescPacked.u32chunk_header_b;
        stChunkDesc.uID.str[4] = '\0';
        stChunkDesc.u32Size = le_to_host(stChunkDescPacked.u32chunk_chunk_size_l);
        if (0 == strcmp(stChunkDesc.uID.str, "fmt ")) {
            file.seekg(-8L, std::ios::cur);
            WAVFmtChunkPacked fmt = {};
            file.read(reinterpret_cast<char *>(&fmt), sizeof(fmt));
            // header.u32fmt_chunk_size = le_to_native(fmt.u32fmt_chunk_size_l);
            header.u16audio_format = le_to_host(fmt.u16audio_format_l);
            header.u16num_channels = le_to_host(fmt.u16num_channels_l);
            header.u32sample_rate = le_to_host(fmt.u32sample_rate_l);
            header.u32byte_rate = le_to_host(fmt.u32byte_rate_l);
            header.u16sample_alignment = le_to_host(fmt.u16sample_alignment_l);
            header.u16bit_depth = le_to_host(fmt.u16bit_depth_l);
        } else if (0 == strcmp(stChunkDesc.uID.str, "data")) {
            header.u32DataStartPos =  file.tellg();
            header.u32DataSize = stChunkDesc.u32Size;
            file.seekg(stChunkDesc.u32Size, std::ios::cur);
        } else {
            printf("chunk %s do not care\n", stChunkDesc.uID.str);
            file.seekg(stChunkDesc.u32Size, std::ios::cur);
        }
    }

    file.close();
    return 0;
}

// snd_pcm_format_t trans_format(const uint16_t &u16format, const uint16_t &u16BitsPerSample)
// {
//     enum AudioFormat {
//         PCM = 1,
//         IEEE_FLOAT = 3,
//         // 可以添加其他编码格式的枚举值
//     };
//
//     enum BitDepth {
//         BITS_8 = 8,
//         BITS_16 = 16,
//         BITS_24 = 24,
//         BITS_32 = 32,
//         BITS_64 = 64,
//         // 可以添加其他位深度的枚举值
//     };
//
//     //约定俗称的
//     if (u16format == PCM) {
//         if (u16BitsPerSample == BITS_8) {
//             return SND_PCM_FORMAT_U8;
//         } else if (u16BitsPerSample == BITS_16) {
//             return SND_PCM_FORMAT_S16;
//         } else if (u16BitsPerSample == BITS_24) {
//             return SND_PCM_FORMAT_S24;
//         } else if (u16BitsPerSample == BITS_32) {
//             return SND_PCM_FORMAT_S32;
//         } else {
//             return SND_PCM_FORMAT_UNKNOWN;
//         }
//     } else if (u16format == IEEE_FLOAT) {
//         if (u16BitsPerSample == BITS_32) {
//             return SND_PCM_FORMAT_FLOAT;
//         } else if (u16BitsPerSample == BITS_64) {
//             return SND_PCM_FORMAT_FLOAT64;
//         } else {
//             return SND_PCM_FORMAT_UNKNOWN;
//         }
//     } else {
//         printf("unknown audio format, default to SND_PCM_FORMAT_UNKNOWN\n");
//     }
//
//     return SND_PCM_FORMAT_UNKNOWN;
// }
