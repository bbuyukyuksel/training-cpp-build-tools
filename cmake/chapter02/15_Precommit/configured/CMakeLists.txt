
set(PROJECT_AUTHORS
 "Burak Büyükyüksel"
 "Nurila Büyükyüksel"
 )

if(PROJECT_AUTHORS)
    set(HAS_PROJECT_AUTHORS 1)
    list(LENGTH PROJECT_AUTHORS NUM_AUTHORS)
    string(REPLACE ";" ", " PROJECT_AUTHORS_STR "${PROJECT_AUTHORS}")
    set(PROJECT_AUTHORS_STR "${PROJECT_AUTHORS_STR}")
endif()

configure_file(
    "config.hpp.in"
    "${CMAKE_BINARY_DIR}/configured_files/include/config.hpp"
    ESCAPE_QUOTES
)
