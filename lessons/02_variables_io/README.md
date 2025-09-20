# Lesso## What's in this lesson

```
02_variables_io/
├─ README.md
├─ Makefile
├─ src/
│  └─ main.```

(The run target pipes sample input: Alice, 21, 1.65.)

---

## Test

Run the lesson's test:

```bash
chmod +x lessons/02_variables_io/tests/test_io.sh   # one-time
make -C lessons/02_variables_io test
```

It feeds inputs (Bob, 30, 1.80) and verifies the final summary line contains:

```
Hi Bob, age 30, height 1.80 m
```

---

## Common pitfalls & fixes─ test_io.sh
```bles & I/O

**Goal:** Read user input with `scanf` and print it with `printf`.  
We’ll capture a **name** (`char[]`), **age** (`int`), and **height** (`double`) and then print a summary.

---

## What’s in this lesson

02_variables_io/
├─ README.md
├─ Makefile
├─ src/
│ └─ main.c
└─ tests/
└─ test_io.sh


---

## The program (`src/main.c`)

```c
#include <stdio.h>

int main(void) {
    char name[20];   // up to 19 chars + '\0'
    int age = 0;
    double height = 0.0; // meters

    // Prompt & read name (single word)
    printf("Enter your name: ");
    fflush(stdout);
    if (scanf("%19s", name) != 1) {
        fprintf(stderr, "Input error: name\n");
        return 1;
    }

    // Prompt & read age
    printf("Enter your age (years): ");
    fflush(stdout);
    if (scanf("%d", &age) != 1) {
        fprintf(stderr, "Input error: age\n");
        return 1;
    }

    // Prompt & read height
    printf("Enter your height (m): ");
    fflush(stdout);
    if (scanf("%lf", &height) != 1) {
        fprintf(stderr, "Input error: height\n");
        return 1;
    }

    // Output summary
    printf("Hi %s, age %d, height %.2f m\n", name, age, height);
    return 0;
}
```

### Line-by-line highlights

- `char name[20];` — reserves 20 bytes for the name (19 visible chars + '\0' terminator).
- `scanf("%19s", name)` — reads a single word (no spaces), capped at 19 chars to avoid overflow.
- `scanf("%d", &age)` — & passes the address of age because scanf writes into your variable.
- `scanf("%lf", &height)` — %lf is required for double. (%f is for float in scanf.)
- `fflush(stdout)` — ensures the prompt text appears before the program waits for input (handy on some terminals/IDE consoles).
- `printf("...%.2f...", height)` — formats height to two decimal places.

⚠️ **Warning:** `scanf("%s", name)` without a field width is unsafe. Always bound strings: `"%19s"` for `char name[20];`

---

## Build & run

From repo root (`c-101/`):

```bash
make -C lessons/02_variables_io          # build this lesson
make -C lessons/02_variables_io run      # run with sample input
```

You should see:

```
Enter your name: Enter your age (years): Enter your height (m): Hi Alice, age 21, height 1.65 m
```
(The run target pipes sample input: Alice, 21, 1.65.)

Test
Run the lesson’s test:

bash
Copy code
chmod +x lessons/02_variables_io/tests/test_io.sh   # one-time
make -C lessons/02_variables_io test
It feeds inputs (Bob, 30, 1.80) and verifies the final summary line contains:

## Common pitfalls & fixes

### Nothing shows before input?

Ensure prompts are flushed: `fflush(stdout);` after each printf prompt.

### Wrong specifier for double

Use `%lf` in scanf for double. (`%f` is for float in scanf.)

### Spaces in names

`%s` stops at whitespace. To accept full names, use `fgets` into a buffer and strip the trailing `'\n'`.

### CRLF issues on Windows

If tests fail due to line endings, normalize with dos2unix or:

```bash
sed -i 's/\r$//' lessons/02_variables_io/tests/test_io.sh
```

### Input validation

`scanf` returns the count of successfully read items. Check it and handle errors (as shown) to avoid using uninitialized values.

---

## Exercises

### Add BMI

Ask for weight (kg), compute `bmi = weight / (height*height)`, and print with `%.1f`.

### Full name input

Replace the name read with `fgets(name, sizeof name, stdin)`, then strip `'\n'`.

### Robust input

If `scanf` fails, print a friendly error and retry rather than exiting.

### Units

Support height in centimeters as an alternative (e.g., 1.65 or 165 → normalize to meters).

---

## Makefile (how it ties together)

Key targets in `lessons/02_variables_io/Makefile`:

- **all** builds `bin/vars_io`
- **run** pipes sample input into the program
- **test** runs `tests/test_io.sh`
- **clean** removes `build/` and `bin/`

This lesson reuses shared compiler flags and pattern rules from `../../common.mk`.

---

**Previous:** [Lesson 01 — Hello, World](../01_hello_world/)  
**Next:** (coming up) Lesson 03 — Control Flow


