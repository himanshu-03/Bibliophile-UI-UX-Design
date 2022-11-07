.model small
.stack
.data
M1 DB 10, 13, "Enter 8 bit number : $"
M2 DB 10, 13, "Display 8 bit number : $"
num DB ?
.code
.startup
    MOV AH, 09      ;Display Message on Screen
    LEA DX, M1
    INT 21H
    
    MOV AH, 01      ;Enter Single Character
    INT 21H
    SUB AL, 30H
    MOV CL, 4       ;Move the character shift 4 bits left
    SHL AL, CL
    MOV BH, AL      ;Move to Memory Location
    
    MOV AH, 01      ;Enter Single Character
    INT 21H
    SUB AL, 30H
    ADD BH, AL      ;Add both the characters
    
    MOV num, BH      
    MOV AH, 09      ;Display Message on screen
    LEA DX, M2
    INT 21H
    
    MOV BH, num
    AND BH, 0F0H    ;Performing AND operation to seperate the character
    MOV CL, 4
    SHR BH, CL      ;Shift Right the character 4 bits
    ADD BH, 30H     
    MOV DL, BH      ;Display Single Character on screen
    MOV AH, 02
    INT 21H
    

    MOV BH, num
    AND BH, 0FH     ;Performing AND operation to seperate the character
    ADD BH, 30H
    MOV DL, BH      ;Display Single character on screen
    MOV AH, 02
    INT 21H
.exit
end
