# Cpp Makefile Tutorial

## GCC/Clang Compiler Steps

### Compilation Steps

1. Preprocessing
2. Compilation
3. Assembler
4. Linking

Preprocessing
- Removes comments from the source code
- Macro expansion
- Expansion of header files
- Command: `g++ -E main.cc > main.i`

Compilation
- Translates the preprocessing file into assembly language
- Checks the C/C++ language syntax for error
- Command: `g++ -S main.i`
- Produces: `main.s`

Assembler
- Translates the assembly code into low-level machine code
- Command: `g++ -c main.s`
- Produces: `main.o`

Linker
- Linking all the source files together, that is all the other object codes in the project.
- Generates the executable file
- Command: `g++ main.o -o main`
- Produces: main.out (.exe for Windows)

Compiler Flags
- Debug: `-g`
- Release: `-O0 -O1 -O2 -O3 -Og`
- Includes: `-I`
- Warnings: `-Wall -Wextra -Wpedantic -Wconversion`

## Makefile Commands of the Template

### Makefile Variables

Convention is naming in upper snake_case.

```makefile
VARIABLE = Value
```

Variables can be called by `$(VARIABLE_NAME)`

```makefile
$(VARIABLE_NAME)
```

### Makefile Targets

Convention is naming in snake_case or camelCase.

```makefile
targetName: Dependencies
    Command
```

Targets can be called by the `make` command.

```sh
make targetName
```

### Makefile Phony Target

Sometimes you want your Makefile to run commands that do not represent files, for example the "clean" target.
You may potentially have a file named clean in your main directory. In such a case Make will be confused because
by default the clean target would be associated with this file and Make will only run it when the file does not appear
to be up-to-date.

```makefile
.PHONY: clean
clean:
    rm -rf *.o
```

In terms of Make, a phony target is simply a target that is always out-of-date, so whenever you ask make 
<phony_target>, it will run, independent from the state of the file system.

### Build the Executable

Create the executable in either Debug or Release mode.

```sh
make build COMPILATION_MODE=Debug # Build type is debug
make build COMPILATION_MODE=Release # Build type is release
```

### Run the Executable

Run the executable in either Debug or Release mode.

```sh
make execute COMPILATION_MODE=Debug # Run type is debug
make execute COMPILATION_MODE=Release # Run type is release
```

### Run the Executable

- COMPILATION_MODE: Debug or Release
- ENABLE_WARNINGS: 1 (True) or 0 (False)
- WARNINGS_AS_ERRORS: 1 (True) or 0 (False)
- CPP_STANDARD: c++11, c++14, c++17, etc.

### Important Shortcuts of the Makefile Templates
- `$@`: the file name of the target
- `$<`: the name of the first dependency
- `$^`: the names of all dependencies

### Assinging
- `=` Lazzy (recursive) assignment
- `:=` Immediate (simple) assignment
- `?=` Assign only if not already defined
- `+=` Append to a variable 

If a variable is not previosly defined, using `+=` behaves like `=` (it creates the variable and assigns the value).

#### Simple Explanation

##### `=` (Lazy)

The value is evaluated **when the variable is used,** not when it is defined.

```makefile
a = $(B)
B = hello
```

`A` becomes `hello` because it is expanded later.

##### `:=` (Immediate)

The value is evaluated **immediately at the time of definition.**

```makefile
a := $(B)
B = hello
```

`A` is empty because `B` was not defined yet.

##### `?=` (Default assignment)

Assigs a value `only if the variable is not already defined.`

```makefile
MODE ?= Debug
```

If `MODE` was set from the command line, it will not be overwritten.

```sh
make MODE=Release
```

##### `+=` (Append)

Adds content to an existing variable.

```makefile
CXXFLAGS += -Wall
```

If `CXXFLAGS` was not defined before, this behaves like:
```makefile
CXXFLAGS = -Wall
```

##### Practical Rule
- Use `:=` in most cases (predictable and safer)
- Use `?=` for default values.
- Use `=` only when you specifically need lazy evaluation.
- `+=` is safe even if the variable was not defined before.

