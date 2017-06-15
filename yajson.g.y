%{

extern int yylex();
extern int yyerror(const char *);

%}

%define parse.error verbose

%union {
	char *str;
	double num;
}

%start value
%token XTRUE XFALSE XNULL

	/* These values is set in ``yajson.lx.l'' */
%token <str> QSTR
%token <num> NUM

%%

value
	: object
	| string
	| array
	| number
	| literal

object
	: '{' kvpairs '}'
	| '{' '}'

kvpairs
	: kvpair
	| kvpair ',' kvpairs

kvpair
	: key ':' value

key
	: string

string
	: QSTR

array
	: '[' values ']'
	| '[' ']'

values
	: value
	| value ',' values

number
	: NUM

literal
	: XTRUE
	| XFALSE
	| XNULL
