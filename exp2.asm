.model small
.stack
.data
    M1 DB 10,13,"Addition is : $"
    M2 DB 10,13,"Subtraction is :$"
    NO1 DW 4536H
    NO2 DW 2312H
    RES DW ?
    
.code
    DISP MACRO XX
    MOV AH,09
    LEA DX,XX
    INT 21H
    ENDM

.startup
    DISP M1
    MOV AX,NO1
    ADD AX,NO2
    MOV RES,AX
    CALL DISP1

    DISP M2
    MOV AX,NO1
    SUB AX,NO2
    MOV RES,AX
    CALL DISP1

    JMP LAST

    DISP1 PROC
    MOV BX,RES
    AND BH,0F0H
    MOV CL,4
    SHR BH,CL
    ADD BH,30H
    MOV DL,BH
    MOV AH,02
    INT 21H         ;first digit display ends here
                
    MOV BX,RES
    AND BH,0FH
    ADD BH,30H
    MOV DL,BH
    MOV AH,02
    INT 21H         ;second digit display ends here
    
    MOV BX,RES
    AND BL,0F0H
    MOV CL,4
    SHR BL,CL
    ADD BL,30H
    MOV DL,BL
    MOV AH,02
    INT 21H         ;third digit display ends here
    
    MOV BX,RES
    AND BL,0FH
    ADD BL,30H
    MOV DL,BL
    MOV AH,02
    INT 21H         ;fourth digit display ends here
    
    RET
    DISP1 ENDP
    LAST:
.exit
end