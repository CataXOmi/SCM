;calcul
;PCON.7=0
;TH1 = 256 - ((Crystal/384)/Baud)
;TH1 = 256 - ((11059000/384)19200)
;TH1 = 256 - 1.5 = 254.5-> CAZ IMPOSIBIL
;PCON.7=1
;TH1 = 256 - ((Crystal/192)/Baud)
;TH1 = 256 - ((11059000/192)19200)
;TH1 = 256 - 3 = 253
;system clock-ul trebuie setat la 11.059MHz deoarece da o valoare apropiata de 19200 la rata de Baud 
		org 0h
		jmp main
		org 0F5h
main:	call setser
		MOV	R0, #30h

loop:	JNB	RI, $
		MOV	A, SBUF
		CLR	RI
		CJNE A, #0Dh, skip
		jmp finish

skip:	MOV	@R0, A
		INC	R0
		JMP	loop

finish:	JMP	$

setser:	CLR	SM0
		SETB SM1
		SETB REN
		MOV A, PCON
		SETB ACC.7
		MOV	PCON, A
		MOV	TMOD, #20h
		MOV TH1, #253
		MOV	TL1, #253
		SETB TR1
		RET	
