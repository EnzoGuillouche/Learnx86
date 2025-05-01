; Create a program that has defined variables 
;       and can use them to perform actions.

org 100h

; This is where we initialize variables in different ways
section .data
    ; var1 is an array
    ; declared as pointing to 1 and 4ch
    var1 db 1
         db 4ch

    ; var1 is a simple variable
    var2 db 3

section .text
    start:
        ; we here use [] to get the value pointed by the variable
        mov ax, [var1] ; ax now contains 1, from the variable
        mov bx, [var2] ; bx now contains 3, from the variable
        add ax, bx
        ; ax = 1 + 3 = 4
        
        ; we can reassign var2 that way:
        mov byte [var2], 5

        mov bx, [var2]
        sub ax, bx
        ; ax = 5 - 4 = 1

        ; we get the 2nd value declared in var1
        mov ah, [var1+1]
        int 21h
