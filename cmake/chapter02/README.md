# CMake Tutorial

[link](https://github.com/franneck94/UdemyCmake)

### Installation

```sh
sudo apt-get update
sudo apt-get upgrade
 
# Mandatory
sudo apt-get install gcc g++ gdb
sudo apt-get install make cmake
sudo apt-get install git
sudo apt-get install doxygen
sudo apt-get install python3 python3-pip
 
# Optional
sudo apt-get install lcov gcovr
sudo apt-get install ccache
sudo apt-get install cppcheck
sudo apt-get install llvm clang-format clang-tidy
sudo apt-get install curl zip unzip tar
sudo apt-get install pkg-config
```

### Generators 

- Generator for GCC and Clang

```sh
cmake -S . -B build -G "Unix Makefiles"
```

- Generator for MSVC

```sh
cmake -S . -B build -G "Visual Studio 16 2019"
```

*get the list of Generators:* `cmake --help`

### Specify the Build type

Per default the standard type is in the most cases the debug type. If you want to generate the project, for example, in release mode
you have to set the build type.

```sh
cmake -S. -B build -DCMAKE_BUILD_TYPE=Release 
```

### Passing options,

If you have set some options in the CMakeLists, you can pass values in the command line.

```sh
cmake -S. -B build -DMY_OPTION=[ON|OFF]

cmake -S. -B build -DCMAKE_BUILD_TYPE:STRING=Release
```

### Specify the Build target (option 1)

The standard build command would build all created targets within the CMakeLists. If you want to build a specific target, you can do so.

```sh
cmake --build build --target ExternalLibraries_Executable
```

The target *ExternalLibraries_Executable* is just an example of a possible target name.
Note: All dependent targets will be build beforehand.

### Specify the Build target (option 2)

Besides setting the target within the cmake build command, you could also run the previously generated Makefile (from the generating step).
If you want to build the *ExternalLibraries_Executable*, you could to the following.

```sh
cd build
make ExternalLibraries_Executable
```

### Doxygen Usage

```sh
mkdir docs
doxygen -g

```

### Important CMake Variables for Paths


```bash
cmake -S . -B build
```

---

# 📁 CMake Directory & Path Variables (With Practical Example)

Assume this project structure:

```
my_project/
 ├── CMakeLists.txt
 ├── src/
 │   ├── CMakeLists.txt
 │   └── main.cpp
 └── cmake/
     └── MyModule.cmake
```

And you configure it like this:

```bash
cmake -S . -B build
```

This means:

* `-S .` → Source directory is the current directory (`my_project`)
* `-B build` → Build directory is `my_project/build`

---

# 🔹 Top-Level Directories

These refer to the root of the entire CMake project.

### `CMAKE_SOURCE_DIR`

* The top-most source directory
* Contains the main `CMakeLists.txt`
* In this example:

```
/path/to/my_project
```

* Never changes

---

### `CMAKE_BINARY_DIR`

* The top-most build directory
* In this example:

```
/path/to/my_project/build
```

* Never changes

---

# 🔹 Project-Level Directories

Defined by the most recent `project()` call.

If your root `CMakeLists.txt` contains:

```cmake
project(MyProject)
```

Then:

### `PROJECT_SOURCE_DIR`

```
/path/to/my_project
```

### `PROJECT_BINARY_DIR`

```
/path/to/my_project/build
```

⚠️ If you have nested projects via `add_subdirectory()`, these may change.

---

# 🔹 Current Directory (Changes in Subdirectories)

When CMake processes:

```
my_project/src/CMakeLists.txt
```

Then:

### `CMAKE_CURRENT_SOURCE_DIR`

```
/path/to/my_project/src
```

### `CMAKE_CURRENT_BINARY_DIR`

```
/path/to/my_project/build/src
```

These change depending on which `CMakeLists.txt` is currently being executed.

---

# 🔹 Current List File (Modules / Includes)

Suppose inside `src/CMakeLists.txt` you write:

```cmake
include(${CMAKE_SOURCE_DIR}/cmake/MyModule.cmake)
```

While CMake is processing `MyModule.cmake`:

### `CMAKE_CURRENT_LIST_DIR`

```
/path/to/my_project/cmake
```

### `CMAKE_CURRENT_LIST_FILE`

```
/path/to/my_project/cmake/MyModule.cmake
```

### `CMAKE_CURRENT_LIST_LINE`

The current line number being executed inside that file.

👉 Important difference:

| Variable                   | Refers To                                                   |
| -------------------------- | ----------------------------------------------------------- |
| `CMAKE_CURRENT_SOURCE_DIR` | Directory of current `CMakeLists.txt`                       |
| `CMAKE_CURRENT_LIST_DIR`   | Directory of current file being processed (can be `.cmake`) |

---

# 🔹 Module Search Path

### `CMAKE_MODULE_PATH`

Tells CMake where to search for modules when using:

* `find_package()`
* `include()`

Example:

```cmake
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
```

Now this works:

```cmake
include(MyModule)
```

CMake will search inside:

```
my_project/cmake
```

---

# 🧠 Quick Summary Table

| Variable                   | Example Value           | Changes in Subdirs?     |
| -------------------------- | ----------------------- | ----------------------- |
| `CMAKE_SOURCE_DIR`         | `/my_project`           | ❌ No                    |
| `CMAKE_BINARY_DIR`         | `/my_project/build`     | ❌ No                    |
| `PROJECT_SOURCE_DIR`       | `/my_project`           | ⚠️ Depends on project() |
| `PROJECT_BINARY_DIR`       | `/my_project/build`     | ⚠️ Depends              |
| `CMAKE_CURRENT_SOURCE_DIR` | `/my_project/src`       | ✅ Yes                   |
| `CMAKE_CURRENT_BINARY_DIR` | `/my_project/build/src` | ✅ Yes                   |
| `CMAKE_CURRENT_LIST_DIR`   | `/my_project/cmake`     | ✅ Yes                   |
| `CMAKE_CURRENT_LIST_FILE`  | `/.../MyModule.cmake`   | ✅ Yes                   |
| `CMAKE_CURRENT_LIST_LINE`  | Line number             | ✅ Yes                   |
| `CMAKE_MODULE_PATH`        | Custom module paths     | N/A                     |

---

# 🎯 Practical Rules

### ✅ Inside subdirectories

Use:

```cmake
${CMAKE_CURRENT_SOURCE_DIR}
```

### ✅ Inside reusable `.cmake` modules

Use:

```cmake
${CMAKE_CURRENT_LIST_DIR}
```

### ⚠️ Avoid in reusable code

```cmake
${CMAKE_SOURCE_DIR}
```

Because it breaks when your project is included as a subproject.

---

# 🚀 Mental Model

Think in layers:

1. **CMAKE_*** → Global (top-level)
2. **PROJECT_*** → Scoped to `project()`
3. **CMAKE_CURRENT_*** → Depends on what is currently being processed
4. **CMAKE_CURRENT_LIST_*** → Depends on the file being executed


### Generator Expressions

Using generator expressions one can configure the project differently build types in multi-configuration generators.
For such generators the project is configured (with running cmake) once, but can be build types after that. Example of such generators is Visual Studio.

For multiconfiguration generators `CMAKE_BUILD_TYPE` is not known at configuration stage. Because of that using if-else switching doesn't work work:

```cmake
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_options("/W4 /Wx)
elif(CMAKE_BUILD_TYPE STREQUAL "Release")
    add_compile_options("/W4")
endif()
```

But using conditional generator expressions works:

```cmake
    add_compile_options(
        $<$<CONFIG:Debug>:/W4 /Wx>
        $<$<CONFIG:RELEASE>:/W4>
    )
```

The visual studio, xcode and ninja multi-config generators let you have more than once configuration in the same build directory, and thus won't be using the
`CMAKE_BUILD_TYPE` cache variable. Instead the `CMAKE_CONFIGURATION_TYPES` cache variable is used and contains the list of configurations to use for this build directory.

to see value of the CONFIG in build time, we can add additionally custom target:

```cmake
add_custom_target(print_config ALL
    COMMAND ${CMAKE_COMMAND} -E echo "Config is: $<CONFIG>"
)

cmake --build build --target print_config --config Release

---
or

```cmake
if(CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Multi-config generator detected")
    message(STATUS "Available configs: ${CMAKE_CONFIGURATION_TYPES}")
else()
    message(STATUS "Single-config generator detected")
    message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
endif()
```
```

### install

```cmake
include(GNUInstallDirs)
install (TARGETS ${LIBRARY_NAME}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
install (TARGETS ${EXECUTABLE_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
```

```sh
# non-multi-config
cmake -S. -Bbuild -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
cmake --build build -j4
cmake --install build --prefix ./dist/Release

# multi-config
cmake -S. -Bbuild -G"Ninja Multi-Config"
cmake --build build --config Release -j4
cmake --install build --config Release --prefix ./dist/Release
```

---

### Formatter and Static Analyzer

Tooling

- Clang-Format: Formatting tool for your C/C++ code
- Clang-Tidy: Static linting tool for your C/C++ code

CMake-Format:
    ```sh
    pip install cmake-format
    ```

Install

It's included in the LLVM toolchain, but also installable by apt, brew, winget etc.

https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.0

```sh
$ apt install clang-tidy
```

```.clang-tidy
---
Checks: 'clang-analyzer-*,cppcoreguidelines-*,modernize-*,bugprone-*,performance-*,readability-non-const-parameter,misc-const-correctness,misc-use-anonymous-namespace,google-explicit-constructor,-modernize-use-trailing-return-type,-bugprone-exception-escape,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-avoid-magic-numbers,-bugprone-easily-swappable-parameters'
WarningsAsErrors: ''
HeaderFilterRegex: '\(src|app\)\/*.\(h|hpp\)'
AnalyzeTemporaryDtors: false
FormatStyle:     none
...
```

### Pre-Commit

```sh
$ pip install pre-commit
```

.pre-commit-config.yaml:
```yaml
fail_fast: false
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
    -   id: check-yaml
    -   id: check-json
        exclude: .vscode
    -   id: end-of-file-fixer
    -   id: trailing-whitespace
-   repo: https://github.com/pocc/pre-commit-hooks
    rev: v1.3.5
    hooks:
    -   id: clang-format
        args: ['-i']
```

### Header Only Libraries

...

### Different Library Types

Library,

- A binary file that contains information about code.
- A library cannot be executed on its own.
- An application utilizes a library.

Shared,

- Linux: `*.so`
- MacOS: `*.dylib`
- Windows: `*.dll`

Shared libraries reduce the amount of code that is duplicated in each program that makes use of the library, keeping the binaries small.
Shared libraries will however have a small additional cost for the execution.
In general the shared library is in the same directory as the executable.

Static,

- Linux/MaxOS: `*.a`
- Windows: `*.lib`

Static libraries increase the overall size of the binary, but it means that you dont need to cary along a copy of the library that is being used.

As the code is connected at compile time there are not any additional run-time loading costs.

### Cross Compilation with Toolchain Files

Install ARM Compiler on x86_64 Ubuntu

```sh
sudo apt update
sudo apt install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi && \
    libncurses5-dev build-essential bison flex libssl-dev bc

sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
sudo apt install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi
```

Install MingW Cross Compiler on x86_64 Ubuntu

```
sudo apt install mingw-w64
```

ARM 32 Cross

```cmake
cmake -B build_arm32 -DCMAKE_TOOLCHAIN_FILE=Toolchains/arm32-cross-toolchain.cmake
cmake --build build_arm32 -j8
```

ARM 32 Native

```cmake
cmake -B build_arm32_native -DCMAKE_TOOLCHAIN_FILE=Toolchains/arm32-native-toolchain.cmake
cmake --build build_arm32 -j8
```

x86_64 MingW

```cmake
cmake -B build -DCMAKE_TOOLCHAIN_FILE=Toolchains/x86-64-mingw-toolchain.cmake
cmake --build build_arm32 -j8
```

x86_64 Native

```cmake
cmake -B build -DCMAKE_TOOLCHAIN_FILE=Toolchains/x86-64-native-toolchain.cmake
cmake --build build_arm32 -j8
```

```
# Toolchains
- arm32-cross-toolchain.cmake

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
set(CMAKE_C_FLAGS -static)
set(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)
set(CMAKE_CXX_FLAGS -static)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

- arm32-native-toolchain.cmake

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER gcc)
set(CMAKE_C_FLAGS -static)
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CXX_FLAGS -static)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

- x86-64-mingw-toolchain.cmake

set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc-posix)
set(CMAKE_C_FLAGS -static)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++-posix)
set(CMAKE_CXX_FLAGS -static)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

- x86-64-native-toolchain.cmake

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_C_COMPILER gcc-win)
set(CMAKE_C_FLAGS -static)
set(CMAKE_CXX_COMPILER g++-win)
set(CMAKE_CXX_FLAGS -static)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
```

```c
if (MSVC)
    target_link_libraries(
        ${EXECUTABLE_NAME}
        PUBLIC
            ${CMAKE_SOURCE_DIR}/external/lib/LibExample.lib
    )
else()
    target_link_libraries(
        ${EXECUTABLE_NAME}
        PUBLIC
            ${CMAKE_SOURCE_DIR}/external/lib/libLibExample.a
    )
endif()
```

### Custom Targets and Commands

- When is needed to add_custom_target?
Each time we need to run a command to do something in our build system different to build a library or an executable.

- When is a good idea to run a command in add_custom_target?
When the command must be executed always the target is built.

- When is a good idea to use add_custom_command?
Always we want to run the command when is needed: if we need to generate a file (or more) or regenerate it if something changed in the source folder.

- When is a good idea to use execute_process?
Running a command at configure time.
