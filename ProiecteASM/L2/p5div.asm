      	org 0h
		jmp main
      	org 4Ah ; exista mai multe valori pentru aceasta adresa(0Fh,4Fh etc.)
main:	MOV R0, #100; sau putem folosi un registru P2 pentru adresare directa, modificand valoarea acestuia prin modificarea statusului valorilor 7-0 din stanga jos
loop:  	MOV A, R0
		MOV B, #2
		DIV AB
		MOV R0, A
		MOV P1, A
 		jmp loop 
