; Create a program that uses the stack to store and retreive data.
; Use the section .bss to declare variables.
; Careful: the stack functions as Last In, First Out

org 100h

section .bss
    var resb 1

section .text
    mov byte [var], 9 ; assign the value 9
    start:
        mov ax, [var]
        push ax ; 8 is pushed onto the stack

        mov byte [var], 6 ; assign now the value 6
        call printChar ; print it: 6

        pop ax ; return 8 from the stack
        mov byte [var], al ; assign the value returned from the stack
        call printChar ; print it: 9
            
        jmp exit

    printChar:
        ; print the value of var as a character
        mov al, [var]
        add al, '0'
        mov ah, 0eh
        int 10h
        ret

    exit: 
        mov ah, 4ch
        int 21h