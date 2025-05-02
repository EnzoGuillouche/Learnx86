; Create a program that reads a file's content.

org 100h

section .data
    filename db "content.bin", 0
    errorMsg db "Error blud", 0

section .bss
    buffer resb 9 ; buffer to read with a size of 9 bytes

section .text
    mov dx, filename ; move the address of the filename
    ; To manipulate file content, we need to open the file
    ; and keep track of its file handle, needed to read, write and close
    ; We also need to close the file once we finished our manipulations
    call openFile
    call readFile
    call print
    call closeFile
    jmp exit
    
    openFile:
        mov ah, 3dh
        ; 0 = read, 1 = write, 2 = both
        ; here opens the file with read/write permissions:
        mov al, 2
        int 21h
        jc error ; error handling
        mov bx, ax ; ax contains the file handle, moved it to bx
        ret

    readFile:
        ; reads the file with the file handle in bx
        mov dx, buffer ; buffer to contain read content
        mov cx, 9 ; number of bytes to read
        mov ah, 3fh
        int 21h
        jc error ; error handling
        ret

    closeFile:
        ; closes the file with the file handle in bx
        mov ah, 3eh
        int 21h
        jc error ; error handling
        ret

    print:
        push bx ; we save the file handle onto stack
        mov dx, buffer ; the address of buffer
        mov cx, 9 ; the number of bytes to print
        mov bx, 1
        mov ah, 40h
        int 21h
        pop bx ; we get back the file handle in bx
        ret

    exit:
        mov ah, 4ch
        int 21h
            
    error:
        mov dx, errorMsg
        mov cx, 10
        mov bx, 1
        mov ah, 40h
        int 21h
        jmp exit
