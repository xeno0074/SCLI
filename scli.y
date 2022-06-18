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
%token ENDL

%{
#define YYDEBUG 1

#include <stdio.h>
#include "scli.h"

extern int yylex();
extern FILE *yyin;
extern int yyerror(char *s);
%}

%%

prog: WSPACE stmts
    | ENDL stmts
    | stmts
    ;

stmts: stmts stmt
     |
     ;

stmt: KEY_HELP ENDL {printf(">> welcome to scli help menu\n");}
    | KEY_QUIT ENDL {printf(">> quitting.. \n");}
    | KEY_LOAD ENDL {printf(">> loading.. \n");}
    | KEY_LOAD WSPACE FILE_NAME ENDL {printf(">> loading from %s.. \n", $3);}
    | KEY_SAVE ENDL {printf(">> saving.. \n");}
    | KEY_SAVE WSPACE FILE_NAME ENDL {printf(">> saving to %s.. \n", $3);}
    ;

%%

int yymain(int argc, char *argv[]){
    yydebug = 0;

    yyin = fopen(argv[1], "r");
    yyparse();
    fclose(yyin);
    return 0;
}