
cmake_minimum_required(VERSION 3.16)
project(event)

set(CMAKE_CXX_STANDARD 14)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# genarate compile_commands.json file
# some camke version may occurs wired problem(such as 3.10)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()

if(NOT DEFINED VENDOR)
    set(VENDOR "LOCAL")
endif()

# 如果不是本地编译，也即属于交叉编译，不搜寻本地路径
# if(NOT ${VENDOR} STREQUAL "LOCAL")
#     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -nostdinc")
#     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -nostdinc")
# endif()

if(DEFINED CMAKE_TOOLCHAIN_FILE)
    include(${CMAKE_TOOLCHAIN_FILE})
endif()

if(${VENDOR} STREQUAL "IMX6ULL")
    message("Detected VENDOR is IMX6ULL")
elseif(${VENDOR} STREQUAL "LOCAL")
    message("Detected VENDOR is LOCAL")
else()
    message(FATAL_ERROR "Unknown VENDOR")
endif()


# global header files
include_directories(./include)

add_subdirectory(./lib/ni_common/)


include(cmake/utils.cmake)

set(SOURCE_DIRS src)
nicmake_list_source_directories(SOURCE_FILES ${SOURCE_DIRS})

add_executable(event ${SOURCE_FILES})
target_link_libraries(event PRIVATE ni_common pthread)
