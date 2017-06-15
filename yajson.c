#include <stdio.h>
#include <string.h>
#include "y.tab.h"

extern int yylineno;

int main(void)
{
	return yyparse();
}

void yyerror(const char *err)
{
	fprintf(stderr, "%d:%s\n", yylineno, err);
}
