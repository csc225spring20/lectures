#include <stdio.h>
#include <stdlib.h>

int* foo() {
    int *a2 = (int *)malloc(sizeof(int) * 2);
    a2[0] = 5;
    a2[1] = 5;
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
    printf("a3: %d, %d\n", a3[0], a3[1]);

    free(a1);
    free(a3);

    return 0;
}
