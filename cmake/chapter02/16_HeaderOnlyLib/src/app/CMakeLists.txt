add_executable(${EXE_NAME} main.cpp)

target_link_libraries(${EXE_NAME} PRIVATE ${LIBRARY_NAME})
# target_compile_options(${EXE_NAME} PRIVATE -Wall -Wpedantic -Werror --pedantic-errors -Wextra -Wconversion -Wsign-conversion)
