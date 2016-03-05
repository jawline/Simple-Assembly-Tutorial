global _start

section .text

print_hello:

    push    dword msg.len
    push    dword msg
    push    dword 1
    mov     eax, 4
    sub     esp, 4
    int     0x80
    add     esp, 16

    ret

exit_program:
    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

_start:
    call print_hello
    jmp exit_program


section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg