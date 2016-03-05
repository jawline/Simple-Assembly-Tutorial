global _start
extern _printf

section .text

exit:
    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

print_eax:  
    mov ebp, esp
    and esp, 0xFFFFFFF0
    sub esp, 16
    mov dword [esp], msg
    mov dword [esp + 4], eax
    call _printf
    mov esp, ebp
    ret

fact:
    cmp eax, 0
    jne fact_recurse

fact_base_case:
    mov eax, 1
    jmp fact_exit

fact_recurse:
    push eax
    sub eax, 1
    call fact
    mov ebx, eax
    pop eax
    imul eax, ebx

fact_exit:
    ret

_start:

    pop     eax
    pop     ebx
    mov     ebp,                esp
    and     esp,                0xFFFFFFF0

    mov eax, 4
    call fact
    call print_eax

    jmp exit

section .data

msg:    db      "EAX: %i", 10, 0
.len:   equ     $ - msg