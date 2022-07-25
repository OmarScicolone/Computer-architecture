	.data
	
i:		.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
 
w:		.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
b:		.double 171

y:		.space 8

val: 	.word 0x7ff0000000000000

	
	.text
main:
	
	daddi	R1, R0, 0 
	l.d		F6, b(R1)
	
	;sommatoria
	daddi	R2, R0, 30
	mtc1	R0, F4

init:
	l.d		F1, i(R1)
	l.d		F2, w(R1)
	mul.d	F3, F1, F2
	add.d	F4, F3, F4
	
	;aggiorna indirizzo
	daddi	R1, R1, 8
	
	;check ciclo
	daddi	R2, R2, -1
	bnez	R2, init
	
	;fine sommatoria
	add.d  F5, F4, F6     ;in f5 -> x
	
	;and val e F5
	ld		R3, val(R0)
	mfc1	R5, F5
	
	and		R4, R3, R5

	beq	R4, R3, updt 
	;stora in y x
	s.d F5, y(R0)
	j fine

updt:
	mtc1	R0, F5
	s.d F5, y(R0)

fine:
	halt