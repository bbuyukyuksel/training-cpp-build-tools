add_executable(${EXE_NAME} main.cpp)

target_link_libraries(${EXE_NAME} PRIVATE ${LIBRARY_NAME})
set_target_properties(${EXE_NAME} PROPERTIES
    INSTALL_RPATH "$ORIGIN/../lib")
# target_compile_options(${EXE_NAME} PRIVATE -Wall -Wpedantic -Werror --pedantic-errors -Wextra -Wconversion -Wsign-conversion)
