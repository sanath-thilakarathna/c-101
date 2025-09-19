# Build/test/clean/format across all lessons

LESSONS := $(shell find lessons -maxdepth 1 -type d -name "[0-9][0-9]*_*" | sort)

.PHONY: all test clean format tree

all:
	@for d in $(LESSONS); do \
	  echo "==> Building $$d"; \
	  $(MAKE) -C $$d; \
	done

test:
	@for d in $(LESSONS); do \
	  echo "==> Testing $$d"; \
	  $(MAKE) -C $$d test || exit $$?; \
	done

clean:
	@for d in $(LESSONS); do \
	  echo "==> Cleaning $$d"; \
	  $(MAKE) -C $$d clean; \
	done

format:
	@./tools/format.sh

tree:
	@find . -maxdepth 3 -type d -name "[0-9][0-9]*_*" -print
