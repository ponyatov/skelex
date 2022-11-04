cmake_minimum_required (VERSION 2.6)

project(skelex)

set(CMAKE_VERBOSE_MAKEFILE ON)

if(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -O0 -g3 -ggdb")
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")
endif()

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_BUILD_TYPE    Debug)
set(CMAKE_DEBUG_POSTFIX debug)

include_directories(${CMAKE_HOME_DIRECTORY}/inc)
include_directories(${CMAKE_HOME_DIRECTORY}/tmp)

set(SOURCE
    ${SOURCE}
    ${CMAKE_HOME_DIRECTORY}/src/skelex.cpp
    ${CMAKE_HOME_DIRECTORY}/tmp/skelex.lexer.cpp
    ${CMAKE_HOME_DIRECTORY}/tmp/skelex.parser.cpp
)

set(HEADERS
   ${HEADERS}
   ${CMAKE_HOME_DIRECTORY}/inc/skelex.hpp
   ${CMAKE_HOME_DIRECTORY}/tmp/skelex.parser.hpp
)

add_executable(skelex ${SOURCE})

# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_HOME_DIRECTORY}/bin)
set(CMAKE_INSTALL_PREFIX ${CMAKE_HOME_DIRECTORY}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_INSTALL_PREFIX})

find_package(SDL2 REQUIRED)
include_directories(skelex ${SDL2_INCLUDE_DIRS})
target_link_libraries(skelex ${SDL2_LIBRARIES})
