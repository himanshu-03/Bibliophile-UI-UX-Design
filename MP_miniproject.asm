.MODEL SMALL
.STACK 100H
.DATA
    MAIN_MENU DB, 0DH, 0AH, "Calculator", 0DH, 0AH
        DB "Press 'A' for Addition", 0DH, 0AH
        DB "Press 'S' for Subtraction", 0DH, 0AH
        DB "Press 'M' for Multiplication", 0DH, 0AH
        DB "Press 'D' for Divison", 0DH, 0AH
        DB "Press 'E' for Exit", 0DH, 0AH
        DB "Press 'R' for Return to Main Menu", 0DH, 0AH
        DB "------------------------------------", 0DH, 0AH
        DB "Enter your choice", 0DH, 0AH, '$'
        NUM1 DB "Enter First Number : ", 0DH, 0AH, '$'
        NUM2 DB, 0DH, 0AH, "Enter Second Number : ", 0DH, 0AH, '$'
        ADD1 DB, 0DH, 0AH, "For ADDITION", 0DH, 0AH, '$'
        SUB1 DB, 0DH, 0AH, "For SUBTRACTION", 0DH, 0AH, '$'
        MUL1 DB, 0DH, 0AH, "For MULTIPLICATION", 0DH, 0AH, '$'
        DIV1 DB, 0DH, 0AH, "For DIVISION", 0DH, 0AH, '$'
        EX DB, 0DH, 0AH, "GOOD BYE HAVE A NICE TIME..!!", 0DH, 0AH, '$'
        ANS DB, 0DH, 0AH, "ANSWER", 0DH, 0AH, '$'
        CONTINUE DB, 0DH, 0AH, "DO YOU WANT TO CONTINUE?", 0DH, 0AH, '$'
        OP1 DB ?
        OP2 DB ?
        Operand DB ?
        CON DB ?
.CODE
.STARTUP
    START:
        MOV AH, 09H
        MOV DX, OFFSET MAIN_MENU
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV Operand, AL
        MOV AL, Operand
        CMP AL, 'A'
        JE ADD2
        CMP AL, 'S'
        JE SUB2
        CMP AL,'M'
        JE MUL2
        CMP AL, 'D'
        JE DIV2
        CMP AL, 'R'
        JE START
        CMP AL, 'E'
        JE EXIT
        
    ADD2:                        ;Performing Addition
        MOV AH, 09H
        MOV DX, OFFSET ADD1
        INT 21H
        
        MOV AH, 09H             ;First Operand
        MOV DX, OFFSET NUM1
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV OP1, AL
        
        MOV AH, 09H             ;Second Operand
        MOV DX, OFFSET NUM2
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV OP2, AL
        
        MOV AH, 09H
        MOV DX, OFFSET ANS
        INT 21H
        MOV AL, OP1
        MOV BL, OP2
        ADD AL, BL
        AAS
        OR AX, 3030H
        
        MOV AH, 0EH             ;Print Result
        INT 10H
        
        MOV AH, 09H             ;For Continue
        MOV DX, OFFSET CONTINUE
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CON, AL
        MOV AL, CON
        CMP AL, 'Y'
        JE START
        CMP AL, 'N'
        JE EXIT
        
    SUB2:                        ;Performing Subtraction
        MOV AH,09H
        MOV DX, OFFSET SUB1
        INT 21H
        
        MOV AH, 09H             ;First Operand
        MOV DX, OFFSET NUM1
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV OP1, AL
        
        MOV AH, 09H             ;Second Operand
        MOV DX, OFFSET NUM2
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV OP2, AL
        
        MOV AH, 09H
        MOV DX, OFFSET ANS
        INT 21H
        MOV AL, OP1
        MOV BL, OP2
        SUB AL, BL
        AAS
        OR AX, 3030H
        
        MOV AH, 0EH             ;Print Result
        INT 10H
        
        MOV AH, 09H             ;For Continue
        MOV DX, OFFSET CONTINUE
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CON, AL
        MOV AL, CON
        CMP AL, 'Y'
        JE START
        CMP AL, 'N'
        JE EXIT
        
    MUL2:                        ;Performing Multiplication
        MOV AH,09H
        MOV DX, OFFSET MUL1
        INT 21H
        
        MOV AH, 09H             ;First Operand
        MOV DX, OFFSET NUM1
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV OP1, AL
        
        MOV AH, 09H             ;Second Operand
        MOV DX, OFFSET NUM2
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV OP2, AL
        
        MOV AH, 09H
        MOV DX, OFFSET ANS
        INT 21H
        MOV AL, OP1
        MOV BL, OP2
        MUL BL
        ADD AL, 30H
        
        MOV AH, 0EH             ;Print Result
        INT 10H
        
        MOV AH, 09H             ;For Continue
        MOV DX, OFFSET CONTINUE
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CON, AL
        MOV AL, CON
        CMP AL, 'Y'
        JE START
        CMP AL, 'N'
        JE EXIT
        
    DIV2:                        ;Performing Division
        MOV AH,09H
        MOV DX, OFFSET DIV1
        INT 21H
        
        MOV AH, 09H             ;First Operand
        MOV DX, OFFSET NUM1
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV OP1, AL
        
        MOV AH, 09H             ;Second Operand
        MOV DX, OFFSET NUM2
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 30H
        MOV OP2, AL
        
        MOV AH, 09H
        MOV DX, OFFSET ANS
        INT 21H
        mov ax, 0000H
        MOV AL, OP1
        MOV BL, OP2
        DIV BL
        ADD AL, 30H
        
        MOV AH, 0EH             ;Print Result
        INT 10H
        
        
        MOV AH, 09H             ;For Continue
        MOV DX, OFFSET CONTINUE
        INT 21H
        MOV AH, 01H
        INT 21H
        MOV CON, AL
        MOV AL, CON
        CMP AL, 'Y'
        JE START
        CMP AL, 'N'
        JE EXIT
        
    EXIT:                       ;Say Good Bye and the Exit
        MOV AH, 09H
        MOV DX, OFFSET EX
        INT 21H
.EXIT
END