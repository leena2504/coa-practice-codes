org 100h

; Initialize values
mov al,96h        ; Move 89h (137 in decimal) into AL
mov bl,10h        ; Move 10h (16 in decimal) into BL

; Perform division (AL / BL)
idiv bl           ; AL = quotient, AH = remainder
mov bl,al         ; Store quotient in BL
mov bh,ah         ; Store remainder in BH

; Convert first digit (quotient) to ASCII
and al,0f0h       ; Mask higher nibble of AL
shr al,4          ; Shift right 4 bits to get the first hex digit
add al,30h        ; Convert to ASCII (0-9)
cmp al,39h        ; Check if it's a number or letter (0-9)
jle print_first_digit1
add al,7          ; Convert to ASCII (A-F)

print_first_digit1:
    mov dl,al     ; Move the result to DL (for printing)
    mov ah,02h    ; Print function
    int 21h       ; Interrupt to print the character

; Convert second digit (quotient) to ASCII
mov al,bl         ; Move the quotient back into AL
and al,0fh        ; Mask the lower nibble of AL
add al,30h        ; Convert to ASCII (0-9)
cmp al,39h        ; Check if it's a number or letter (0-9)
jle print_second_digit1
add al,7          ; Convert to ASCII (A-F)

print_second_digit1:
    mov dl,al     ; Move the result to DL (for printing)
    mov ah,02h    ; Print function
    int 21h       ; Interrupt to print the character

; Print remainder (remainder is in BH)

; Convert first digit (upper nibble of remainder) to ASCII
mov al,bh         ; Move remainder into AL
and al,0f0h       ; Mask the higher nibble
shr al,4          ; Shift right 4 bits to get the first hex digit
add al,30h        ; Convert to ASCII (0-9)
cmp al,39h        ; Check if it's a number or letter (0-9)
jle print_first_rem_digit
add al,7          ; Convert to ASCII (A-F)

print_first_rem_digit:
    mov dl,al     ; Move the result to DL (for printing)
    mov ah,02h    ; Print function
    int 21h       ; Interrupt to print the character

; Convert second digit (lower nibble of remainder) to ASCII
mov al,bh         ; Move remainder back into AL
and al,0fh        ; Mask the lower nibble
add al,30h        ; Convert to ASCII (0-9)
cmp al,39h        ; Check if it's a number or letter (0-9)
jle print_second_rem_digit
add al,7          ; Convert to ASCII (A-F)

print_second_rem_digit:
    mov dl,al     ; Move the result to DL (for printing)
    mov ah,02h    ; Print function
    int 21h       ; Interrupt to print the character