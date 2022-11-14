strlen:
    mov rax, -1
again:
    inc rax
    cmp byte [rdi+rax], 0
    jnz again
    ret
