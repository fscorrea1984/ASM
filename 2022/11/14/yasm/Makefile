all:
	yasm -g dwarf2 -f elf64 example.asm -l example.lst
	ld -g -o example example.o
clean:
	rm -rf *.lst *.o example *~
	clear
