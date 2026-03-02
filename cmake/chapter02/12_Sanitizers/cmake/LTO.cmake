function(target_enable_lto target)
    if (NOT ENABLE_LTO)
        message(STATUS "LTO is disabled, skipping LTO flags for target ${target}.")
        return()
    endif()

    include(CheckIPOSupported)

    check_ipo_supported(RESULT ipo_supported OUTPUT ipo_output)

    if (NOT ipo_supported)
        message(WARNING "IPO is not supported: ${ipo_output}")
        return()
    endif()

    if (CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
        set_target_properties(${target} PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        set_target_properties(${target} PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(WARNING "Unsupported compiler for LTO: ${CMAKE_CXX_COMPILER_ID}. Skipping LTO flags for target `${target}`.")
    endif()
endfunction()