
# Lesson 02: Variables & I/O
# Set dirs BEFORE including common.mk so pattern rules see them.
OBJDIR := build
BINDIR := bin
TARGET := vars_io

ROOT := ../../
include $(ROOT)/common.mk

SRCS := src/main.c
OBJS := $(OBJDIR)/main.o

.PHONY: all run test clean

all: $(BINDIR)/$(TARGET)

$(BINDIR)/$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

run: all
	@printf "Alice\n21\n1.65\n" | $(BINDIR)/$(TARGET)

test: all
	@cd tests && ./test_io.sh

clean:
	@rm -rf $(OBJDIR) $(BINDIR)
