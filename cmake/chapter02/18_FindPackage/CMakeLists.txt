cmake_minimum_required(VERSION 3.15)

project(PreCompiledLibExample VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/")
find_package(LibExample REQUIRED)

message(STATUS "LibExample include dir: ${LibExample_INCLUDE_DIRS}")

set(EXE_NAME app)

add_executable(${EXE_NAME} src/app/main.cpp )
target_link_libraries(${EXE_NAME} PRIVATE ${LibExample_LIBRARIES})
target_include_directories(${EXE_NAME} PRIVATE ${LibExample_INCLUDE_DIRS})


install(TARGETS ${EXE_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
