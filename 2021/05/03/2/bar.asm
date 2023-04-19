	.section .text
	.globl add

add:
	push	%rbp
	movq	%rsp,%rbp
	subq	$0x20,%rsp
	movl	%edi,-0x4(%rbp)
	movl	%esi,-0x8(%rbp)
	xorq	%rax,%rax
	movl	-0x8(%rbp),%eax
	addl	-0x4(%rbp),%eax
	leave
	ret
