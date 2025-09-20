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
