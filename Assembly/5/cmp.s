global _start
extern _printf

section .text

exit:
    push    dword 0
    mov     eax, 1
    sub     esp, 12
    int     0x80

print_numbers:  
    mov ebp, esp
    and esp, 0xFFFFFFF0
    sub esp, 16
    mov dword [esp], msg
    mov dword [esp + 4], 1960
    mov dword [esp + 8], 1980
    call _printf
    mov esp, ebp
    ret

print_hi:
    mov ebp, esp
    and esp, 0xFFFFFFF0
    sub esp, 16
    mov dword [esp], other
    call _printf
    mov esp, ebp
    ret

do_compare:
    cmp eax, 0
    jne do_compare_fail

do_compare_good:
    call print_numbers
    jmp do_compare_exit

do_compare_fail:
    call print_hi

do_compare_exit:
    ret

_start:
    mov eax, 0
    call do_compare

    mov eax, 10
    call do_compare

    jmp exit

section .data

msg:    db      "Print the number %i and %i", 10, 0
.len:   equ     $ - msg

other: db       "Saying HI", 10, 0
.len: equ $ - msg