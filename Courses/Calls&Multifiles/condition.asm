; Create a program that jumps to a function 
;       if the value in ax is higher than the one in bx.

org 100h

section .data
    var1 db 4ch

section .text
    mov ax, 1
    mov bx, 2
    ; we compare ax and bx...
    cmp ax, bx
    ; ...and we Jump if they're Not Equal (jne)...
    jne exit ; ...to exit

    ; if it did not jump, we change the value here
    ; to verify that our condition is true/false
    mov byte [var1], 1

    exit:
        mov ah, [var1]
        int 21h
