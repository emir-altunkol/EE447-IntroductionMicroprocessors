/*Pulse_init.h file
Function for creating a pulse train using interrupts
Uses Channel 0, and a 1Mhz Timer clock (_TAPR = 15)
Uses Timer0A to create pulse train on PF2
*/

#include "TM4C123GH6PM.h"
#include <stdio.h>


void pulse_init(void);
void TIMER0A_Handler (void);
void TIMER3A_Handler (void);
double Timer3ACapture_PulseWidth(void);
double Timer3ACapture_Period(void);
void Delay(unsigned long counter);


/* Message for OutStr. Note the 0x04 = \4 termination character. */
char msg[100];

/* Reference external subroutine with full signature */
/* OutStr takes a pointer (address) as an  */
/* argument and does not return any value  */
extern void OutStr(char*); 


#define LOW 	10 
#define HIGH 	40

int count = 0;
volatile double time_period;      // Global variables that used in ISR should be volatile
volatile double time_width;				// Global variables that used in ISR should be volatile
volatile double time_duty;				// Global variables that used in ISR should be volatile
uint32_t rising_edge_current = 0;
uint32_t rising_edge_former  = 0;
uint32_t falling_edge = 0;

void pulse_init(void){
	volatile int *NVIC_EN0 = (volatile int*) 0xE000E100;
	volatile int *NVIC_EN1 = (volatile int*) 0xE000E104;
	volatile int *NVIC_PRI4 = (volatile int*) 0xE000E410;
	volatile int *NVIC_PRI8 = (volatile int*) 0xE000E420;

	SYSCTL->RCGCGPIO |= 0x20; // turn on bus clock for GPIOF
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");
	
  GPIOF->DIR			|= 0x04; //set PF2 as output
  GPIOF->AFSEL		&= (0xFFFFFFFB);  // Regular port function
	GPIOF->PCTL			&= 0xFFFFF0FF;  // No alternate function
	GPIOF->AMSEL		=0; //Disable analog
	GPIOF->DEN			|=0x04; // Enable port digital
	
	// PB2 for input
	SYSCTL->RCGCGPIO |= 0x02; // turn on bus clock for GPIOB
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");

	GPIOB->DIR			&= 0xFB; //set PB2 as input
	GPIOB->AMSEL		 = 0; //Disable analog
  GPIOB->AFSEL		|= (1<<2);  // use PB2 alternate function
	GPIOB->PCTL			&= 0xFFFFF0FF;  // clear out bit-field for pin 2
	GPIOB->PCTL			|= 0x00000700;  // set bit-field 7 for pin 2 using T3CCP0
	GPIOB->DEN			|= 0x04; // Enable port digital
	
	
	SYSCTL->RCGCTIMER	|=0x01; // Start timer0
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");
	TIMER0->CTL			&=0xFFFFFFFE; //Disable timer during setup
	TIMER0->CFG			=0x04;  //Set 16 bit mode
	TIMER0->TAMR		=0x02; // set to periodic, count down
	TIMER0->TAILR		=LOW-1; //Set interval load as LOW. This is 16-bit, max of 1-65535. 
	TIMER0->TAPR		=16-1; // Divide the clock by 16 to get 1us. 8-bit Prescaler can reduce the frequency (16MHz) by 1-255.
	TIMER0->IMR			=0x01; //Enable timeout interrupt	
	
	
	SYSCTL->RCGCTIMER	|=0x08; // Start timer3
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");
	TIMER3->CTL			&=0xFFFFFFFE; //Disable timer during setup
	TIMER3->CFG			=0x04;  //Set 16 bit mode
	TIMER3->TAMR		=0x17; // up-count, capture mod, input edge time mode
	TIMER3->TAPR		=16-1; // Divide the clock by 16 to get 1us. 8-bit Prescaler can reduce the frequency (16MHz) by 1-255.
	TIMER3->CTL			|=(1<<3)|(1<<2) ; // capture rising and falling edges on PB2
	TIMER3->IMR			=0x4; //Enable capture mode event interrupt	
	
	
	
	
	
	//Timer0A is interrupt 19
	//Interrupt 16-19 are handled by NVIC register PRI4
	//Interrupt 19 is controlled by bits 31:29 of PRI4
	//Interrupt 35 is controlled by bits 31:29 of PRI8

	*NVIC_PRI4 &=0x00FFFFFF; //Clear interrupt 19 priority
	*NVIC_PRI4 |=0x40000000; //Set interrupt 19 priority to 2
	
	*NVIC_PRI8 &=0x00FFFFFF; //Clear interrupt 35 priority
	*NVIC_PRI8 |=0x60000000; //Set interrupt 35 priority to 3

	//*NVIC_PRI4 |=0x00004000; //Set interrupt 35 priority to 2
	
	//NVIC has to be neabled
	//Interrupts 0-31 are handled by NVIC register EN0
	//Interrupt 19 is controlled by bit 19
	*NVIC_EN0 |=0x00080000;
	//Interrupt 35 is controlled by bit 35
	*NVIC_EN1 |=0x00000008;
	
	//Enable timer
	TIMER0->CTL			 |=0x03; // bit0 to enable and bit 1 to stall on debug
	TIMER3->CTL			 |=0x03; // bit0 to enable and bit 1 to stall on debug

	return;
}

void TIMER0A_Handler (void){

	if (count==(HIGH/LOW)){
		count = 0;
		GPIOF->DATA  |= 4;  //toggle PF3 pin
	}else{
		GPIOF->DATA  &= 0xFB;
		count = count + 1;
	}
	TIMER0->ICR |=0x01; //Clear the interrupt
	
}

void TIMER3A_Handler (void){

	// rising edge? falling edge?
	if(GPIOB->DATA & (1<<2)) /*check if rising edge occurs */
	{
		rising_edge_current = TIMER3->TAR;     /* save the timestamp */
		if (rising_edge_current > rising_edge_former){
			time_period = (((rising_edge_current - rising_edge_former) & 0x00FFFFFF )* 62.5)/1000; 
	}
	}
	else /*if falling edge occurs */
	{	
		falling_edge = TIMER3->TAR;     /* save the timestamp */
		if (falling_edge > rising_edge_former){
			time_width = (((falling_edge - rising_edge_former) & 0x00FFFFFF )* 62.5)/1000; 
		}
	}
	
	rising_edge_former = rising_edge_current;
	TIMER3->ICR |=0x04; //Clear the interrupt
}

double Timer3ACapture_PulseWidth(void){
	uint32_t risingEdge, fallingEdge;
	while(1)
	{
    TIMER3->ICR = 4;            /* clear timer0A capture flag */
    while((TIMER3->RIS & (1<<2)) == 0) ;    /* wait till captured */
	  if(GPIOB->DATA & (1<<2)) /*check if rising edge occurs */
		{
			risingEdge = TIMER3->TAR;     /* save the timestamp */
			/* detect falling edge */
			TIMER3->ICR = 4;            /* clear timer3A capture flag */
			while((TIMER3->RIS & (1<<2)) == 0) ;    /* wait till captured */
			fallingEdge = TIMER3->TAR;     /* save the timestamp */
			return (((fallingEdge - risingEdge) & 0x00FFFFFF )* 62.5)/1000; /* return the time difference */
		}
	}
}

double Timer3ACapture_Period(void){
	uint32_t risingEdge, risingEdge2;
		while(1)
	{
    TIMER3->ICR = 4;            /* clear timer0A capture flag */
    while((TIMER3->RIS & (1<<2)) == 0) ;    /* wait till captured */
	  if(GPIOB->DATA & (1<<2)) /*check if rising edge occurs */
		{
    risingEdge = TIMER3->TAR;     /* save the timestamp */
		/* detect falling edge */
    TIMER3->ICR = 4;            /* clear timer3A capture flag */
    while((TIMER3->RIS & (1<<2)) == 0) ;    /* wait till captured */
		TIMER3->ICR = 4;
		while((TIMER3->RIS & (1<<2)) == 0) ;    /* wait till captured */
		TIMER3->ICR = 4;
    risingEdge2 = TIMER3->TAR;     /* save the timestamp */
		return (((risingEdge2 - risingEdge) & 0x00FFFFFF )* 62.5)/1000; /* return the time difference */
		}
	}
}


void Delay(unsigned long counter)
{
	unsigned long i = 0;
	
	for(i=0; i< counter*1000; i++);
}

int main (void){
	pulse_init();
	//OutStr(msg);

	while(1){
		// time_period = Timer3ACapture_Period();
		// time_width = Timer3ACapture_PulseWidth();
		TIMER3->IMR			=0x0; //Disable capture mode event interrupt before accessing the global variables which are used in ISR
		time_duty =  time_width/time_period;
		sprintf(msg,"\r\n %0.2f us, %0.2f us,  %0.2f %% \r\4", time_width, time_period, time_duty);
		OutStr(msg);
		TIMER3->IMR			=0x4; //Enable capture mode event interrupt	

		Delay(500);
	}
}
