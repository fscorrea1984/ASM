foo: foo.cpp bar.o
	g++ -g -std=c++17 foo.cpp bar.o -o foo

bar.o: bar.asm
	as --gdwarf-2 bar.asm -o bar.o

clean:
	rm -rf *~ *.o foo
	clear
