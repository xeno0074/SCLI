%union{
	char str[20];
    int num;
}

%token WSPACE 
%token OTHER 
%token NLINE
%token KEY_HELP
%token KEY_QUIT
%token KEY_LOAD
%token KEY_SAVE
%token <num> NUM
%token <str> NAME
%token <str> FILE_NAME
%token PRG_EOF

%{
#define YYDEBUG 1

#include <stdio.h>

extern int yylex();
extern FILE *yyin;
extern int yyerror(char *s);
%}

%%

prog_ex:
 prog
 |
 prog stmt_ex
 ;

prog:
 prog stmt_ex NLINE
 |
 NLINE
 |
 ;

stmt_ex:
 sns KEY_HELP sns {printf(">> welcome to scli help menu\n");}
 |
 sns KEY_QUIT sns {printf(">> quitting.. \n");}
 |
 sns KEY_LOAD sns {printf(">> loading.. \n");}
 |
 sns KEY_LOAD WSPACE FILE_NAME sns {printf(">> loading from %s.. \n", $4);}
 |
 sns KEY_SAVE sns {printf(">> saving.. \n");}
 |
 sns KEY_SAVE WSPACE FILE_NAME sns {printf(">> saving to %s.. \n", $4);}
 |
 sns
 ;

sns:
 WSPACE
 |
 ;

%%

int main(int argc, char *argv[]){
    yydebug = 1;

    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
    return 0;
}