add_executable(${EXECUTABLE_NAME} main.cpp)

target_link_libraries(${EXECUTABLE_NAME} PRIVATE ${LIBRARY_NAME})
set_target_properties(${EXECUTABLE_NAME} PROPERTIES
    INSTALL_RPATH "$ORIGIN/../lib")
# target_compile_options(${EXE_NAME} PRIVATE -Wall -Wpedantic -Werror --pedantic-errors -Wextra -Wconversion -Wsign-conversion)
