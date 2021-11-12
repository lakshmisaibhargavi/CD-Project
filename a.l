%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
%}
%%
[0-9]+ {yylval=atoi(yytext);return NUMBER;}
"if" {yylval = strdup(yytext);return IF;}
"cout" {yylval = strdup(yytext);return COUT;}
"<="    {yylval = strdup(yytext);return LTEQ;}
">="    {yylval = strdup(yytext);return GTEQ;}
"=="    {yylval = strdup(yytext);return EQUAL;}
"!="    {yylval = strdup(yytext);return NEQ;}
"<" {yylval = strdup(yytext);return LT;}
">"     {yylval = strdup(yytext);return GT;}
"="     {yylval = strdup(yytext);return ASSIGN;}
"+"     {yylval = strdup(yytext);return ADD;}
"-"     {yylval = strdup(yytext);return SUB;}
"*"     {yylval = strdup(yytext);return MUL;}
"/"     {yylval = strdup(yytext);return DIV;}
[\t] ;
\n return 0;
. return yytext[0];
%%