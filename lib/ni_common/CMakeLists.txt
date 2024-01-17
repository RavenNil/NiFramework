
project(ni_common)

cmake_minimum_required(VERSION 3.16)


set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
add_subdirectory(./3thParty/fmt-9.1.0/)
unset(CMAKE_POSITION_INDEPENDENT_CODE)

option(WITH_SPDLOG "Log library use spdlog" ON)
option(WITH_GLOG "Log library use glog" OFF)

option(WITH_LIBHV "event library use libhv" ON)

# 默认隐藏所有符号
set(CMAKE_VISIBILITY_INLINES_HIDDEN TRUE)
set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)


#各模块源码目录
set(NI_COMMON_SRCDIR . log event)

#依赖到的库
set(NI_COMMON_ALL_LIBS fmt::fmt-header-only)


set(LIB_NI_COMMON_HEADERS "")

#misc
set(LIB_NI_COMMON_HEADERS ${LIB_NI_COMMON_HEADERS} ni_common.h niexport.h niconfig.h)

# component
file(GLOB_RECURSE INCLUDE_HEADERS include/*.h)
set(LIB_NI_COMMON_HEADERS ${LIB_NI_COMMON_HEADERS} ${INCLUDE_HEADERS})

#log
set(LIB_NI_COMMON_HEADERS ${LIB_NI_COMMON_HEADERS} log/ni_log.h)

#event bus
set(LIB_NI_COMMON_HEADERS ${LIB_NI_COMMON_HEADERS} ./event/ni_bus.h ./event/ni_actor.h ./event/ni_event.h)


configure_file(${CMAKE_CURRENT_SOURCE_DIR}/niconfig.h.in ${CMAKE_CURRENT_SOURCE_DIR}/niconfig.h)

if(WITH_SPDLOG)
    add_subdirectory(./3thParty/spdlog-1.11.0/)
    set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} spdlog::spdlog)
endif()

if(WITH_GLOG)
    add_subdirectory(./3thParty/glog-0.6.0/)
    set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} glog::glog)
endif()

if(WITH_GLOG AND WITH_SPDLOG)
    message(FATAL_ERROR "Not Allow use both spdlog and glog")
endif()

# event library
if(WITH_LIBHV)
    add_subdirectory(./3thParty/libhv-1.3.1/)
    set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} hv_static)
endif()


add_subdirectory(./3thParty/libsigc++-3.6.0/)
set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} sigc-3.0)


file(INSTALL ${LIB_NI_COMMON_HEADERS} DESTINATION ${PROJECT_BINARY_DIR}/include/ni_common)
# file(INSTALL ${LIB_NI_COMMON_HEADERS} DESTINATION ${PROJECT_SOURCE_DIR}/include/)

include(cmake/utils.cmake)
nicmake_list_source_directories(SOURCE_FILES ${NI_COMMON_SRCDIR})
# file(GLOB_RECURSE SOURCE_FILES ${SROUCE})

add_library(ni_common SHARED)
# target_compile_options(ni_common PRIVATE -fPIC)
target_sources(ni_common PRIVATE ${SOURCE_FILES})
target_include_directories(ni_common PRIVATE ${NI_COMMON_SRCDIR}
    # INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include> $<INSTALL_INTERFACE:include>
    INTERFACE ${PROJECT_BINARY_DIR}/include/
    PRIVATE ${PROJECT_BINARY_DIR}/include/ni_common
)
target_link_libraries(ni_common PRIVATE ${NI_COMMON_ALL_LIBS})





