set(LIBRARY_NAME headerlib)
set(EXE_NAME app)

add_subdirectory(headerlib)
add_subdirectory(app)

install(TARGETS ${LIBRARY_NAME} ${EXE_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
