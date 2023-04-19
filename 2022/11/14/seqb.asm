	.section .data
	
name:	.asciz	"foo.bin"
desc:	.quad	0
msg:	.byte	0

;;
	
	.section .text

	.globl _start

_start:
	movq	$2,%rax
	movq	name,%rdi
	movq	$0,%rsi
	movq	$0666,%rdx

	syscall

	cmp	$0x00,%rax
	jz	end
	
	movq	%rax,(desc)

	mov	$0x04,%rax
	movq	(desc),%rdi
	mov	msg,%rsi
	movq	$4,%rdx

	syscall

	cmp	$0x00,%rax
	jz	end
end:	
	movq	$0x3C,%rax
	mov	$0,%rdi

	syscall
