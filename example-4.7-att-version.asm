
	.globl _start
	.text
_start:
	mov	bVal1,%rax
	addb	bVal2,%rax
	movb	%al,bRes

Last:
	xorq	%rax,%rax
	mov	$ox3c,%rax
	xorq	%rdi,%rdi
	syscall

	.data

	bVa11: .byte	17
	bval2:	.byte	9
	bRes: .byte	0
