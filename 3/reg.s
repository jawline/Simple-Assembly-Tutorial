global _start

section .text

print:

    push    dword eax
    push    dword ebx
    push    dword 1
    mov     eax, 4
    sub     esp, 4
    int     0x80
    add     esp, 16

    ret

exit:
    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

_start:

    mov eax, msg.len
    mov ebx, msg
    call print

    mov eax, stupid.len
    mov ebx, stupid
    call print

    jmp exit

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg

stupid: db      "Stupid Stupid!", 10
.len: equ $ - msg