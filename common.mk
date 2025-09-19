# Common Makefile settings and rules shared across all lessons
# This file is included by individual lesson Makefiles to ensure consistency

# Compiler and build configuration
# The ?= operator means "assign only if not already defined" - allows overriding from command line
CC       ?= gcc                    # C compiler (can be overridden with CC=clang)
CFLAGS   ?= -std=c11 -Wall -Wextra -Wshadow -Wconversion -O2 -g  # Compiler flags
LDFLAGS  ?=                        # Linker flags (empty by default, lessons can add libraries)
INCLUDES ?=                        # Include directories (lessons can add header paths)

# CFLAGS breakdown:
# -std=c11      : Use C11 standard
# -Wall         : Enable most common warnings
# -Wextra       : Enable extra warnings beyond -Wall
# -Wshadow      : Warn when variables shadow (hide) other variables
# -Wconversion  : Warn about implicit type conversions that might change values
# -O2           : Optimization level 2 (good balance of speed vs compile time)
# -g            : Include debugging information for gdb

# Pattern rules for building object files and executables
# These rules are used by all lesson Makefiles - they just need to set OBJDIR and BINDIR

# Rule to compile .c files into .o object files
# Pattern: $(OBJDIR)/%.o depends on src/%.c
# Example: build/hello.o depends on src/hello.c
$(OBJDIR)/%.o: src/%.c
	@mkdir -p $(OBJDIR)                                    # Create build directory if it doesn't exist
	$(CC) $(CFLAGS) $(INCLUDES:%=-I%) -c $< -o $@         # Compile source to object file

# Command breakdown:
# $(CC)              : The compiler (gcc by default)
# $(CFLAGS)          : Compiler flags defined above
# $(INCLUDES:%=-I%)  : Transform each include path to -I/path/to/include format
# -c                 : Compile only, don't link
# $<                 : First prerequisite (the .c file)
# -o $@              : Output file name (the .o file)

# Rule to link object files into executable binaries
# Pattern: $(BINDIR)/% depends on $(OBJDIR)/%.o
# Example: bin/hello depends on build/hello.o
$(BINDIR)/%: $(OBJDIR)/%.o
	@mkdir -p $(BINDIR)                                    # Create binary directory if it doesn't exist
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)                   # Link object files into executable

# Command breakdown:
# $(CC)         : The compiler (also used as linker)
# $(CFLAGS)     : Compiler flags (some affect linking too)
# $^            : All prerequisites (all the .o files)
# -o $@         : Output file name (the executable)
# $(LDFLAGS)    : Linker flags (libraries, library paths, etc.)

# Variables that lesson Makefiles should define:
# OBJDIR   : Directory for object files (typically "build")
# BINDIR   : Directory for executables (typically "bin")
# 
# Usage example in a lesson Makefile:
# OBJDIR := build
# BINDIR := bin
# include ../../common.mk
