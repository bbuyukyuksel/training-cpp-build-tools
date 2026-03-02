# FindYourLibraryName.cmake

set(LibExample_ROOT_DIR "${PROJECT_SOURCE_DIR}/src/external/")
set(LibExample_INCLUDE_DIRS "${LibExample_ROOT_DIR}/include/")

if (MSVC)
    set(LibExample_LIBRARIES "${LibExample_ROOT_DIR}/lib/LibExample.lib")
else()
    set(LibExample_LIBRARIES "${LibExample_ROOT_DIR}/lib/libLibExample.a")
endif()

if (EXISTS "${LibExample_LIBRARIES}")
    set(LibExample_FOUND TRUE)
else()
    set(LibExample_FOUND FALSE)
    message(FATAL_ERROR "LibExample library not found at ${LibExample_LIBRARIES}")
endif()
