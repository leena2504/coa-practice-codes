org 100h      
; define the two 8-bit number to add
num1 db 25h         ;first number
num2 db 30h         ;second number
start:
      mov al,num1   ;moving num1 to al register
      add al,num2   ;adding num2 to al register(i.e, num1 and num2 are in al) 
      
      mov bl,al     ;coping al value to bl,storing for the result dispaly
      mov ah,al     ;coping al values to ah,(converting upper nibble 4bit to get character)
      and ah,0F0h   ;mask the lower nibble(i.e,converting lower nibble to 0)
      shr ah,4      ;shifting right by 4 to get upper nibble
      add ah,30h    ;(converting to ascii digit)
      cmp ah,39h    ;compare ah value,if it is less than 39h 
      jle print_first_digit                              
      add ah,7      ;convert to ascii    
      
print_first_digit:
      mov dl,ah     ;coping ah value to dl for printing first digit
      mov ah,02h    ;BIOS interrupt to display character
      int 21h       
      ;converting lowwer nibble 4bit to character 
      mov ah,bl     ;coping bl values to ah
      and ah,0Fh    ;mask the upper nibble(i.e,converting upper nibble to 0)
      add ah,30h    ;(converting to ascii digit)
      cmp ah,39h    ;compare ah value,if it is less than 39h 
      
      jle print_second_digit
      add ah,7      ;convert to ascii   
      
print_second_digit:
      mov dl,ah     ;coping ah value to dl for printing first digit
      mov ah,02h    ;BIOS interrupt to display character
      int 21h   
      mov ah,4Ch
      int 21h
