.MODEL SMALL
.STACK
.DATA
  L1 DB ?
  L2 DB ?
  
  M1 DB 10,13,"Enter String 1: $"
  M2 DB 10,13,"Enter Lenght of String 1: $"
  M3 DB 10,13,"Display String 1: $"
  M4 DB 10,13,"Enter String 2: $"
  M5 DB 10,13,"Enter Length of String 2: $"
  M6 DB 10,13,"Display String 2: $"
  M7 DB 10,13,"Comparing Two Strings: $"
  M8 DB 10,13,"Checking if Strings are Equal: $"
  M9 DB 10,13,"Checking if Strings are Not Equal: $"
  M10 DB 10,13,"Concactenation of Two Strings: $"
  
  Str1 DB 80,?,80 Dup(0)
  Str2 DB 80,?,80 Dup(0)
 
.CODE

  DISP1 MACRO XX
   MOV AH,09
   LEA DX,XX
   INT 21H
  ENDM
  
.STARTUP
  
  DISP1 M1
  MOV AH, 0AH ;Enter String from user
  LEA DX, Str1
  INT 21H
  
  DISP1 M2
  LEA SI,Str1+1
  MOV CL,[SI]
  MOV L1,CL
  ADD CL,30H
  MOV DL,CL
  MOV AH,02
  INT 21H
  
  DISP1 M3 
  MOV CL,L1
  LEA SI,Str1+2
  BACK:
  MOV DL,[SI]
  MOV AH,02
  INT 21H
  INC SI
  DEC CL
  JNZ BACK
  
  DISP1 M4
  MOV AH, 0AH ;Enter String from user
  LEA DX, Str2
  INT 21H
  
  DISP1 M5
  LEA SI,Str2+1
  MOV CL,[SI]
  MOV L2,CL
  ADD CL,30H
  MOV DL,CL
  MOV AH,02
  INT 21H
  
  DISP1 M6 
  MOV CL,L2
  LEA SI,Str2+2
  BACK1:
  MOV DL,[SI]
  MOV AH,02
  INT 21H
  INC SI
  DEC CL
  JNZ BACK1
  
  .EXIT
END
 
  
  
  