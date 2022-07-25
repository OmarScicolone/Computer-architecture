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
	
	daddi R1, R0, 0 ;	
	daddi R2, R0, 0 ;	
	daddi R3, R0, 40;	+8
					;
loop:               ;
					;
	l.d F2, v2(R1)	;        FDEMW	
	l.d F3, v3(R1)	;         FDEMW
	mul.d F8, F2, F3;	       FDmmmmmmmmMW
	l.d	F1, v1(R1)	;			FDEMW
	l.d F4, v4(R1)	;			 FDEMW
	daddi R2, R2, 1	;	          FDEMW
	add.d F5, F1, F8;			   FDssssaaaaMW
	mul.d F6, F5, F4;	            FssssDsssmmmmmmmmMW
	div.d F7, F6, F2;	                 FsssDsssssssddddddddddddMW
	s.d F5, v5(R1)	;	                     FsssssssDEMW
	s.d F6, v6(R1)	;	                             FDEMW
	s.d F7, v7(R1)	;	                              FDEssssssssSMW                                  
	bne	R2, R3, loop;								   FDsssssssssEMW
	daddi R1, R1, 8 ;									FsssssssssDEMW +36
	
	nop	            ;
	halt			;	
										