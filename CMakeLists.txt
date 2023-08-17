
project(event)

cmake_minimum_required(VERSION 3.16)

set(CMAKE_CXX_STANDARD 14)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# genarate compile_commands.json file
# some camke version may occurs wired problem(such as 3.10)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()

set(PLATFORM "AUTO")
if(${PLATFORM} STREQUAL "IMX6ULL")
    message("Detected Platform is IMX6ULL")
elseif(${PLATFORM} STREQUAL "AUTO")
    message("Detected Platform is AUTO")
else()
    message(FATAL_ERROR "Unknown platform")
endif()


# global header files
include_directories(./include)

add_subdirectory(./lib/ni_common/)


include(cmake/utils.cmake)

set(SOURCE_DIRS src)
nicmake_list_source_directories(SOURCE_FILES ${SOURCE_DIRS})

add_executable(event ${SOURCE_FILES})
target_link_libraries(event PRIVATE ni_common pthread)
