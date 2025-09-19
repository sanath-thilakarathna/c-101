OBJDIR := build
BINDIR := bin
TARGET := hello

ROOT := ../../
include $(ROOT)/common.mk

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
