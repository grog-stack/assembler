build: lexer
	gcc -o assembler assembler.c -ly -ll
lexer: yacc
	lex grog.lex
yacc:
	yacc --verbose --debug --defines grog.yacc
clean:
	rm lex.yy.c y.tab.c assembler
test: build
	gcc -o run_tests strings_test.c
	./run_tests
	rm ./run_tests