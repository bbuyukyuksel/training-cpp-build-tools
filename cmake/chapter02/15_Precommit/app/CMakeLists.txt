set(EXE_SOURCES
    "main.cc")
set(EXE_INCLUDES
    "./")

add_executable(${EXECUTABLE_NAME}
    ${EXE_SOURCES}
)

target_include_directories(${EXECUTABLE_NAME}
    PUBLIC
    ${EXE_INCLUDES}
)

target_link_libraries(${EXECUTABLE_NAME}
    PUBLIC
    ${LIBRARY_NAME}
)

# target_compile_options(${EXECUTABLE_NAME} PRIVATE
#     $<$<CONFIG:Debug>:-O0 -g3>
#     $<$<CONFIG:Release>:-O3 -DNDEBUG>
#     $<$<CONFIG:RelWithDebInfo>:-O2 -g3 -DNDEBUG>
# )
