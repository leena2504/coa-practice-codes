org 100h
    num1 dw 5743h  ; First 16-bit number
    num2 dw 1567h  ; Second 16-bit number

start:
    ; Load the lower bytes of num1 and num2
    mov ax, num1    ; Load num1 into AX (AX = 1234h)
    sub ax, num2     ; Add num2 to AX (AX = AX + num2)

    ; Store the result in BX for later use
    mov bx, ax         ; Copy AX to BX

    ; Convert upper byte (high 8 bits) to ASCII and display
    mov al, ah         ; Move the high byte of AX to AL
    and al, 0F0h       ; Mask the lower nibble
    shr al, 4          ; Shift right to get the upper nibble
    add al, 30h        ; Convert to ASCII digit
    cmp al, 39h        ; Compare with ASCII value of '9'
    jle print_first_digit
    add al, 7          ; Convert to ASCII letter if needed

print_first_digit:
    mov dl, al         ; Move AL to DL for printing
    mov ah, 02h        ; BIOS interrupt to display character
    int 21h

    ; Convert lower nibble of the high byte to ASCII and display
    mov al, bh        ; Move the high byte of BX to AL again
    and al, 0Fh        ; Mask the upper nibble
    add al, 30h        ; Convert to ASCII digit
    cmp al, 39h        ; Compare with ASCII value of '9'
    jle print_second_digit
    add al, 7          ; Convert to ASCII letter if needed

print_second_digit:
    mov dl, al         ; Move AL to DL for printing
    mov ah, 02h        ; BIOS interrupt to display character
    int 21h

    ; Convert upper nibble of the low byte to ASCII and display
    mov al, bl         ; Move the low byte of BX to AL
    and al, 0F0h       ; Mask the lower nibble
    shr al, 4          ; Shift right to get the upper nibble
    add al, 30h        ; Convert to ASCII digit
    cmp al, 39h        ; Compare with ASCII value of '9'
    jle print_third_digit
    add al, 7          ; Convert to ASCII letter if needed

print_third_digit:
    mov dl, al         ; Move AL to DL for printing
    mov ah, 02h        ; BIOS interrupt to display character
    int 21h

    ; Convert lower nibble of the low byte to ASCII and display
    mov al, bl         ; Move the low byte of BX to AL
    and al, 0Fh        ; Mask the upper nibble
    add al, 30h        ; Convert to ASCII digit
    cmp al, 39h        ; Compare with ASCII value of '9'
    jle print_fourth_digit
    add al, 7          ; Convert to ASCII letter if needed

print_fourth_digit:
    mov dl, al         ; Move AL to DL for printing
    mov ah, 02h        ; BIOS interrupt to display character
    int 21h

    ; Terminate the program
    mov ah, 4Ch
    int 21h