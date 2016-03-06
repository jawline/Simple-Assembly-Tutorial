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

strlen:
    mov ebx, 0

strlen_repeat:

    mov ecx, [byte eax+ebx]
    cmp ecx, 0
    je strlen_exit

    add ebx, 1
    jmp strlen_repeat

strlen_exit:
    sub ebx, 1
    mov eax, ebx
    ret

_start:
    mov eax, msg
    call strlen
    call print_eax

    mov eax, test_str
    call strlen
    call print_eax

    mov eax, test_str2
    call strlen
    call print_eax
    jmp exit

section .data

test_str: db "Hello", 10, 0
test_str2: db "Bye", 10, 0
msg:    db      "EAX: %i", 10, 0
.len:   equ     $ - msg