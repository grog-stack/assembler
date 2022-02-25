
%{
#define YYDEBUG 1
int yylex();
int yyerror(char *s);

// Callbacks for recognized instructions
void hcf();
%}

%token HCF LOAD STORE HEX ADDRESS;

%%

program:
        program statement /* this is how we achieve multiple statements... O_o */
        | /* matches nothing, meaning end of file */
        ;

statement:
            haltAndCatchFire
            | load
            | store
            ;
load:
    LOAD ADDRESS HEX
    ;

haltAndCatchFire: 
                HCF { hcf(); }
                ;

store:
    STORE HEX ADDRESS { printf("store record in memory\n"); }
    ;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int yywrap(void) {
    return 1;
}
