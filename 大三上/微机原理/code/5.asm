;��λ��ʾ��ɫ�ַ���
;Ҫ������ʾ��Ϊ��ɫ�ı���ʽ�����ڣ�
;0��5����ʾ�ڵ���ɫHELLO
;12��36����ʾ�ڵ׺�ɫWELCOME��
;24��66����ʾ�ڵ׻�ɫBYE_BYE
.486
DISP MACRO Y, X, VAR, LENGTH, COLOR
		MOV AH,13H
		MOV AL,1
		MOV BH,0 ;ѡ��0ҳ��ʾ��
		MOV BL,COLOR ;������(��ɫֵ) ��BL
		MOV CX,LENGTH ;�����ȡ�CX
		MOV DH,Y ;�кš�DH
		MOV DL,X ;�кš�DL
		MOV BP,OFFSET VAR ;����Ч��ַ��BP
		INT 10H
ENDM

EDATA SEGMENT USE16
		SS1 DB 'HELLO'
		SS2 DB 'WELCOME!'
		SS3 DB 'BYE_BYE'
EDATA ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,ES:EDATA
BEG:	MOV AX,EDATA
		MOV ES,AX
		MOV AX,3
		INT 10H
		DISP 0, 5, SS1, 5,2
		;0��5����ʾ��ɫHELLO
		DISP 12, 36, SS2, 8, 4
		;12��36����ʾ��ɫWELCOME
		DISP 24, 66, SS3, 7, 0EH
		;24��66����ʾ��ɫBYE_BYE
		SCAN: MOV AH,1
		INT 16H
		JZ SCAN
		;�ȴ��û�����,�޼���ת
		MOV AX,2
		INT 10H
		;�ָ�80��25�ڰ��ı���ʽ
		MOV AH,4CH
		INT 21H
CODE ENDS
END BEG
