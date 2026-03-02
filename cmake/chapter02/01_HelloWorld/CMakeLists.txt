# For configuring
# 1. Long way
# 1.0.) Create code and CMake file
# 1.1.) mkdir build
# 1.2.) cd build
# 1.3.) cmake ..
# 1.4.a.) cmake --build . 
# 1.4.b.) make 
# 2. Short way
# 2.1.) cmake -S. -Bbuild
# 2.2.) cmake --build build

cmake_minimum_required(VERSION 3.15)

project(
    CppProjectTemplate 
    VERSION 1.0.0 
    LANGUAGES C CXX)

add_executable(Executable main.cc) 