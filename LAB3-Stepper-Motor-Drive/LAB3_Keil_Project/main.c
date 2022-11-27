/* Includes */
#include "TM4C123GH6PM.h"
#include "Pulse_init.h"

/* Macro definitions */

/* Function prototypes */
void init_gpio(void);
void init_systick(void);
void SysTick_Handler(void);

uint32_t down_restart = 0; 
uint32_t up_restart = 0;

int step_up = 0;
int	step_down = 0;

void init_systick(void){
	
	SysTick->LOAD = 999999; /* 1 second reload value (16MHz) */
	SysTick->CTRL = 7; /* (0x07) Enable counter, interrupt and select system bus clock */
	SysTick->VAL = 0; /* Initialize current value register */
}

void init_gpio(void){
	SYSCTL->RCGCGPIO |= 0x02; /* Turn on bus clock for GPIOB */
	GPIOB->DIR = 0x0F;       /* Set PB0-3 as outputs, PB4-7 as inputs */
	GPIOB->DEN |= 0xFF;				/* Enable digital mode */
	GPIOB->AFSEL &= 0x00;			/* Configure as GPIO */
	GPIOB->PDR = 0x0F;				/* Pull downs only for outputs */	
	
	SYSCTL->RCGCGPIO |= 0x20; /* Turn on bus clock for GPIOF */
	GPIOF->DIR |= 0x08;       /* Set PB0-3 as outputs, PB4-7 as inputs,*/
	GPIOF->DEN |= 0x08;				/* Enable digital mode */
}

/*/////////////////////PART-1///////////////////////////*/
/*
void SysTick_Handler(void) {
	//count = count +1;
	if (restart == 1){
		restart = 0; 
		GPIOB->DATA = 1;
	}
	else{
		GPIOB->DATA = GPIOB->DATA *2;
	}

	
	if (GPIOB->DATA == 8){
		restart = 1; 
	}

	GPIOF->DATA = GPIOF->DATA ^ 8 ; // For debugging purposes 
}

int main(void) {
	init_gpio();
	init_systick();
	GPIOB->DATA = 1;
	while(1){
	}
}  
*/
/*/////////////////////PART-1///////////////////////////*/




/*/////////////////////PART-2///////////////////////////*/



void SysTick_Handler(void) {

	int pin_state = (0xF0 & GPIOB->DATA) >> 4;
	if (pin_state == 14){  // d14 = b1110
		//__ASM("BL DELAY50");
		//__ASM("BL DELAY50");
		if (pin_state == 14){ // d14 = b1110
		step_up = 1;
		GPIOF->DATA = GPIOF->DATA ^ 8 ; // For debugging purposes 
		}
	}
	
	if (pin_state == 13){  // d13 = b1101
	//__ASM("BL DELAY50");
		if (pin_state == 13){ // d13 = b1101
		step_down = 1;
		}else{
		step_down = 0;		
		}
	}
		if (pin_state == 15){ // d15 = b1111
		//__ASM("BL DELAY50");
			if (pin_state == 15){ // d15 = b1111
			if (step_up == 1){
					step_up = 0;
					if (up_restart == 1){
					up_restart = 0; 
					GPIOB->DATA = (GPIOB->DATA & 0xF0) +  0x01;
					}
					else{
					GPIOB->DATA = (GPIOB->DATA & 0xF0) + ((GPIOB->DATA*2)& 0x0F) ;
					}
					if ((GPIOB->DATA & 0x0F) == 8){
					up_restart = 1; 
					}	
					GPIOF->DATA = GPIOF->DATA ^ 8 ;
		}
			
			if (step_down == 1){
					step_down = 0;
					if (down_restart == 1){
					down_restart = 0; 
					GPIOB->DATA = (GPIOB->DATA & 0xF0) +  0x08;
					}
					else{
					GPIOB->DATA = (GPIOB->DATA & 0xF0) + ((GPIOB->DATA& 0x0F)/2) ;
					}
					if ((GPIOB->DATA & 0x0F) ==  1){
					down_restart = 1; 
					}	
			}
		
		}
	}
}

int main(void) {
	init_gpio();
	init_systick();
	GPIOB->DATA = 1;
	while(1){
	}
}  

/*/////////////////////PART-2///////////////////////////*/
