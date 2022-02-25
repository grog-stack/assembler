
%{
int yylex();
int yyerror(char *s);
%}

%token HCF

%%

program:
        HCF 
        | 
        ;

%%

int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}

int yywrap(void) {
    return 1;
}