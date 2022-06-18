#include <iostream>
#include <iomanip>
#include "scli.tab.h"
#include "scli.h"

using namespace std;

void op_print_help_menu()
{
    int numEmptyChars = 80;
    char emptyChar = '-';
    cout << "commands:" << endl
         << setfill(emptyChar) << setw(numEmptyChars) << left
         << "    >add [Data,ID,Amount,Transaction Type,Date & Time,Tags] "
         << " enter an entry into the current database" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >load "
         << " load from default file .saved_entries.csv" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >load file_name "
         << " load from file_name" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >save "
         << " save to default file .saved_entries.csv" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >save file_name "
         << " save to file_name" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >get num entries "
         << " display the number of entries available" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left
         << "    >get total debit OR >get total credit OR >get total amount "
         << " display current total debit or credit or amount respectively" << endl

         << setfill(emptyChar) << setw(numEmptyChars) << left << "    >get last entry "
         << " display the last entered entry" << endl;
}

int main(int argc, char *argv[])
{
    yymain(argc, argv);
    return 0;
}