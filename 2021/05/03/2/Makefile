prog: foo.c bar.o
	gcc -ggdb3 foo.c bar.o -o prog

bar.o: bar.asm
	as --gdwarf-2 bar.asm -o bar.o

clean:
	rm -rf *~ *.o prog
	clear
