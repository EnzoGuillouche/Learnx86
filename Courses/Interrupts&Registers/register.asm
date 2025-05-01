; Create a program that transfers data with registers.
; It must perform assigning, adding and substracting instructions.

org 100h

start:
    mov ax, 1 ; ax now contains 1
    mov bx, 3 ; bx now contains 3
    add ax, bx ; add both values, and store the result in ax
    ; ax now contains 4

    mov bx, 2
    sub ax, bx ; sub both values, and store the result in ax
    ; ax now contains 2

    ; exit
    mov ah, 4ch
    int 21h
