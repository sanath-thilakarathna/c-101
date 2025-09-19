# Makefile for Lesson 01: Hello World
# This demonstrates the basic structure of a C program build system

# Directory configuration
OBJDIR := build                    # Directory for compiled object files (.o)
BINDIR := bin                      # Directory for final executable files
TARGET := hello                    # Name of the executable we want to create

# Path to shared build configuration
ROOT := ../../                     # Relative path to project root
include $(ROOT)/common.mk          # Include shared compiler settings and rules

# Source and object file configuration
SRCS := src/hello.c                # List of source files to compile
OBJS := $(OBJDIR)/hello.o          # Corresponding object files (build/hello.o)

# Declare phony targets (targets that don't represent actual files)
# This prevents conflicts if files with these names exist
.PHONY: all run test clean

# Default target: build the executable
# When you run 'make' without arguments, this target is executed
all: $(BINDIR)/$(TARGET)

# Rule to build the final executable
# Dependencies: all object files in OBJS variable
$(BINDIR)/$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)                               # Ensure bin directory exists
	$(CC) $(CFLAGS) $^ -o $@                         # Link object files into executable

# Breakdown of linking command:
# $(CC)      : Compiler (gcc) - also acts as linker
# $(CFLAGS)  : Compiler flags from common.mk
# $^         : All dependencies (build/hello.o)
# -o $@      : Output to target file (bin/hello)

# Convenience target to build and run the program
# Usage: make run
run: all
	@$(BINDIR)/$(TARGET)                             # Execute the compiled program

# Test target: build and run the test suite
# Usage: make test
test: all
	@cd tests && ./test_hello.sh                     # Change to tests directory and run test script

# Clean target: remove all generated files
# Usage: make clean
# This gives you a fresh start for rebuilding
clean:
	@rm -rf $(OBJDIR) $(BINDIR)                      # Remove build and bin directories

# Note: The object file compilation rule (src/hello.c -> build/hello.o) 
# is automatically handled by the pattern rule in common.mk:
# $(OBJDIR)/%.o: src/%.c
