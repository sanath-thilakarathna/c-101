# C-101 — Learn C with Makefiles

C-101 is a beginner-friendly repository to **learn the C programming language from scratch**.  
Each lesson is self-contained with:
- 📂 Source code (`src/`)
- 🧪 Simple tests (`tests/`)
- 🛠️ A `Makefile` for building and running

The repo also demonstrates how to use **Makefiles** effectively while learning C.

---

## 🚀 Quick Start

Clone and enter the repo:

```bash
git clone https://github.com/<your-username>/c-101.git
cd c-101
```

Build all lessons:

```bash
make
```

Run all tests:

```bash
make test
```

Clean everything:

```bash
make clean
```

Format all source files (requires clang-format):

```bash
make format
```

Work with individual lessons:

```bash
# Build and run a specific lesson
make -C lessons/01_hello_world run

# Test a specific lesson
make -C lessons/01_hello_world test

# Dry run (show commands without executing) for a lesson
make -n -C lessons/01_hello_world run
```

---



## 📂 Repository Structure

```
c-101/
├─ README.md              # this file
├─ Makefile               # top-level build/test driver
├─ common.mk              # shared compiler flags and rules
├─ .gitignore             # ignore build artifacts
├─ .clang-format          # code style
├─ tools/                 # helper scripts
│  └─ format.sh
├─ .github/workflows/     # CI/CD config
│  └─ ci.yml
├─ lessons/               # each topic = one lesson
│  ├─ 01_hello_world/     
│  │  ├─ src/hello.c
│  │  ├─ tests/test_hello.sh
│  │  └─ Makefile
│  ├─ 02_variables_io/
│  │  ├─ src/main.c
│  │  ├─ tests/test_io.sh
│  │  └─ Makefile
│  ├─ 03_control_flow/    # placeholder
│  ├─ 04_functions/
│  │  ├─ include/mathx.h
│  │  ├─ src/mathx.c
│  │  ├─ tests/test_mathx.c
│  │  └─ Makefile
│  └─ ... (05–14 more lessons)
└─ libs/                  # reusable code (optional)
   └─ tinytest/           # lightweight test framework (future)
```

---

## 📖 Learning Path

1. **Hello World** — your first C program
2. **Variables & I/O** — printf, scanf, data types
3. **Control Flow** — if, switch, loops
4. **Functions & Headers** — modular code, header files
5. **Arrays & Pointers**
6. **Strings** — strlen, strcpy, memory safety
7. **Structs & Enums**
8. **Files** — read/write with fopen
9. **Compilation & Linking**
10. **Makefiles** — pattern rules, phony targets
11. **Dynamic Memory** — malloc, free
12. **Debugging with gdb**
13. **Unit Testing**
14. **Mini Projects**

---

## ⚙️ Requirements

- **Linux/macOS/WSL**: gcc (or clang) + make
- **Windows (without WSL)**: Install MSYS2 or Mingw-w64

Check installation:

```bash
gcc --version
make --version
```

---

## 🤝 Contributing

- Keep lessons minimal and focused.
- Add one working test per lesson.
- Run `make format` before committing.

---

## 📜 License

MIT License — free to use, modify, and share.