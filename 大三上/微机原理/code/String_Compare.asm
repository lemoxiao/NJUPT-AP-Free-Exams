.586
DATA SEGMENT USE16
		STR1 DB 30,?,30 DUP(?) ;�����ַ���������
		STR2 DB 'WELCOME'
		COUNT EQU $-STR2 ;ͳ�ƴ�����
		FLAG DB 'N' ;��űȽϽ������ʼΪ��N��
DATA ENDS
CODE SEGMENT USE16
ASSUME CS:CODE,DS:DATA,ES:DATA
BEG: 	MOV AX��DATA
		MOV DS��AX ;DS��ʼ��
		MOV ES��AX ;ES��ʼ��
		MOV CX��COUNT
		MOV AH��0AH ;�Ӽ��������ַ���STR2
		MOV DX��OFFSET STR1
		INT 21H
		MOV CL��STR1+1
		MOV CH��0 ;�����ַ������ȡ�CX
		CMP CX��COUNT ;�Ƚ�STR1��STR2�ĳ����Ƿ����
		JNZ EXIT ;�ַ����Ƚϲ���ȣ���ת
		MOV SI��OFFSET STR1+2 ;ԭ����ַ��SI
		MOV DI��OFFSET STR2 ;Ŀ������ַ��DI
		CLD ;D��־Ϊ0,��ַ��
LOAD:	REPE CMPSB ;���ַ����Ƚ�
		JNZ EXIT ; �ַ����Ƚϲ���ȣ���ת
		MOV FLAG��'Y' ;�ַ�����ȣ���FLAGΪ��Y��
EXIT: 	MOV AH��4CH
		INT 21H
CODE ENDS
END BEG
