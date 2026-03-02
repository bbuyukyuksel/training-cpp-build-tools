set(LIBRARY_SOURCES
    "my_lib.cc")
set(LIBRARY_INCLUDES
    "./"
    "${CMAKE_BINARY_DIR}/configured_files/include/")

add_library(${LIBRARY_NAME} STATIC ${LIBRARY_SOURCES})

target_link_libraries(${LIBRARY_NAME} PUBLIC
    nlohmann_json::nlohmann_json
    fmt::fmt
    spdlog::spdlog
    cxxopts::cxxopts
    Catch2::Catch2
)
target_include_directories(${LIBRARY_NAME} PUBLIC ${LIBRARY_INCLUDES})

if (ENABLE_WARNINGS)
    target_set_warnings(${LIBRARY_NAME} ${ENABLE_WARNINGS} ${ENABLE_WARNINGS_AS_ERROR})
endif()

if (ENABLE_LTO)
    target_enable_lto(${LIBRARY_NAME})
endif()
