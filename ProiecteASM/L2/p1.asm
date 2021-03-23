      	org 0h
		jmp main
      	org 0Ah ; 4Ah
main:	INC A
 		MOV P1, A
 		jmp main 
