	section .data

	LF	equ	10
	NULL	equ	0
	TRUE	equ	1
	FALSE	equ	0
	EXIT_SUCCESS	equ	0
	STDIN	equ	0
	STDOUT	equ	1
	STDERR	equ	2

	SYS_read	equ	0
	SYS_write	equ	1
	SYS_open	equ	2
	SYS_close	equ	3
	SYS_fork	equ	57
	SYS_exit	equ	60
	SYS_creat	equ	85
	SYS_time	equ	201

	O_CREAT	equ	0x40
	O_TRUNC	equ	0x200
	O_APPEND	equ	0x400

	O_RDONLY	equ	000000q
	O_WRONLY	equ	000001q
	O_RDWR	equ	000002q

	S_IRUSR	equ	00400q
	S_IWUSR	equ	00200q
	S_IXUSR	equ	00100q

	count	equ	10
	newLine	db	LF, NULL
	header	db	LF, "File Write Example."
		db	LF, LF, NULL

	fileName	db	"foo.txt", NULL
	msg	db	0x00
	len	dq	$-msg
	writeDone	db	"Write Completed.", LF, NULL
	fileDesc	dq	0
	errMsgOpen	db	"Error opening file.", LF, NULL
	errMsgWrite	db	"Error writing file.", LF, NULL

	mov	rdi, header
	call	printstring

	section .text
	
openInputFile:
	mov	rax, SYS_creat
	mov	rdi, fileName
	mov	rsi, S_IRUSR | S_IWUSR
	syscall

	cmp	rax, 0
	jl	errorOnOpen
	
	mov	qword [fileDesc], rax

	mov	rax, SYS_write
	mov	rdi, qword [fileDesc]
	mov	rsi, msg
	mov	rdx, qword [len] 
	syscall

	cmp	rax, 0
	jl	errorOnWrite

	mov	rdi, writeDone
	call	printstring

	mov	r8, count

WriteLoop:

	sub	r8, 1
	jz	startClose
	
	mov	rax, SYS_write
	mov	rdi, qword [fileDesc]
	mov	rsi, msg
	mov	rdx, qword [len]
	syscall

	cmp	rax, 0
	jl	errorOnWrite

	mov	rdi, writeDone
	call	printstring

	add	WORD [msg], 1
	jmp	WriteLoop

startClose:	
	mov	rax, SYS_close
	mov	rdi, qword [fileDesc]
	syscall

	jmp	exampleDone
	
errorOnOpen:
	mov	rdi, errMsgOpen
	call	printstring

	jmp	exampleDone

errorOnWrite:
	mov	rdi, errMsgWrite
	call	printstring

	jmp	exampleDone

exampleDone:
	mov	rax, SYS_exit
	mov	rdi, EXIT_SUCCESS
	syscall

	global printstring

printstring:
	push	rbp
	mov	rbp,rsp
	push	rbx

	mov	rbx, rdi
	mov	rdx, 0

strCountLoop:
	cmp	byte [rbx], NULL
	je	strCountDone
	inc	rdx
	inc	rbx
	jmp	strCountLoop

strCountDone:
	cmp	rdx, 0
	je	ptrDone

	mov	rax, SYS_write
	mov	rsi, rdi
	mov	rdi, STDOUT

	syscall

ptrDone:
	pop	rbx
	pop	rbp
	ret

	global _start

_start:
	call	openInputFile
