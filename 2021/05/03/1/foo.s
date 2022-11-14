
	.section .text

	.globl _start

_start:
	#;; xorq	%rax,%rax
	#;; xorq	%rbx,%rbx
	#;; xorq %rdi,%rdi
	movq	$0x01,%rax
	movq	$0x01,%rdi
	movq	$str,%rsi
	movq	$len,%rdx
	syscall

	movq	$0x3c,%rax
	xorq	%rdi,%rdi
	syscall

	.section .data

str:	.string	"Hello World!"
	.set	len, .-str
	# 0011 1101
	# 0x3d
	#  0100 0000 0010 0000 0000 0000
	#  1011 1111 1101 1111 1111 1111
	#  0000 0000 0010 0000 0000 0000
	# 0x002000
