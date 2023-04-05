
project(common)

file(GLOB SOURCES "*.cpp")

add_subdirectory(./3thParty/fmt-9.1.0/)

option(WITH_SPDLOG "Log library use spdlog" ON)
option(WITH_GLOG "Log library use glog" OFF)

if(WITH_SPDLOG)
    add_definitions(-DWITH_SPDLOG)
    add_subdirectory(./3thParty/spdlog-1.11.0/)
endif()

if(WITH_GLOG)
    add_definitions(-DWITH_GLOG)
    add_subdirectory(./3thParty/glog-0.6.0//)
endif()

if(WITH_GLOG AND WITH_SPDLOG)
    message(FATAL_ERROR "Not Allow use both spdlog and glog")
endif()


add_library(common STATIC ${SOURCES})
target_sources(common PRIVATE ${SOURCES})
target_include_directories(common PUBLIC include)

# fmt
target_link_libraries(common PUBLIC fmt::fmt)

# spdlog
if(WITH_SPDLOG)
    target_link_libraries(common PUBLIC spdlog::spdlog)
    target_include_directories(common PUBLIC ./3thParty/spdlog-1.11.0/include)
    target_compile_definitions(common PUBLIC WITH_SPDLOG)
endif()

#glog
if(WITH_GLOG)
    target_link_libraries(common PUBLIC glog::glog)
    target_compile_definitions(common PUBLIC WITH_GLOG)
endif()

