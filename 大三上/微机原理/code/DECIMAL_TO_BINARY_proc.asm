;键盘输入一位16进制ASCII码，二进制显示
DATA SEGMENT USE16
	DIS1 DB 'Please',00H,'Enter',0DH,0AH,'$'
	DIS2 DB '=','$'
DATA ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,DS:DATA
BEG:	MOV AX,DATA
		MOV DS,AX
		MOV AH,09H
		MOV DX,OFFSET DIS1
		INT 21H
		MOV AH,01H
		INT 21H
		MOV AH,09H
		MOV DX,OFFSET DIS2
		INT 21H
		CALL DISP
		MOV AH,4CH
		INT 21H
DISP PROC
		MOV DL,AL
		SUB DL,30H
		MOV CX,8
LAST:	MOV AL,'0'
		ROL DL,1
		JNC	NEXT
		MOV AL,'1'
NEXT:	MOV AH,0EH
		INT 10H
		LOOP LAST
		RET
DISP ENDP

CODE ENDS
END BEG







