%{

#include "y.tab.h"

%}

	/* Named regurlar expressions refered below with ``{name}'' */
qstr 	["](\\["\\/bfnrt]|\\u[A-Fa-f0-9]{4}|[^"\\[:cntrl:]])*["]
num	-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][-+]?[0-9]+)?
ws	[\x00-\x20]+

%%

	/* Notice how ``yytext'' contains the text read and how the union
	 * ``yylval'' is assigned */
true	{ return XTRUE; }
false	{ return XFALSE; }
null	{ return XNULL; }
{num}	{ yylval.num = atof(yytext); return NUM; }
{qstr}	{ yylval.str = strdup(yytext); return QSTR; }
{ws}	/* Ignore */
.	{ return yytext[0]; }
