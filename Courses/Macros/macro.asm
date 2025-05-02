; Create a program that uses macros with 2 or more parameters.

org 100h

; A macro is basically a function with parameters
; In a macro, if it contains sub-functions and 
; you're using this macro multiple times, you need 
; to name sub-functions differently with a parameter.
; You can also create a global function named with a parameter
; in your macro, so the sub-functions will be in a specific scope.
%macro printChar 3 
    ; defined 3 different params:
        ; %1: the character to print
        ; %2: boolean value to know if its a numeric value 
        ; %3: the sub-function name
    mov al, %1
    mov bx, 1
    cmp bx, %2
    jne .%3
    ; if numeric value, then add '0' to print properly
    add al, '0' 
    .%3:
        mov ah, 0eh
        int 10h
%endmacro

section .data
    var1 db 6
    var2 db 'a'
    var3 db 9

section .text
    start:
        ; call the macro twice to print both values
        printChar [var1], 1, print1
        printChar [var2], 0, print2
        printChar [var3], 1, print3

        jmp exit

    exit:
        mov ah, 4ch
        int 21h