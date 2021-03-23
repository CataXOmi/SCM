		org 0h
		jmp main
		org 0Fh
main:	SETB P2.7
		MOV A,#0
loop:	MOV P1,A
		JB P2.7, up
		DEC A
		jmp loop
up:		INC A
		jmp loop