extern printf
global main

section .data
format_specifier:
    db '%s', 10, 0
format_specifier3:
    db '%i', 10, 0
format_specifier4:
    db '%hi', 10, 0

struc Car
    s_vin resb 50
    s_make resb 25
    s_model resb 30
    s_color resb 10
    s_trip_distances resb 10
endstruc

mycar istruc Car
    at s_vin, dw 12345,
    at s_make, db "Ford",
    at s_model, db "Escape",
    at s_color, db "Blue",
    at s_trip_distances, dw 1, 2, 3, 4, 5
iend

section .text
main:
    mov rcx, qword 4
    mov r12, dword 0
    begin_loop0:
        push rcx
        mov rdi, format_specifier4
        mov rsi, [mycar + s_trip_distances + rcx*2]
        add r12, rsi
        xor rax, rax
        call printf
        pop rcx
        dec rcx
        cmp rcx, qword 0
    jge begin_loop0

    mov rdi, format_specifier4
    mov rsi, r12
    xor rax, rax
    call printf


    mov rdi, format_specifier3
    mov rsi, [mycar + s_vin]
    xor rax, rax
    call printf

    mov rdi, format_specifier
    mov rsi, mycar + s_make
    xor rax, rax
    call printf

    mov rdi, format_specifier
    mov rsi, mycar + s_model
    xor rax, rax
    call printf

    mov rdi, format_specifier
    mov rsi, mycar + s_color
    xor rax, rax
    call printf