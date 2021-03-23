		org 0h
		jmp main
		org 0Fh
main:	SETB P2.7
		MOV A,#2
		MOV R1, A
loop:	MOV P1,A
		JNZ zero
		MOV A, R1
zero:   MOV B,P2
		anl B,#0Fh
		JB P2.7, up
		MOV R0, A
		MOV A, B
		JNZ imp
		jmp loop
imp:	MOV A, R0
		DIV AB
		jmp loop
up:		MUL AB
		MOV A, B
		jmp loop
