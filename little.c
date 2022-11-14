// int3 has a single byte opcode (0xCC)
section .text
        global _start
_start:
        mov rdi, [rsp]

        ; pular argv
        lea rdi, [rsp + rdi * 8 + 16]

        not rcx

        ; pular envp
        repne scasq

        sub rdi, 8

        ; pular auxv
auxv:
        add rdi, 8
        repne scasq
        cmp qword [rdi], 0
        jne auxv

        int3
