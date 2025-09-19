# Top-level Makefile for C-101 - Build/test/clean/format across all lessons
# This Makefile orchestrates operations across all lesson directories

# Find all lesson directories that match the pattern "NN_name" (e.g., 01_hello_world, 02_variables_io)
# - find lessons -maxdepth 1: search only in the lessons/ directory, don't go deeper
# - -type d: find directories only
# - -name "[0-9][0-9]*_*": match directories starting with 2 digits, underscore, then anything
# - | sort: sort the results alphabetically to ensure consistent order
LESSONS := $(shell find lessons -maxdepth 1 -type d -name "[0-9][0-9]*_*" | sort)

# Declare phony targets (targets that don't create files with the same name)
# This prevents conflicts if files with these names exist in the directory
.PHONY: all test clean format tree

# Default target: build all lessons
# This target is called when you run 'make' without any arguments
all:
	@for d in $(LESSONS); do \
	  echo "==> Building $$d"; \
	  $(MAKE) -C $$d; \
	done

# Run tests for all lessons
# Iterates through each lesson directory and runs its test target
# The '|| exit $$?' ensures that if any test fails, the entire process stops
test:
	@for d in $(LESSONS); do \
	  echo "==> Testing $$d"; \
	  $(MAKE) -C $$d test || exit $$?; \
	done

# Clean build artifacts from all lessons
# Removes compiled binaries, object files, and other generated files
# This gives you a fresh start for rebuilding everything
clean:
	@for d in $(LESSONS); do \
	  echo "==> Cleaning $$d"; \
	  $(MAKE) -C $$d clean; \
	done

# Format all C source files using clang-format
# Runs the format.sh script which applies consistent code styling
# Requires clang-format to be installed on the system
format:
	@./tools/format.sh

# Display the directory structure of lessons (useful for debugging)
# Shows all lesson directories up to 3 levels deep
# Helps verify that the LESSONS variable is finding the right directories
tree:
	@find . -maxdepth 3 -type d -name "[0-9][0-9]*_*" -print
