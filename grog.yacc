
%{
#define YYDEBUG 1
int yylex();
int yyerror(char *s);

// Callbacks for recognized instructions
void hcf();
void load();
void store();
%}

%token HCF LOAD STORE HEX ADDRESS;

%%

statements:
        statements statement /* this is how we achieve multiple statements... O_o */
        | /* end */
        ;

statement:
            operation
            ;

operation:
            opcode parameters
            ;

opcode:
        HCF
        | LOAD
        | STORE
        ;

parameters:
            parameters parameter
            | /* end */
            ;

parameter:
            ADDRESS
            | HEX
            ;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int yywrap(void) {
    return 1;
}
