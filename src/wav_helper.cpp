/******************************************************
  > File Name: wav_helper.cpp
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Thu 07 Dec 2023 02:57:13 PM CST
 *****************************************************/

#include "wav_helper.h"

#include <fstream>
#include <iostream>
#include <memory.h>
#include <string>

// 读取 WAV 头部信息
int read_wav_header(const std::string& filename, WAVHeader &header) {

    std::ifstream file(filename, std::ios::binary);
    WAVHeaderPacked raw;

    if (!file.is_open()) {
      std::cout << "Unable to open file: " << filename << std::endl;
      return -1;
    }

    file.read(reinterpret_cast<char *>(&raw), sizeof(raw));

    header.uriff_header.u32 = raw.u32riff_header_b; // string no need chagne
    header.u32wav_size = le_to_native(raw.u32wav_size_l);
    header.uwave_header.u32 = raw.u32wave_header_b;

    header.ufmt_header.u32 = raw.u32fmt_header_b;
    header.u32fmt_chunk_size = le_to_native(raw.u32fmt_chunk_size_l);
    header.u16audio_format = le_to_native(raw.u16audio_format_l);
    header.u16num_channels = le_to_native(raw.u16num_channels_l);
    header.u32sample_rate = le_to_native(raw.u32sample_rate_l);
    header.u32byte_rate = le_to_native(raw.u32byte_rate_l);
    header.u16sample_alignment = le_to_native(raw.u16sample_alignment_l);
    header.u16bit_depth = le_to_native(raw.u16bit_depth_l);

    header.usub_chunk_2_id.u32 = raw.u32sub_chunk_2_id_b;
    header.u32sub_chunk_2_size = le_to_native(raw.u32sub_chunk_2_size_l);

    return 0;
}


