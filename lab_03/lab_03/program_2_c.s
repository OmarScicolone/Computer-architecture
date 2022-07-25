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
	
	daddi	R1, R0, 0		; FDEMW
	daddi	R2, R0, 0 	    ;  FDEMW
	daddi	R3, R0, 10	    ;   FDEMW  +8
							;
loop:                       ;
	daddi	R4, R1, 8		;    FDEMW
	daddi	R5, R1, 16		;     FDEMW
	daddi	R6, R1, 24      ;      FDEMW
							;
	l.d		F2, v2(R1)	 	;       FDEMW
	l.d 	F3, v3(R1)	    ;	     FDEMW		
	l.d		F1, v1(R1)	    ;         FDEMW
	mul.d 	F8, F2, F3      ;          FDmmmmmmmmMW
	l.d 	F4, v4(R1) 	    ;           FDEMW
	l.d 	F31, v2(R4)	    ;            FDEMW
	l.d 	F9, v3(R4)	    ;             FDEMW
	l.d		F10, v1(R4)	    ;              FDEMW
	mul.d 	F30, F31, F9    ;               FDmmmmmmmmMW
	l.d 	F11, v4(R4)     ;                FDEMW
	l.d 	F15, v2(R5)	    ;                 FDESMW
	l.d 	F16, v3(R5)	    ;                  FDsEMW
	l.d		F18, v1(R5)	    ;                   FsDEMW
	mul.d 	F17, F15, F16   ;                     FDmmmmmmmmMW
	l.d 	F23, v2(R6)	 	;                      FDESMW
	l.d 	F24, v3(R6)	    ;                       FDsEMW
	l.d		F26, v1(R6)	    ;                        FsDEMW
	mul.d 	F25, F23, F24   ;                          FDmmmmmmmmMW
	add.d 	F5, F1, F8      ;                           FDaaaaMW 
	daddi	R2, R2, 1		;                            FDESMW
	add.d 	F12, F10, F30   ;                             FDsaaaaSMW
	add.d 	F20, F18, F17   ;                              FsDaaasaMW
	;daddi	R5, R0, 1
	add.d 	F28, F26, F25   ;                                FDaasaaMW
	mul.d 	F6, F5, F4      ;                                 FDmsmmmmmmmMW
	l.d 	F19, v4(R5)     ;                                  FDsEMW 
	l.d 	F27, v4(R6)     ;                                   FsDEMW
	mul.d 	F13, F12, F11   ;                                     FDmmmmmmmmMW
	mul.d 	F21, F20, F19   ;                                      FDmmmmmmmmMW
	mul.d 	F29, F28, F27   ;                                       FDmmmmmmmmMW
	s.d 	F5, v5(R1)		;                                        FDEMW
	div.d 	F7, F6, F2      ;                                         FDssddddddddddddMW
	div.d	F14, F13, F31   ;      	                                   FssDsssssssssssddddddddddddMW
	div.d 	F22, F21, F15	;                                             FsssssssssssDsssssssssssddddddddddddMW
	div.d 	F30, F29, F23   ;						 	 	 			              FsssssssssssDsssssssssssddddddddddddMW
	s.d 	F6, v6(R1)	    ;                                                                     FsssssssssssDEMW
	s.d 	F7, v7(R1)      ;                                                                                 FDEMW
	s.d		F12, v5(R4)	    ;                                                                                  FDEMW
	s.d		F13, v6(R4)	    ;                                                                                   FDEMW
	s.d 	F14, v7(R4)     ;                                                                                    FDEMW
	s.d 	F20, v5(R5)	    ;                                                                                     FDEMW
	s.d 	F21, v6(R5)	    ;                                                                                      FDEMW
	s.d 	F22, v7(R5)     ;                                                                                       FDEMW
	s.d 	F28, v5(R6)	    ;                                                                                        FDEMW
	s.d 	F29, v6(R6)	    ;                                                                                         FDEMW
	s.d 	F30, v7(R6)     ;                                                                                          FDESMW88
													 	 	 							    
	bne		R2, R3, loop    ;                                                                                           FDsEMW   
	daddi 	R1, R1, 32      ;                                                                                            FsDEMW  89  
		            
	halt				