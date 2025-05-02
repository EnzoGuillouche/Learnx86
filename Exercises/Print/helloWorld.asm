; Create a program that prints "Hello, World!" on the DOSBox console.
; int 21h to print a string on the console
;   -> ah = 40h
;   -> bx = 1 as stdout
;   -> dx = string 
;   -> cx = string's number of bytes

org 100h

section .data
    string db "Hello, World!", 0
    string_length db 10

section .text
    start:
        mov dx, string
        mov cx, [string_length]
        mov bx, 1
        mov ah, 40h
        int 21h

    exit:
        mov ah, 4ch
        int 21h