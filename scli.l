%{
    #include "scli.h"
    #include "scli.tab.h"

    int yyerror(char s[]) {
        fprintf(stderr, "%s\n", s);
        return 0;
    }
%}

key_help "help"
key_quit "quit"
key_load "load"
key_save "save"
name [a-zA-Z_][a-zA-Z0-9_]*
file_name ({name}\.[a-z]+)
wspace [ \t]+
endl [ \t]*\n[ \t\n]*

%%

{key_help} {printf("<lexlog help>\n"); return KEY_HELP;}

{key_quit} {printf("<lexlog quit>\n"); return KEY_QUIT;}

{key_load} {printf("<lexlog load>\n"); return KEY_LOAD;}

{key_save} {printf("<lexlog save>\n"); return KEY_SAVE;}

{file_name} {printf("<lexlog file_name>\n"); sscanf(yytext, "%s", yylval.str); return FILE_NAME;}

{name} {printf("<lexlog name>\n"); sscanf(yytext, "%s", yylval.str); return NAME;}

{endl} {printf("<lexlog endl>\n"); return ENDL;}

{wspace} {printf("<lexlog wspace>\n"); return WSPACE;}


. {printf("<lexlog other>\n"); return OTHER;}

%%

int yywrap(){
    return 1;
}
