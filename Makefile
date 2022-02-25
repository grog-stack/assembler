build: lexer
	gcc -o assembler assembler.c -ly -ll
lexer: yacc
	lex grog.lex
yacc:
	yacc --defines grog.yacc
clean:
	rm lex.yy.c y.tab.c assembler