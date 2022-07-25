	.data
v1: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
v2: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	
v3: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

v4: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	

v5:	.space 320
v6:	.space 320
v7:	.space 320



	.text
main:	
	
	daddi R1, R0, 0 ;update indirizzo		
	daddi R2, R0, 0 ;per ciclo				 
	daddi R3, R0, 40						  
	
loop:
	l.d	F1, v1(R1)							   
	l.d F2, v2(R1)								
	l.d F3, v3(R1)								
	l.d F4, v4(R1)								

	mul.d F8, F2, F3							
	add.d  F5, F1, F8							
	mul.d F6, F5, F4							
	div.d F7, F6, F2							
	
	
	; store f5, f6, f7
	s.d F5, v5(R1)												 
	s.d F6, v6(R1)												 
	s.d F7, v7(R1)												 
																 
	;aggiornamento indirizzo                                     
	daddi R1, R1, 8                                              
																 
	;check ciclo
	daddi R2, R2, 1																	
	bne	R2, R3, loop
	nop
	
	
halt
	
	













































