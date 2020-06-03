#include <stdio.h>

int* foo() {
    int a2[2] = {5, 5};
    return a2;
}

int main(void) {
    int *a1, *a3;

    a1 = foo();
    printf("a1: %d, %d\n", a1[0], a1[1]);
    a1[0] = 0;
    a1[1] = 1;
    printf("a1: %d, %d\n", a1[0], a1[1]);

    a3 = foo();
    printf("a1: %d, %d\n", a1[0], a1[1]);

    return 0;
}
