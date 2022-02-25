#include "stdio.h"
#include "stdlib.h"
#include "strings.c"
#include "y.tab.c"
#include "lex.yy.c"

#define OUTPUT_FILE_NAME "o.rom"

FILE *output;

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
    char *outputFileName = args > 2 ? argv[2] : OUTPUT_FILE_NAME;
    printf("Parsing %s\n", filename);
    yyin = fopen(filename, "r");
    output = fopen(outputFileName, "wb");
    yyparse();
    
    fclose(yyin);
    fclose(output);
    return 0;
}

void hcf() {
    fputc(0x00, output);
}