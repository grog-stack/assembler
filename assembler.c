#include "stdio.h"
#include "stdlib.h"
#include "lex.yy.c"

void showHelp() {
    printf("Usage: \n");
    printf("\tgasm [filename]\n");
}

int main(int args, char **argv) {
    printf("Grog Virtual Machine Assembler\n");
    if (args < 2) {
        showHelp();
        return 1;
    }
    char *filename = argv[1];
    printf("Parsing %s\n", filename);
    
    yyin = fopen(filename, "r");
    yylex();
    fclose(yyin);
    return 0;
}