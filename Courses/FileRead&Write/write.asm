; Create a program that writes content into a file.

org 100h

section .data
    buffer2 db "1234Hello", 0 ; buffer to write

section .text
    start:
        mov dx, filename
        call openFile
        call writeFile

        ; To read the just written content
        ; we need to move the file pointer to the beginning
        mov ax, 4200h
        xor cx, cx
        xor dx, dx ; Offset = 0
        int 21h
        jc error
        ; then we can read the file
        call readFile

        call print
        call closeFile
        jmp exit

    writeFile:
        ; writes in the file with the file handle in bx
        mov dx, buffer2 ; the buffer containing the content to write
        mov cx, 9 ; the number of bytes to write
        mov ah, 40h
        int 21h
        jc error ; error handling
        ret

%include "FileRead&Write/read.asm"