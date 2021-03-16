%option noyywrap
%{
#define YYSTYPE void*
#include "matcal.tab.h"
%}

/* Flex definitions */
whitespace	[ \t]+
newline         [\n]
integer         [0-9]+

/********** Start: add your definitions here **********/
add             [+]
sub             [-]
mult            [*]
leftbrack	[(]
rightbrack	[)]
comma           [,]
semicolon	[;]
leftsquare	[[]
rightsquare     []]

/********** End: add your definitions here **********/

%%
 /********** Start: add your rules here. **********/

{add}           {return ADD;}
{sub}           {return SUB;}
{mult}          {return MULT;}
{leftbrack}     {return LB;}
{rightbrack}    {return RB;}
{comma}          {return COMMA;}
{semicolon}     {return SEMICOLON;}
{leftsquare}     {return LS;}
{rightsquare}    {return RS;}
 /********** End: add your rules here **********/

{integer}	{ yylval = (void*)atol(yytext); return T_INT; }
{newline}	{ return T_NL; }
{whitespace}    /* ignore white spaces */
%%

