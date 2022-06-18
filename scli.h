#ifndef SAMOSC_SCLI_H
#define SAMOSC_SCLI_H

enum
{
    EXE_HELP = 0,
    EXE_QUIT
};

int yymain(int argc, char *argv[]);

void op_print_help_menu();

#endif // SAMOSC_SCLI_H