
project(ni_common)

cmake_minimum_required(VERSION 3.16)


add_subdirectory(./3thParty/fmt-9.1.0/)

option(WITH_SPDLOG "Log library use spdlog" ON)
option(WITH_GLOG "Log library use glog" OFF)

option(WITH_LIBHV "event library use libhv" ON)

# 默认隐藏所有符号
set(CMAKE_VISIBILITY_INLINES_HIDDEN TRUE)
set(CMAKE_CXX_VISIBILITY_PRESET "hidden")


set(NI_COMMON_SRCDIR .)
set(NI_COMMON_ALL_LIBS fmt::fmt)
set(LIB_NI_COMMON_HEADERS include niexport.h niconfig.h)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/niconfig.h.in ${CMAKE_CURRENT_SOURCE_DIR}/niconfig.h)

if(WITH_SPDLOG)
    add_subdirectory(./3thParty/spdlog-1.11.0/)
    set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} spdlog::spdlog)
    set(LIB_NI_COMMON_HEADERS ${LIB_NI_COMMON_HEADERS} ./3thParty/spdlog-1.11.0/include)
endif()

if(WITH_GLOG)
    add_subdirectory(./3thParty/glog-0.6.0/)
    set(NI_COMMON_ALL_LIBS ${NI_COMMON_ALL_LIBS} glog::glog)
    # set(LIB_NI_COMMON_HEADERS )
endif()

if(WITH_GLOG AND WITH_SPDLOG)
    message(FATAL_ERROR "Not Allow use both spdlog and glog")
endif()

# event library
if(WITH_LIBHV)

endif()


file(INSTALL ${LIB_NI_COMMON_HEADERS} DESTINATION include/ni_common)

add_library(ni_common STATIC ${NI_COMMON_SRCDIR})
target_include_directories(ni_common PRIVATE ${NI_COMMON_SRCDIR}
    INTERFACE $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include> $<INSTALL_INTERFACE:include>
)
target_link_libraries(ni_common PRIVATE ${NI_COMMON_ALL_LIBS})





