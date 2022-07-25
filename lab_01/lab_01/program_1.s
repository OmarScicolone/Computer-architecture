	.data
a: .byte -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
b: .byte -14, -13, -12, -11, -10, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
c: .space 30
threshold: .byte 0x0
thresholdHigh: .space 1
thresholdLow: .space 1
max: .space 1
min: .space 1

	.text
main:
	dadd R1, R0, R0 
	
	;PRIMO PUNTO
	daddi R5, R0, 30
loop1:
	lb R2, a(R1)	
	lb R3, b(R1)
	
	dadd R4, R2, R3
	sb R4, c(R1)
	daddi R1, R1, 1
	daddi R5, R5, -1
	bnez R5, loop1
	
	;SECONDO PUNTO
	daddi R1, R0, 0 
	daddi R2, R0, 0 
	daddi R3, R0, 0 
	daddi R7, R0, 1 
	daddi R8, R0, 30
	lb R4, threshold(R0)
	
loop2:
	lb R5, c(R1)
	slt R6, R5, R4 
	beq R6, R7, altr
	daddi R2, R2, 1
	j agg
altr:
	daddi R3, R3, 1
	
agg:	
	daddi R1, R1, 1
	daddi R8, R8, -1
	bnez R8, loop2
	
	
	sb R2, thresholdHigh(R0)
	sb R3, thresholdLow(R0)
	
	;TERZO PUNTO
	daddi R1, R0, 0 
	daddi R3, R0, 128 
	daddi R4, R0, -128 
	daddi R5, R0, 0 
	daddi R6, R0, 1 
	daddi R8, R0, 30
	
	lb R2, c(R1)
	
start:
	slt R5, R2, R3
	bne R5, R6, maxx
	dadd R3, R0, R2
	
maxx:
	slt R5, R4, R2
	bne R5, R6, updt
	dadd R4, R0, R2
	
updt:
	daddi R1, R1, 1
	lb R2, c(R1)
	daddi R8, R8, -1
	bnez R8, start
	
	sb R3, min(R0)
	sb R4, max(R0)
	
	
HALT
	