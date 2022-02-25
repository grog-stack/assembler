%{
#include "y.tab.h"
%}
%%
^HCF                { return HCF; } 
^LOAD               { return LOAD; } 
^STORE              { return STORE; } 
r[0-9a-fA-F]        { return RECORD; } 
[ \t\r]             ;                               /* skip whitespace */
.                   yyerror("invalid character");   /* anything else is an error */
%%
