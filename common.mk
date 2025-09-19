# Common compiler & flags
CC       ?= gcc
CFLAGS   ?= -std=c11 -Wall -Wextra -Wshadow -Wconversion -O2 -g
LDFLAGS  ?=
INCLUDES ?=

# Object build rule (per-lesson will set OBJDIR/BINDIR)
$(OBJDIR)/%.o: src/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) $(INCLUDES:%=-I%) -c $< -o $@

# Link rule
$(BINDIR)/%: $(OBJDIR)/%.o
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)
