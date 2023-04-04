
project(common)

file(GLOB SOURCES "*.cpp")

add_subdirectory(./3thParty/fmt-9.1.0/)
add_subdirectory(./3thParty/spdlog-1.11.0/)

add_library(common STATIC ${SOURCES})
target_sources(common PRIVATE ${SOURCES})
target_include_directories(common PUBLIC include)

# fmt
target_link_libraries(common PUBLIC fmt::fmt)

# spdlog
target_link_libraries(common PRIVATE spdlog::spdlog)
target_include_directories(common PRIVATE ./3thParty/spdlog-1.11.0/include)

