; Create a program that prints "Hello, World!" on the DOSBox console.
; int 21h to print a string on the console
;   -> ah = 40h
;   -> bx = 1 as stdout
;   -> dx = string 
;   -> cx = string's number of bytes
