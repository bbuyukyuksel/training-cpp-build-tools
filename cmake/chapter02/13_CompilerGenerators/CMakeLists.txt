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
# Sanitizers
option(ENABLE_ADDRESS_SANITIZER "Enable Address Sanitizer" ON)
option(ENABLE_THREAD_SANITIZER "Enable Thread Sanitizer" OFF)
option(ENABLE_UNDEFINED_BEHAVIOR_SANITIZER "Enable Undefined Behavior Sanitizer" ON)
# LTO/IPO Optimizations
option(ENABLE_LTO "Enable Link Time Optimization (LTO)" ON)

set(EXECUTABLE_NAME Executable)
set(LIBRARY_NAME Library)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(TermColor)

if(CMAKE_CONFIGURATION_TYPES)
    c_message(FG_GREEN "Multi-config generator detected")
    c_message(FG_YELLOW "Available configs: ${CMAKE_CONFIGURATION_TYPES}")
else()
    c_message(FG_GREEN "Single-config generator detected")
    c_message(FG_GREEN "Build type: ${CMAKE_BUILD_TYPE}")
endif()


if (ENABLE_DOCS)
    C_MESSAGE(FG_GREEN "Documentation generation is enabled")
    include(Documentation)
endif()

if(ENABLE_WARNINGS)
    C_MESSAGE(FG_GREEN "Compiler warnings are enabled")
    include(CompilerWarnings)
endif()

if (ENABLE_ADDRESS_SANITIZER OR ENABLE_THREAD_SANITIZER OR ENABLE_UNDEFINED_BEHAVIOR_SANITIZER)
    C_MESSAGE(FG_GREEN "Sanitizers are enabled")
    include(Sanitizer)
    add_sanitizer_flags(${EXECUTABLE_NAME})
endif()

if (ENABLE_LTO)
    C_MESSAGE(FG_GREEN "Link Time Optimization (LTO) is enabled")
    include(LTO)
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

include(GNUInstallDirs)
install (TARGETS ${LIBRARY_NAME}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install (TARGETS ${EXECUTABLE_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)