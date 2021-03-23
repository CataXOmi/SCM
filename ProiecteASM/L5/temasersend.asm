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
main:	CALL setmsg
		CALL setser		
		MOV R0,#30h
		jmp loop
setmsg:	MOV 30h,#'H'
		MOV 31h,#'e'
		MOV 32h,#'l'
		MOV 33h,#'l'
		MOV 34h,#'o'
		MOV 35h,#' '
		MOV 36h,#'w'
		MOV 37h,#'o'
		MOV 38h,#'r'
		MOV 39h,#'l'
		MOV 3Ah,#'d'
		MOV 3Bh,#'!'
		MOV 3Ch,#0
		RET
setser:	CLR SM0
		SETB SM1
		MOV A, PCON
		SETB ACC.7
		MOV PCON, A
		MOV TMOD, #20h
		MOV TH1,#253
		MOV TL1,#253
		SETB TR1
		RET
loop:	MOV A,@R0
		JZ finish
		MOV C, P
		MOV ACC.7, C
		MOV SBUF, A
		JNB TI, $
		INC R0
		CLR TI
		jmp loop
finish:	jmp $
