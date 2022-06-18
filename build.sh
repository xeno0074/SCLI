bison -dv scli.y
flex scli.l
g++ lex.yy.c scli.tab.c scli.cpp
./a.out test.txt > log.txt
cat log.txt | grep "<lexlog".*">" > lexlog.txt