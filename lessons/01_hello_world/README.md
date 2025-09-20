# Hello, World 👋

**Goal:** Compile and run your first C program using a per-lesson `Makefile`, understand the build artifacts, and run a tiny test.

---

## What's in this lesson

```
01_hello_world/
├─ README.md         ← this file
├─ Makefile          ← lesson build rules
├─ src/
│  └─ hello.c        ← the program
└─ tests/
    └─ test_hello.sh  ← simple correctness test
```

---

## The program (`src/hello.c`)

```c
#include <stdio.h>

int main(void) {
     puts("Hello, C-101!");
     return 0;
}
```

### Line-by-line

- `#include <stdio.h>` — pulls in the standard I/O library (declares `puts`, `printf`, etc.).
- `int main(void)` — program entry point. Returning an int is required by the C standard.
- `puts("Hello, C-101!");` — prints the string and a newline.  
  (Compared to `printf`, `puts` is simpler when you don't need formatting.)
- `return 0;` — exit status to the OS. Convention: 0 = success, non-zero = error.

**Tip:** If you need formatting (variables, numbers), use `printf("x=%d\n", x);`.  
`puts` automatically appends `\n`; `printf` prints exactly what you ask.

---

## Build & Run

From the repo root (`c-101/`):

```bash
make -C lessons/01_hello_world          # build this lesson
make -C lessons/01_hello_world run      # run the program
```

Expected output:

```
Hello, C-101!
```

You can also build everything in the repo:

```bash
make       # builds all lessons
```

---

## The lesson Makefile (how it works)

```makefile
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
```

### How it works

- **OBJDIR / BINDIR** — where object files and binaries go.
- **include ../../common.mk** — imports shared rules & flags:
  - CC (compiler), CFLAGS (warnings, `-std=c11`), and a pattern rule that compiles `src/*.c` → `build/*.o`.
- **all** builds the final binary `bin/hello` by linking `build/hello.o`.
- **run** executes the binary.
- **test** runs the shell test in `tests/`.

**Why include order matters:** OBJDIR/BINDIR are set before including `common.mk` so the shared pattern rule knows where to place objects.

---

## Testing

`tests/test_hello.sh` checks that the program prints the expected line.

```bash
chmod +x tests/test_hello.sh          # one-time: make it executable
make -C lessons/01_hello_world test   # run the test
```

You should see:

```
✅ Hello World test passed.
```

If you changed the message in `hello.c`, update the expected text in the test file accordingly.

---

## Manual Compile (optional)

If you want to bypass Make for learning:

```bash
gcc -std=c11 -Wall -Wextra -O2 src/hello.c -o hello
./hello
```

---

## Common Issues & Fixes

### No rule to make target 'build/hello.o'

Ensure `common.mk` has this rule and uses tabs (not spaces):

```makefile
$(OBJDIR)/%.o: src/%.c
    @mkdir -p $(OBJDIR)
    $(CC) $(CFLAGS) $(INCLUDES:%=-I%) -c $< -o $@
```

And make sure your lesson Makefile sets `OBJDIR := build` before including `common.mk`.

### Permission denied when running test

Run `chmod +x tests/test_hello.sh`.

### CI or Ubuntu missing build tools

Install toolchain:  
`sudo apt-get update && sudo apt-get install -y build-essential`

### Windows newline issues

If you edited files in Windows and tests fail due to `\r\n`, normalize with:

```bash
sed -i 's/\r$//' tests/test_hello.sh
```

---

## Exercises

1. Change the message to print your name (e.g., `Hello, Sanath!`) and re-run `make run`.
2. Use `printf` to print two lines: your name and today's date.
3. Return a non-zero exit code (e.g., `return 42;`) and observe `$?`:

    ```bash
    make run ; echo $?
    ```

4. Add a `make check` target that runs both `run` and `test`.

---

## What you learned

- Minimal C program structure (`main`, `#include`, return code).
- Difference between `puts` and `printf`.
- How Make builds `src/*.c` → `build/*.o` → `bin/hello`.
- Running per-lesson targets with `make -C`.

**Next up:** Variables & I/O → reading input with `scanf`, printing with `printf`.
