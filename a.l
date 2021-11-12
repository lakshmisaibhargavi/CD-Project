%{
    #include<string.h>
    #include<stdio.h>
    #include "y.tab.h"
    
%}

alpha [A-Za-z_]
digit [0-9]

%%
[ \t\n] {yylval = strdup(yytext);}
"while" {yylval = strdup(yytext);return WHILE;}
"for" {yylval = strdup(yytext);return FOR;}
"if" {yylval = strdup(yytext);return IF;}
"else" {yylval = strdup(yytext);return ELSE;}
"cout" {yylval = strdup(yytext);return COUT;}
"endl" {yylval = strdup(yytext);return ENDL;}
"break" {yylval = strdup(yytext);return BREAK;}
"continue" {yylval = strdup(yytext);return CONTINUE;}
"int" {yylval = strdup(yytext);return INT;}
"float" {yylval = strdup(yytext);return FLOAT;}
"char" {yylval = strdup(yytext);return CHAR;}
"double" {yyval = strdup(yytext);return DOUBLE;}
"void" {yylval = strdup(yytext);return VOID;}
"#include" {yylval = strdup(yytext);return INCLUDE;}
"main()" {yylval = strdup(yytext);return MAINTOK;}
{digit}+    {yylval = strdup(yytext);return NUM;}
{digit}+.{digit}+ {yylval = strdup(yytext);return FLOAT;}
{alpha}({alpha}|{digit})* {yylval = strdup(yytext);return ID;}
\".*\" {yylval = strdup(yytext);return STRING;}
"<" {yylval = strdup(yytext);return LT;}
">"     {yylval = strdup(yytext);return GT;}
"="     {yylval = strdup(yytext);return ASSIGN;}
"<="    {yylval = strdup(yytext);return LTEQ;}
">="    {yylval = strdup(yytext);return GTEQ;}
"=="    {yylval = strdup(yytext);return EQUAL;}
"!="    {yylval = strdup(yytext);return NEQ;}
"+"     {yylval = strdup(yytext);return ADD;}
"-"     {yylval = strdup(yytext);return SUB;}
"*"     {yylval = strdup(yytext);return MUL;}
"/"     {yylval = strdup(yytext);return DIV;}
"%"     {yylval = strdup(yytext);return MOD;}
"++"    {yylval = strdup(yytext);return INCRE;}
"--"    {yylval = strdup(yytext);return DECR;}
"!"     {yylval = strdup(yytext);return NOT;}
"||"    {yylval = strdup(yytext);return OR;}
"&&"    {yylval = strdup(yytext);return AND;}


.    return yytext[0];

%%
