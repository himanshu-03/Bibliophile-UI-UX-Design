    .MODEL SMALL
    .STACK
    .DATA
        M1 DB 10, 13, "HEX TP BCD IS : $"
        NO DW 0F0F0H
        
    .CODE
        DISP MACRO XX
        MOV AH, 09
        LEA DX, XX
        INT 21H
        ENDM
        
    .STARTUP
        DISP M1
        MOV AX, NO
        MOV DH, 0
        MOV BX, 0AH
        MOV CL, 0
        
        BACK:
        
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CL
        CMP AX, 0
        
        JNZ BACK

        BACK1:
        POP DX
        ADD DL, 30H
        MOV AH, 02
        INT 21H
        DEC CL
        
        JNZ BACK1
        .EXIT
    END 
