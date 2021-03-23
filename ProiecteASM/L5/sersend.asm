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
		MOV TH1,#243
		MOV TL1,#243
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