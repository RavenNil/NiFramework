
project(event)

cmake_minimum_required(VERSION 3.16)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# genarate compile_commands.json file
# some camke version may occurs wired problem(such as 3.10)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()


if(${PLATFORM} STREQUAL "IMX6ULL")
    message("Detected Platform is IMX6ULL")
elseif(${PLATFORM} STREQUAL "X86_64")
    message("Detected Platform is X86_64")
else()
    message(FATAL_ERROR "Unknown platform")
endif()


# global header files
include_directories(./include)


# src code
add_subdirectory(./src)
