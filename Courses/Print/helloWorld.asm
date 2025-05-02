; Create a program that prints "Hello, World!" on the DOSBox console.

org 100h

section .data
    string db "Hello, World!", 0 ; initialized the string, terminated by 0
    string_length db 13

section .text
    start:
        ; To print a string on the console, we actually can create 
        ; a loop to print each character. But here, we use `int 21h ah = 40h`
        ; to directly print an entire string.
        mov dx, string ; move the string address in dx
        mov cx, [string_length] ; move the number of bytes to print
        mov ah, 40h
        int 21h

    exit:
        mov ah, 4ch
        int 21h