set(CUSTOM_TARGET_NAME "CustomPythonTarget")

if (NOT TARGET ${CUSTOM_TARGET_NAME})
    # add_custom_target(${CUSTOM_TARGET_NAME}
    #     COMMAND ${CMAKE_COMMAND} -E echo "Running custom Python target..."
    #     COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${CMAKE_CURRENT_SOURCE_DIR}/python ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/python/script.py
    #     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    # )

    find_package(Python3 REQUIRED COMPONENTS Interpreter)

    add_custom_target(${CUSTOM_TARGET_NAME}
        DEPENDS ${PROJECT_BINARY_DIR}/Stats.txt
    )

    add_custom_command(
        OUTPUT ${PROJECT_BINARY_DIR}/Stats.txt
        COMMAND ${CMAKE_COMMAND} -E echo "Running custom Python target..."
        COMMAND  Python3::Interpreter ${PROJECT_SOURCE_DIR}/scripts/CustomPythonTarget.py
            --input_dir ${PROJECT_SOURCE_DIR}/src
            --output_file ${PROJECT_BINARY_DIR}/Stats.txt
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/scripts
        DEPENDS ${PROJECT_SOURCE_DIR}/src/app/main.cpp
    )
endif()
