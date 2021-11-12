%{
#include<stdio.h>
%}
%token NUMBER IF NEQ COUT
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS
%%
S: IF '(' E ')' 
{
    if($3)
    {
        printf("true %d\n",$3);
    }
    else
    {
        printf("false %d\n",$3);
    }
}
;

E: E'+'E { $$ = $1 + $3; }
| E'-'E { $$ = $1 - $3; }
| E'*'E { $$ = $1 * $3; }
| E'/'E { if($3 == 0)
yyerror("Divide by zero");
else
$$ = $1 / $3; }
| '-'E %prec UMINUS { $$ = -$2; }
| '(' E ')' { $$ = $2; }
| E '<' E 
{ 
    if($$ = $1 < $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    } 
| E '>' E { 
    if($$ = $1 > $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }
| E NEQ E { 
    if($$ = $1 != $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }
| E '=''=' E { 
    if($$ = $1 == $4)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }

| NUMBER {$$ = $1;}
;
%%
int main()
{
yyparse();
}
int yywrap(){
return 1;
}
void yyerror(char *s){
printf("Error %s",s);exit(0);
}