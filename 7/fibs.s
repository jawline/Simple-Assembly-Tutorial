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

fibs:
    cmp eax, 0
    je fibs_exit

    cmp eax, 1
    je fibs_exit

    jmp fibs_recurse

fibs_recurse:
    push ebx ;EBX used to store temp data

    ;Recurse FIBS(eax - 2) but save EAX for later
    push eax
    sub eax, 2
    call fibs
    mov ebx, eax
    pop eax

    sub eax, 1
    call fibs ;Recurse FIBS(eax - 1)

    add eax, ebx ;Leave result FIBS(eax - 1) + FIBS(eax - 2) in EAX

    pop ebx

fibs_exit:
    ret

_start:

    pop     eax
    pop     ebx
    mov     ebp,                esp
    and     esp,                0xFFFFFFF0

    mov eax, 6
    call fibs
    call print_eax

    jmp exit

section .data

msg:    db      "EAX: %i", 10, 0
.len:   equ     $ - msg