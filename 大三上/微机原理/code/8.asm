DATA SEGMENT USE16
		BUF DB '3','4','8','9'
		COUNT EQU $-BUF
DATA ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,DS:DATA
BEG: 	MOV AX,DATA
		MOV DS,AX
		MOV CX,COUNT
		MOV SI,OFFSET BUF
		MOV AX,0
		;AX���ڴ���ۼӺͣ���0
		MOV DH,0
		;DH��0
		MOV BX,10
		;Ȩ10��BX
AGA: 	MUL BX
		; AXx10��AX
		MOV DL,[SI]
		;ȡ��ASCII���ַ�
		SUB DL,30H
		;��ȥ30H
		ADD AX,DX
		;�ۼ�
		INC SI
		LOOP AGA
		MOV BX,AX
		CALL DISP
		;���ö�������ʾ����
		MOV AH,2
		MOV DL,'B'
		INT 21H
EXIT: 	MOV AH,4CH
		INT 21H
;---------------------------------
DISP PROC ;��ʾBX�еĶ�������
		MOV CX,16
LAST: 	MOV DL,'0'
		RCL BX,1
		JNC NEXT
		MOV DX,'1'
NEXT: 	MOV AH,2
		INT 21H
		LOOP LAST
		RET
DISP ENDP
CODE ENDS
END BEG
