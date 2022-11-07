.MODEL SMALL
.STACK
.DATA
    MSG1 DB 10,13,"NEGATIVE NUMBERS: $"
    SPACE DB " $"
    ARRAY DB 37H,15H,0AAH,058H,084H                         ;initialized array
    N_ARRAY DB 5 DUP(0)                                     ;Uninitialized array

.CODE
    DISP MACRO XX
    MOV AH,09
    LEA DX,XX
    INT 21H
    ENDM

.STARTUP
    LEA SI,ARRAY                                            ;Source Array (+ve Array)
    LEA DI,N_ARRAY                                          ;Destination Array (-ve Array)

    MOV CL,5                                                ;+ve Array Length
    MOV BL,0                                                ;-ve Array Length

    BACK:
        MOV AL,[SI]
        AND AL,80H                            ;To check Positive or negative; 80 -> 1000 0000; Checking First Bit
        JZ POSITIVE                           ;Jump if Number is Positive
        MOV AL,[SI]
        MOV [DI],AL
        INC DI
        INC BL

    POSITIVE:
        INC SI
        DEC CL
        JNZ BACK

    DISP MSG1

        LEA DI,N_ARRAY

    BACK1:
        MOV BH,[DI]
        AND BH,0F0H
        MOV CL,4
        SHR BH,CL
        CMP BH,9
        JG AA
        ADD BH,30H
        JMP AA1

    AA:
        ADD BH,37H
        
    AA1:
        MOV DL,BH
        MOV AH,02
        INT 21H

        MOV BH,[DI]
        AND BH,0FH 
        CMP BH,09 
        JG AA2
        ADD BH,30H
        JMP AA3

    AA2:
        ADD BH,37H
    AA3:
        MOV DL,BH 
        MOV AH,02
        INT 21H
                            ;MOV AH,13
                            ;INT 21H
    INC DI
    DEC BL

    DISP SPACE 

    JNZ BACK1
.EXIT
END




