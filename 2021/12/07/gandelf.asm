section .data
test:
        db 0x8b, 0x9a, 0x8c, 0x8b, 0x9e, 0x91
        db 0x9b, 0x90, 0xdf, 0xce, 0xcd, 0xcc,
        db 0xf5, 0xff

section .text
        global _start
_start:

        mov rsi, 0x402000

decrypt:
        mov al, [rsi+rdx]
        not al
        mov [rsi + rdx], al
        inc rdx
        test al, al
        jne decrypt

; print
        xor rax, rax
        xor rdi, rdi
        mov al, 1
        mov dil, 1

        syscall

; exit
        mov al, 60
        syscall
