
file(GLOB SOURCES "*.cpp")

# set(SOURCES main.cpp)

add_executable(event ${SOURCES})
target_sources(event PUBLIC ${SOURCES})
target_link_libraries(event PRIVATE common pthread)
