; Create a program that returns to DOS (finishes properly) 
;       with an exit code of 0 (no errors).

org 100h

start:
    ; we precise that we want to exit with 4ch in ah
    mov ah, 4ch
    ; interrupt the CPU
    int 21h
