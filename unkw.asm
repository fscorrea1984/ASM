section .data
argc:
db 0,0,0,0,0,0,0,0

str:
db "Ola mundo", 0x0a
newline_char:
db 0x0a

section .text

break_line:
    push rax
    push rdi
    push rsi
    push rdx
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall
    pop rdx
    pop rsi
    pop rdi
    pop rax
    ret
strlen:
    mov rax, -1
again:
    inc rax
    cmp byte [rdi+rax], 0
    jnz again
    ret

global _start
_start:
    nop
    pop rbx
    mov rcx, 0
process_argv:
    mov rdi, [rsp+8*rcx]
    call strlen
    mov rsi, rdi
    mov rdi, 1
    mov rdx, rax
    push rcx
    mov rax, 1
    syscall
    call break_line
    pop rcx
    inc rcx
    dec rbx
    jnz process_argv

    mov rax, 60
    xor rdi, rdi
    syscall
