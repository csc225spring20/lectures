#include <stdio.h>

void foo(int a2[]) {
    a2[0] = 5;
}

int main(void) {
    int a1[2];

    printf("a1: %d, %d\n", a1[0], a1[1]);
    foo(a1);
    printf("a1: %d, %d\n", a1[0], a1[1]);

    return 0;
}
