all:
	as --gdwarf-2 int3.asm -o int3.o
	ld -g -o prog int3.o

clean:
	rm -rf prog int3.o *~
	clear
