; Create a program that includes another .asm file 
;       and can use its content freely.

org 100h

section .text
    mov ax, 1
    mov bx, 2
    cmp ax, bx
    jne exit ; we jump if ax and bx are not equal

    mov byte [var1], 1

; we include other .asm/.inc files  
; though as we include instructions (in section .text)...
; we need to include at the bottom of the file
%include "Calls&Multifiles/condition.asm"