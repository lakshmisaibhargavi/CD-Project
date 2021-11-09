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
"<" {yylval = strdup(yytext);return lt;}
">"     {yylval = strdup(yytext);return gt;}
"="     {yylval = strdup(yytext);return assign;}
"<="    {yylval = strdup(yytext);return lteq;}
">="    {yylval = strdup(yytext);return gteq;}
"=="    {yylval = strdup(yytext);return equal;}
"!="    {yylval = strdup(yytext);return neq;}
"+"     {yylval = strdup(yytext);return add;}
"-"     {yylval = strdup(yytext);return sub;}
"*"     {yylval = strdup(yytext);return mul;}
"/"     {yylval = strdup(yytext);return div;}
"++"    {yylval = strdup(yytext);return incr;}
"--"    {yylval = strdup(yytext);return decr;}
"!"     {yylval = strdup(yytext);return not;}
"||"    {yylval = strdup(yytext);return or;}
"&&"    {yylval = strdup(yytext);return and;}


.    return yytext[0];

%%