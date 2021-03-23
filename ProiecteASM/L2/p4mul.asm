      	org 0h
		jmp main
      	org 4Ah ; 0Fh
main:	MOV R0, #1
loop:  	MOV A, R0
		MOV B, #2
		MUL AB
		MOV R0, A
		MOV P1, A
 		jmp loop 
