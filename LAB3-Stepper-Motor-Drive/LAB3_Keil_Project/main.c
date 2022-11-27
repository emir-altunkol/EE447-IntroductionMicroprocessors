/* Includes */
#include "TM4C123GH6PM.h"

/* Macro definitions */

/* Function prototypes */
void init_gpio(void);
void init_systick(void);
void init_systick(void);

void init_systick(void){
	SysTick->LOAD = 15999999; /* 1 second reload value (16MHz) */
	SysTick->CTRL = 7; /* (0x07) Enable counter, interrupt and select system bus clock */
	SysTick->VAL = 0; /* Initialize current value register */
}

void init_gpio(void){
	SYSCTL->RCGCGPIO |= 0x02; /* Turn on bus clock for GPIOB */
	GPIOB->DIR = 0x0F;       /* Set PB0-3 as outputs, PB4-7 as inputs */
	GPIOB->DEN |= 0xFF;				/* Enable digital mode */
	GPIOB->AFSEL &= 0x00;			/* Configure as GPIO */
	GPIOB->PDR = 0x0F;				/* Pull downs only for outputs */	
}
