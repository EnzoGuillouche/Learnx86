; Create a program that allocates and deallocates a block of RAM, 
;       as well as writes and reads data onto the allocated RAM block.

org 100h

; macro to allocate memory based on the parameter
%macro allocation 1
    mov bx, %1 ; allocates 16bits x given param
    mov ah, 48h
    int 21h
    jc error ; error if failed
%endmacro

; macro to deallocate memory
%macro deallocation 1
    mov es, %1 ; deallocates all the allocated memory at this address
    mov ah, 49h
    int 21h
    jc error ; error if failed
%endmacro

%macro writeMemory 2
    pop es ; get back the memory address
    mov di, %1 ; precise the position in the allocated memory
    mov al, %2
    mov byte [es:di], al ; writes data
    push es ; push back the memory address
%endmacro

%macro readMemory 2
    pop es ; get back the memory address
    mov di, %1 ; precise the position in the allocated memory
    mov ax, [es:di] ; reads data
    mov byte %2, al ; replace data
    push es ; push back the memory address
%endmacro

%macro printNum 1
    mov al, [%1]
    add al, '0'
    mov ah, 0eh
    int 10h
    jc error
%endmacro

section .data
    var1 db 6
    errorMsg db "Error blud", 0 ; error message

section .bss
    var2 resb 1

section .text
    start:
        ; allouer de la memoire
        allocation 1 ; allocation of 1x16bits of memory
        push ax ; push memory address on stack 
        
        ; mettre la valeur de var1 dans la memoire
        writeMemory 8, [var1]

        ; lire cette valeur et l'assigner a var2
        readMemory 8, [var2]

        pop ax ; get back memory address from stack
        deallocation ax

        ; prints both values
        ; should be the same as we placed var1's value in memory
        ; then we retrieved that value to assign it to var2
        printNum var1
        printNum var2
        jmp exit

    error:
        mov dx, errorMsg
        mov cx, 10
        mov ah, 40h
        int 21h
    exit:
        mov ah, 4ch
        int 21h