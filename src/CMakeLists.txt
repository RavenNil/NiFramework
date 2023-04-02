

file(GLOB SOURCES "*.cpp")

add_executable(upp ${SOURCES})
target_sources(upp PUBLIC ${SOURCES})
