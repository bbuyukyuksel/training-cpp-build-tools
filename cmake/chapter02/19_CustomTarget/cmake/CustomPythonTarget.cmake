set(CUSTOM_TARGET_NAME "CustomPythonTarget")

if (NOT TARGET ${CUSTOM_TARGET_NAME})
    # add_custom_target(${CUSTOM_TARGET_NAME}
    #     COMMAND ${CMAKE_COMMAND} -E echo "Running custom Python target..."
    #     COMMAND ${CMAKE_COMMAND} -E env PYTHONPATH=${CMAKE_CURRENT_SOURCE_DIR}/python ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/python/script.py
    #     WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    # )

    find_package(Python3 REQUIRED COMPONENTS Interpreter)

    message(STATUS "Python executable: ${Python3_EXECUTABLE}")

    add_custom_target(
        ${CUSTOM_TARGET_NAME}
        COMMAND ${CMAKE_COMMAND} -E echo "Running custom Python target..."
        COMMAND  Python3::Interpreter ${PROJECT_SOURCE_DIR}/scripts/CustomPythonTarget.py --directory ${PROJECT_SOURCE_DIR}/src
        WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/scripts
    )
    add_dependencies(${CUSTOM_TARGET_NAME} ${EXE_NAME})
endif()
