# function(add_git_sub_module relative_dir)

#     find_package(Git REQUIRED)
#     set(FULL_DIR ${CMAKE_SOURCE_DIR}/${relative_dir})

#     if (NOT EXISTS ${FULL_DIR}/CMakeLists.txt)
#         message(STATUS "Adding git submodule in ${relative_dir}")
#         execute_process(
#             COMMAND ${GIT_EXECUTABLE}
#             submodule add https://github.com/your-repo/${relative_dir}.git ${relative_dir}
#             WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#         )
#     endif()

# endfunction()

function (init_git_submodule)
    find_package(Git REQUIRED)
    set(FULL_PATH ${CMAKE_SOURCE_DIR}/${relative_dir})

    if (NOT EXISTS ${FULL_PATH}/CMakeLists.txt)
        message(STATUS "Initializing git submodules...")
        execute_process(
            COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive -- ${relative_dir}
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            RESULT_VARIABLE GIT_SUBMODULE_RESULT
        )
    endif()

    if (NOT GIT_SUBMODULE_RESULT EQUAL 0)
        message(FATAL_ERROR "Failed to initialize git submodules. Please ensure you have Git installed and the repository is properly cloned.")
    endif()

    if (EXISTS ${FULL_PATH}/CMakeLists.txt)
        message(STATUS "Submodule is a CMake project. Adding subdirectory ${relative_dir}")
        add_subdirectory(${relative_dir})
    else()
        message(WARNING "Submodule does not contain a CMakeLists.txt. Skipping add_subdirectory for ${relative_dir}")
    endif()
endfunction()
