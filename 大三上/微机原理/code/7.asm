;FILENAME:481.ASM
.586
DATA SEGMENT USE16
		MESG DB 'Please Enter ! ',0DH,0AH,'$'
DATA ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,DS:DATA
BEG:	MOV AX��DATA
		MOV DS��AX
		MOV AH��9
		;��ʾ������ʾ
		MOV DX��OFFSET MESG
		INT 21H
		MOV AH��1
		INT 21H
		CMP AL��3AH
		
		SUB AL��7H
NEXT1:	SUB AL��30H
		MOV BL��AL
		MOV AH��2
		;��ʾ������
		MOV DL��'='
		INT 21H
		CALL DISP
		;���ö�������ʾ����
		MOV AH��2
		;��ʾ��B��
		MOV DL��'B'
		INT 21H
EXIT: 	MOV AH��4CH
		INT 21H
;---------------------------------
DISP PROC ;��ʾBL�еĶ�������
		MOV CX,8
LAST:	MOV DL,'0'
		RCL BL,1
		JNC NEXT
		MOV DL,'1'
NEXT: 	MOV AH,2
		INT 21H
		LOOP LAST
		RET
DISP ENDP
CODE ENDS
END BEG


