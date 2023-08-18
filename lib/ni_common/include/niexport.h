/******************************************************
  > File Name: niexport.h
  > Author: NilRaven
  > Description: 
  > 
  > Created Time: Thu 17 Aug 2023 03:02:01 PM CST
 *****************************************************/

#pragma once

#ifndef NI_EXPORT 
#  ifdef _WIN32
#     if defined(YL_BUILD_SHARED) /* build dll */
#         define  NI_EXPORT __declspec(dllexport)
#     elif !defined(YL_BUILD_STATIC) /* use dll */
#         define  NI_EXPORT __declspec(dllimport)
#     else /* static library */
#         define NI_EXPORT 
#     endif
#  else
#     if __GNUC__ >= 4
#         define  NI_EXPORT __attribute__((visibility("default")))
#     else
#         define NI_EXPORT 
#     endif
#  endif
#endif
