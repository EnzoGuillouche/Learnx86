; Create a program that performs separated actions 
;       defined in functions. All those must be executed.

section .data
    var1 db 1
    var2 db 3

section .text
    exit:
        mov ah, [var1]
        int 21h
        
    start:
        ; we make calculations here...
        mov ax, [var1]
        mov bx, [var2]
        add ax, bx
        
        mov bx, 2
        sub ax, bx

        ; reassign var1 with 4ch to exit properly
        mov byte [var1], 4ch

        ; then we go to the exit funtion 
        ; and execute its instructions
        jmp exit
