; Create a program that prints a character on the DOSBox console.

org 100h

section .text
    start:
        mov al, '1'
        ; add al, '0' ; only for numbers
        mov ah, 0eh
        int 10h

    exit:
        ; exit
        mov ah, 4ch
        int 21h