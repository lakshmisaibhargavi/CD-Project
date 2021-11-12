%{
#include<stdio.h>
%}
%token NUMBER IF COUT LT GT ASSIGN LTEQ GTEQ EQUAL NEQ ADD SUB MUL DIV
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%

S: IF '(' E ')' {
    if($3)
    {
        printf("true %d\n",$3);
    }
    else
    {
        printf("false %d\n",$3);
    }
}
| E { printf("sum is: %d",$1);}
;

E: E ADD E { $$ = $1 + $3; }
| E SUB E { $$ = $1 - $3; }
| E MUL E { $$ = $1 * $3; }
| E DIV E { if($3 == 0)yyerror("Divide by zero");else$$ = $1 / $3; }
| '-'E %prec UMINUS { $$ = -$2; }
| '(' E ')' { $$ = $2; }
| R { $$ = $1; }
| NUMBER { $$ = $1; }
;

R: R GT R { 
    if($$ = $1 > $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    } 

| R LT R  { 
    if($$ = $1 < $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    } 
| R NEQ R { 
    if($$ = $1 != $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }
| R EQUAL R { 
    if($$ = $1 == $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }
| R LTEQ R { 
    if($$ = $1 <= $3)
    {
        printf("true\n");
    }
    else
    {
        printf("false\n");
    }
    }
| R GTEQ R { 
    if($$ = $1 >= $3)
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