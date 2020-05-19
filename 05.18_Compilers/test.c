/* Copy the contents of the file "stdio.h": */
#include <stdio.h>

/* Find and replace all instances of "PI" with "3.14":
 * Equivalent to Java's "public static final double PI = 3.14;" */
#define PI 3.14

int main(int argc, char* argv[]) {
    printf("%f\n", PI);

    return 0;
}
