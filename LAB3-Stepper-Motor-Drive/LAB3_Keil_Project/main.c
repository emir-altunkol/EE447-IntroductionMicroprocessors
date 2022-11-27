/* Includes */
#include "TM4C123GH6PM.h"
#include "Pulse_init.h"

/* Macro definitions */

/* Function prototypes */
void init_gpio(void);
void init_systick(void);
void SysTick_Handler(void);

uint32_t restart = 0; 
void init_systick(void){
	
	SysTick->LOAD = 99999; /* 1 second reload value (16MHz) */
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


void SysTick_Handler(void) {
	/*count = count +1;*/
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

	GPIOF->DATA = GPIOF->DATA ^ 8 ; /* For debugging purposes */
}

int main(void) {
	init_gpio();
	init_systick();
	GPIOB->DATA = 1;
	while(1){
	}
}
