global _start
extern _printf

section .text

exit:
    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

_start:

    pop     eax
    pop     ebx
    mov     ebp,                esp
    and     esp,                0xFFFFFFF0

    sub esp, 16
    mov dword [esp], msg
    mov dword [esp + 4], 1960
    mov dword [esp + 8], 1980
    call _printf
    add esp, 16

    jmp exit

section .data

msg:    db      "Print the number %i and %i", 10, 0
.len:   equ     $ - msg