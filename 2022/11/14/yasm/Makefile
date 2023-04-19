all:
	yasm -g dwarf2 -f elf64 seqbe.asm -l seqbe.lst
	ld -g -o seqbe seqbe.o
clean:
	rm -rf *.lst *.o seqbe *~
	clear
