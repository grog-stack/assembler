%{
int yyerror(char *s);
%}
hex                 [0-9a-fA-F]
%%
^HCF                return HCF;
^LOAD               return LOAD;
^STORE              return STORE;
"@"{hex}{hex}       return ADDRESS;
{hex}               return HEX;
[ \t\n]             ;                               /* skip whitespace */
.                   yyerror("invalid character");   /* anything else is an error */
%%
