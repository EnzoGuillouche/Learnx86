; Create a program that uses variables' addresses to manipulate data.
; Use the section .bss to declare variables.

section .bss
    var resb 1 ; reserves 1 byte for variable var, no assigning

section .text
    mov byte [var], 8 ; assign the value 8
    start:
        mov al, [var] ; mov the value to al to print it
        add al, '0' ; it is a numeric value, so we must add '0'
        mov ah, 0eh
        int 10h

        ; exit
        mov ah, 4ch
        int 21h