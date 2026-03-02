### Different Linking Types

```
target_link_libraries(A PUBLIC fmt)
target_link_libraries(B PRIVATE spdlog)

target_link_libraries(C PUBLIC/PRIVATE A)
target_link_libraries(C PUBLIC/PRIVATE B)
```

#### PUBLIC

When A links `fmt` as *PUBLIC*, it says that A uses fmt in its implementation, and fmt is also used in A's public API.
Hence, C can use fmt since it is part of the public API of A.

#### PRIVATE

When B links `spdlog` as *PRIVATE*, it is saying that B uses spdlog in its implementation, but spdlog is not used in any part of B's public API.

#### INTERFACE

```cmake
add_library(D INTERFACE)
target_include_directories(D INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
```

In general, used for header-only libraries.

This library,
- not compile
- not produce `.a/.so`
- just contains `include path, compile definitions, compile option`

### Things you can set on targets

- target_compile_features: The compiler features you need activated, like `cxx_std_11`
- target_compile_definitions: for definitions of preprocessor macros
- target_compile_options: More general compile flags

```cmake
target_compile_definitions(MyTarget PRIVATE
    ADD_DEBUG_PRINTS=1
    ABCDE...
)

if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    target_compile_options(MyTarget PRIVATE -Wall)
endif()

target_compile_features(mylib PUBLIC cxx_std_11)
```

- target_include_libraries: Other targets; can also pass library names directly
- target_include_directories: Include directories

### Custom Targets and Commands

