cmake_minimum_required(VERSION 3.10)

project(
    CppProjectTemplate 
    VERSION 1.0.0 
    LANGUAGES C CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POLICY_VERSION_MINIMUM 3.5)

option(ENABLE_TESTING "Enable testing" ON)
option(ENABLE_DOCS "Enable documentation generation" OFF)
option(ENABLE_WARNINGS "Enable compiler warnings" OFF)
option(ENABLE_WARNINGS_AS_ERROR "Enable compiler warnings as errors" OFF)

set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")

include(TermColor)

if (ENABLE_DOCS)
    C_MESSAGE(FG_GREEN "Documentation generation is enabled")
    include(Documentation)
endif()

if(ENABLE_WARNINGS)
    C_MESSAGE(FG_GREEN "Compiler warnings are enabled")
    include(CompilerWarnings)
endif()

include(Dependencies)

add_subdirectory(configured)
add_subdirectory(src)
add_subdirectory(app)

if (ENABLE_TESTING)
    include(CTest)
    enable_testing()
    add_subdirectory(tests)
endif()
