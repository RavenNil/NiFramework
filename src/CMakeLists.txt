

file(GLOB SOURCES "*.cpp")

add_executable(event ${SOURCES})
target_sources(event PUBLIC ${SOURCES})
target_link_libraries(event PUBLIC pthread)
