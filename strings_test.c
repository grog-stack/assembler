#include "stdio.h"
#include "strings.c"

#define OK 0
#define FAILURE 1
typedef int test_result;

void failed(char *str, char c, int expected, int actual){
    fprintf(stderr, "Failure finding position of '%c' in '%s': expected %d, got %d\n", c, str, expected, actual);
}

test_result assert(char *str,char c, int expected) {
     int position = str_first_occurrence(str, c);
    if (position != expected) {
        failed(str, c, expected, position);
        return FAILURE;
    }
    return OK;
}

int main(int args, char **argv) {
    int failures = 0;
    failures += assert("test_file.asm", '.', 9);
    failures += assert("test_file.asm", 't', 0);
    if (failures > 0) {
        printf("Total failures: %d\n", failures);
        return FAILURE;
    }
    printf("Success!\n");
    return OK;
}