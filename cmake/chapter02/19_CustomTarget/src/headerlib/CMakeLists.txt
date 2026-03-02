# create the header-only library

set(LIBRARY_SRCS lib.cpp)

add_library(${LIBRARY_NAME} SHARED ${LIBRARY_SRCS})
target_include_directories(${LIBRARY_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

get_target_property(pic ${LIBRARY_NAME} POSITION_INDEPENDENT_CODE)
message(STATUS "PIC: ${pic}")
