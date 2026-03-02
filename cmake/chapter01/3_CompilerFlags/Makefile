###############
## Variables ##
###############
# Note: Variables can only be strings
# Note: Single or double quotes for variable names or values have no meaning to Make

# CC: Program for compiling C programs; default cc
# CXX: Program for compiling C++ programs: default g++
# CFLAGS: Extra flags to give to the C compiler
# CXXFLAGS: Extra flags to give to the C++ compiler
# CPPFLAGS: Extra flags to give to the C preprocessor
# LDFLAGS: Extra flags to give to the linker

DEBUG = 0
EXECUTABLE_NAME = main

CXX = g++
CXX_STANDART = c++17
CXX_WARNINGS = -Wall -Wextra -Wpedantic

CXXFLAGS = $(CXX_WARNINGS) -std=$(CXX_STANDART)
CPPFLAGS = 
LDFLAGS = 
COMPILER_CALL = $(CXX) $(CXXFLAGS)

ifeq ($(DEBUG), 1)
# debug mode
CXXFLAGS += -g -O0
else
# release mode
CXXFLAGS += -O3
endif

###############
## TARGETS   ##
###############

build: main.o my_lib.o
	$(COMPILER_CALL) -o $(EXECUTABLE_NAME) main.o my_lib.o

main.o:
	$(COMPILER_CALL) -c main.cc

my_lib.o:
	$(COMPILER_CALL) -c my_lib.cc

execute:
	./$(EXECUTABLE_NAME)

clean:
	rm -f *.o
	rm -f $(EXECUTABLE_NAME)