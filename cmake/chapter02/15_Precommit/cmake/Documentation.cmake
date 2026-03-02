find_package(Doxygen)

if(DOXYGEN_FOUND)
    C_MESSAGE(FG_YELLOW "Documentation directory: ${CMAKE_CURRENT_SOURCE_DIR}")
    set(DOXYGEN_IN ${CMAKE_SOURCE_DIR}/docs/Doxyfile.in)
    set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    # Değişkenleri ayarla
    set(PROJECT_NAME "C++ Project Template")
    set(PROJECT_VERSION "1.0.0")
    set(PROJECT_BRIEF "A sample C++ project")
    set(INPUT_PATH "${CMAKE_SOURCE_DIR}/src")
    set(OUTPUT_DIR "${CMAKE_SOURCE_DIR}/docs")
    set(RECURSIVE YES)
    set(EXTRACT_ALL YES)

    # Template'den Doxyfile'ı oluştur
    configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)

    # Dokümantasyon target'ı
    add_custom_target(Documentation ALL
        COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Generating API documentation with Doxygen"
        VERBATIM)
else()
    message(WARNING "Doxygen not found, unable to generate documentation")
endif()

# Alternatif: Sabit Doxyfile kullan (mevcut)
# if (DOXYGEN_FOUND)
#     add_custom_target(
#         docs
#         ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile
#         WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/docs
#         COMMENT "Generating API documentation with Doxygen (fixed config)"
#     )
# endif()
