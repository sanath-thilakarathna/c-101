# Makefile for Lesson 01: Hello World
# This demonstrates the basic structure of a C program build system

# Put OBJDIR/BINDIR before include (so rules see them)
OBJDIR := build
BINDIR := bin
TARGET := hello

ROOT := ../../
include $(ROOT)/common.mk   # <-- must be .../common.mk

# Source and object file configuration
SRCS := src/hello.c
OBJS := $(OBJDIR)/hello.o

.PHONY: all run test clean

all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $^ -o $@

run: all
	@$(BINDIR)/$(TARGET)

test: all
	@cd tests && ./test_hello.sh

clean:
	@rm -rf $(OBJDIR) $(BINDIR)
