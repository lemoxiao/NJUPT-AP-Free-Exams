.586
DATA SEGMENT USE16
		NUM DB '5678'
		COT EQU $-NUM
DATA ENDS

STACK SEGMENT USE16
		DB 16 DUP(?)
STACK ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,DS:DATA
BEG:	MOV AX,DATA
		MOV DS,AX
		MOV CX,COT
		MOV BX,OFFSET NUM
LAST:	MOV DL,[BX]
		PUSH CX
		CALL DISP
TIME:	POP CX
		INC BX
		LOOP LAST
		JMP EXIT


EXIT:	MOV AH,4CH
		INT 21H
		
DISP PROC
		MOV CX,8
LAST1:	MOV AL,'0'
		ROL DL,1
		JC	NEXT
		MOV AL,'1'
NEXT:	MOV AH,0EH
		INT 10H
		LOOP LAST1
		RET
DISP ENDP

CODE ENDS
END BEG
		

