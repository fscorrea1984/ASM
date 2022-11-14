	.section .data

str:	.asciz	"Hello World!\n"
	.set	str_len,.-str


	.section .text

	.globl _start

_start:
	movq	$0x01,%rax
	movq	$0x01,%rdi
	movl	$str,%esi
	movq	$str_len,%rdx
	syscall

	movq	$0x3c,%rax
	xorq	%rdi,%rdi
	syscall
