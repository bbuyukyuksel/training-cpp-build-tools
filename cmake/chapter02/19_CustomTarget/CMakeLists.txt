cmake_minimum_required(VERSION 3.15)

project(CustomTargetExample VERSION 1.0.0 LANGUAGES CXX)

set(LIBRARY_NAME headerlib)
set(EXECUTABLE_NAME app)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
include(CustomPythonTarget)

add_subdirectory(src/headerlib)
add_subdirectory(src/app)

install(TARGETS ${LIBRARY_NAME} ${EXECUTABLE_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
