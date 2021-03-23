		org 0h
		jmp main
		org 0Fh
main:	SETB P2.7
		MOV A,#0
loop:	MOV P1,A
		MOV B,P2
		anl B,#0Fh
		JB P2.7, up
		SUBB A, B
		jmp loop
up:		ADD A, B
		jmp loop
