	.section .text
	.globl f
	
f:	movl %edi,%ebx
	movl %esi,%ecx
	pext %ecx,%ebx,%eax
	ret
