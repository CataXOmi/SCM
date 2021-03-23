      	org 0h
		jmp main
      	org 4Ah ; 0Fh
main:	add a, #2 ;P2
 		MOV P1, A
 		jmp main 
