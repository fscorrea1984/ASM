	.globl _start
	.text
_start:
	xorq %rax,%rax
	xorq %rdi,%rdi
	xorq %rsi,%rsi
	xorq %rdx,%rdx

	;; cleaning (zero-ing) the four registers with xor

	movb $0x1,%al ;; 0x01 = 01 = write()
	movw $0x1,%di
	mov $msg,%rsi
	movb msglen,%dl
	syscall

	movq $0x3C,%rax ;; 0x3C = 60 = exit()
	xorq %rdi,%rdi
	syscall

	.data
msg:
	.asciz "Hello World\n"
msglen:
	.byte .-msg

	;; "msg" is a memory location, as is "msglen"
	;; the difference between them, the offset ".-msg", is, thereby, the length of the message in bytes (the dot represents the memory address of where the expression is, "here")
	;; "Hello World\n" has 12 bytes, not counting the terminating zero if it's there (should be, .asci"z" is meant to put it there)
