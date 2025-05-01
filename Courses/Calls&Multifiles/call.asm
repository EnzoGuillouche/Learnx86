; Create a program that calls a function, executes its instructions 
;       and returns to where it was called.

org 100h

start:
    ; we prepare registers here
    mov ax, [var1]
    mov bx, 2
    ; we now go to the called function
    call addition
    ; ...and we continue here after the return.
    
    ; here even if the 'exit' function is't called
    ; as it is right after, it will be executed
    
exit:
    mov ah, 4ch
    int 21h

addition:
    add ax, bx
    ; we return from the function call
    ret

section .data:
    var1 db 1