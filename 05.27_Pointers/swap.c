#include <stdio.h>

void swap(int *, int *);

int main(void) {
    int z = 1, w = 2;
    swap(&z, &w);

    printf("z: %d, w: %d\n", z, w);
}

/* Passing pointers allows us to emulate pass-by-reference; "swap" has access
 *  to the local variables in "main". */
void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}
