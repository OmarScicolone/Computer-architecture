#include "button.h"
#include "lpc17xx.h"

#include "../led/led.h"

extern uint8_t curr_value;
extern uint8_t old_value;

void EINT0_IRQHandler (void)	  
{
	curr_value = 1;
	old_value = 0;	
	LED_Out(curr_value);
	
  LPC_SC->EXTINT &= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	uint8_t tmp;
	if(curr_value >= 233){
		curr_value = 233;
		old_value = 144;
	}
	else{
		tmp = curr_value;
		curr_value = curr_value + old_value;
		old_value = tmp;
	}
	
	
	LED_Out(curr_value);
	
	LPC_SC->EXTINT &= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	uint8_t tmp;
	if(curr_value <= 1){
		curr_value = 1;
		old_value = 0;
	}
	else{
		tmp = old_value;
		old_value = curr_value - old_value;
		curr_value = tmp;
	}
	
	LED_Out(curr_value);
  
	LPC_SC->EXTINT &= (1 << 2);     /* clear pending interrupt         */    
}


