org 100h 

num1 db 39h
num2 db 18h  

start:
    mov al,num1 ;move num1 to the AL register
    sub al,num2 ;substrat the second number with AL

    mov bl,al 

;convert the upper nibble(4 bits ) of AL to characters
    mov ah,al
    and ah,0F0h ;mask the lower nibble
    shr ah,4

    add ah,30h ;convert the ASCHII digit(0-9)
    cmp ah,39h
    jle print_first_digit
    add ah,7   ;convert to ASCHII letter(A-F) if necessary 

print_first_digit:
    mov dl,ah ;move the first digit to DL for printing
    mov ah,02h  ;BIOS interrupt to display charater
    int 21h
    
;convert the lower nibble(4 bits) of AL to characters
    mov ah,bl
    and ah,0Fh  ;mask the upper nibble
    
    add ah,30h
    cmp ah,39h
    jle print_second_digit
    add ah,7
    
print_second_digit:
    mov dl,ah
    mov ah,02h
    int 21h
    
    ;End the program
    mov ah,4Ch
    int 21h
    ret