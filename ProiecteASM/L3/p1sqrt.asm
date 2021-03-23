		org 0h
		jmp main
		org 1Fh
main:	MOV A, P2
		ANL A, #0Fh
		call sqrt
		MOV P1, A
		jmp main
sqrt:	INC A
		MOVC A, @A+PC
		RET
db 0,1,1,1,2,2,2,2,2,3,3,3,3,3,3,3
