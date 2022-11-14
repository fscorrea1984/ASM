	.section .text
	.globl getlen

getlen:
	xorq %rax,%rax
	xorq %rcx,%rcx
	not %ecx		; or ecx 0xffffffff
	repne scasb
	not %ecx
	decl %ecx
	movl %ecx,%eax
	ret
