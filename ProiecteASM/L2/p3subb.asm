      	org 0h
		jmp main
      	org 4Ah ; 0Fh
main:	subb a, #2 ;cu # e adresare imediata
					;P2 e adresare facuta din sirul de la 7 la 0 din stanga
 		MOV P1, A
 		jmp main 
