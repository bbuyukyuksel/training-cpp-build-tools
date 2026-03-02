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

COMPILATION_MODE ?= Debug
ENABLE_WARNINGS ?= 1
WARNINGS_AS_ERROR ?= 0
CPP_STANDARD ?= c++17

EXECUTABLE_NAME := main
INCLUDE_DIR := include
SOURCE_DIR := src
BUILD_ROOT := build
BUILD_DIR := $(BUILD_ROOT)

CXX := g++
CXX_STANDART = $(CPP_STANDARD)

ifeq ($(ENABLE_WARNINGS), 1)
    CXX_WARNINGS := -Wall -Wextra -Wpedantic 
endif

ifeq ($(WARNINGS_AS_ERROR), 1)
    CXX_WARNINGS += -Werror
endif

ifeq ($(COMPILATION_MODE),Debug)
    CXXFLAGS_MODE += -g -O0
    BUILD_DIR := $(BUILD_ROOT)/$(COMPILATION_MODE)
else ifeq ($(COMPILATION_MODE),Release)
    CXXFLAGS_MODE += -O3
    BUILD_DIR := $(BUILD_ROOT)/$(COMPILATION_MODE)
else ifeq ($(COMPILATION_MODE),RelWithDebInfo)
    CXXFLAGS_MODE += -O2 -g
    BUILD_DIR := $(BUILD_ROOT)/$(COMPILATION_MODE)
else
    $(error Unknown COMPILATION_MODE: $(COMPILATION_MODE). Use Debug, Release or RelWithDebInfo)
endif

CXXFLAGS := $(CXX_WARNINGS) $(CXXFLAGS_MODE) -std=$(CXX_STANDART)
CPPFLAGS := -I$(INCLUDE_DIR)
LDFLAGS := 
COMPILER_CALL := $(CXX) $(CXXFLAGS) $(CPPFLAGS)

CXX_SOURCES := $(wildcard $(SOURCE_DIR)/*.cc)
CXX_OBJECTS := $(patsubst $(SOURCE_DIR)/%.cc, $(BUILD_DIR)/%.o, $(CXX_SOURCES))

###############
## TARGETS   ##
###############
all: create build

create:
	@mkdir -p $(BUILD_DIR)

build: $(CXX_OBJECTS)
	$(COMPILER_CALL) $(CXX_OBJECTS) -o $(BUILD_DIR)/$(EXECUTABLE_NAME)

execute:a
	./$(BUILD_DIR)/$(EXECUTABLE_NAME)

clean:
	rm -f $(BUILD_DIR)/*.o
	rm -f $(BUILD_DIR)/$(EXECUTABLE_NAME)

###############
## PATTERNS  ##
###############

# $@: the file name of the target (target)
# $<: the name of the first dependency (source)

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.cc
	$(COMPILER_CALL) -c $< -o $@

###############
## .PHONY    ##
###############
# Declare the target as a phony target (not a real file) so it always run when invoked.
.PHONY: all create build execute clean
