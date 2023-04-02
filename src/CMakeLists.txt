

file(GLOB SOURCES "*.cpp")

add_executable(event ${SOURCES})
target_sources(event PUBLIC ${SOURCES})
