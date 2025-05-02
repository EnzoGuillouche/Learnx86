; Create a program that prints a character on the DOSBox console.

org 100h

section .text
    start:
        mov al, '1' ; move to al what you want to print
        mov ah, 0eh
        int 10h

        mov al, 0
        add al, '0' ; is only necessary for numeric values
        mov ah, 0eh
        int 10h

        ; prints 10, with 1 as a character and 0 as a number

    exit:
        ; exit
        mov ah, 4ch
        int 21h