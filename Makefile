build: lexer
	gcc -o gasm assembler.c -ly -ll
lexer:
	lex grog.lex