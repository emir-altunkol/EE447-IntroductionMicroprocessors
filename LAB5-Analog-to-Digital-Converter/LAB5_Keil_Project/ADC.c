/* TM4C123G Tiva C Series ADC Example */

/* This Program measures analog voltage by using ADC0 via interrupt method*/
/* TM4C123G ADC Interrupt Example */
#include "TM4C123GH6PM.h"
#include <stdio.h>
void Delay(unsigned long counter);
void UART5_init(void);
void UART5_Transmitter(unsigned char data);
void printstring(char *str);
char mesg[24];
volatile float voltage;
volatile unsigned int adc_value;
void ADC0SS3_Handler(void){

extern void DELAY1S(void); 

	
	
	adc_value = ADC0->SSFIFO3; /* read adc coversion result from SS3 FIFO*/
	ADC0->ISC = 8;          /* clear coversion clear flag bit*/
  ADC0->PSSI |= (1<<3);        /* Enable SS3 conversion or start sampling data from AN0 */

}


int main(void)
{

	   UART5_init();
    /* Enable Clock to ADC0 and GPIO pins*/
    SYSCTL->RCGCGPIO |= (1<<4);   /* Enable Clock to GPIOE or PE3/AN0 */
    SYSCTL->RCGCADC |= (1<<0);    /* AD0 clock enable*/
    
    /* initialize PE3 for \AIN0 input  */
    GPIOE->AFSEL |= (1<<3);       /* enable alternate function */
    GPIOE->DEN &= ~(1<<3);        /* disable digital function */
    GPIOE->AMSEL |= (1<<3);       /* enable analog function */
   
    /* initialize sample sequencer3 */
    ADC0->ACTSS &= ~(1<<3);        /* disable SS3 during configuration */
    ADC0->EMUX &= ~0xF000;    /* software trigger conversion */
    ADC0->SSMUX3 = 0;         /* get input from channel 0 */
    ADC0->SSCTL3 |= (1<<1)|(1<<2);        /* take one sample at a time, set flag at 1st sample */
   
	  /* Enable ADC Interrupt */
	ADC0->IM |= (1<<3); /* Unmask ADC0 sequence 3 interrupt*/
	NVIC->ISER[0] |= 0x00020000; /* enable IRQ17 for ADC0SS3*/
  ADC0->ACTSS |= (1<<3);         /* enable ADC0 sequencer 3 */
	ADC0->PSSI |= (1<<3);        /* Enable SS3 conversion or start sampling data from AN0 */

		 /*Iniitialize PF3 as a digital output pin */
	  	 
   SYSCTL->RCGCGPIO |= 0x20; // turn on bus clock for GPIOF
   GPIOF->DIR       |= 0x08; //set GREEN pin as a digital output pin
   GPIOF->DEN       |= 0x08;  // Enable PF3 pin as a digital pin
    
    while(1)
    {
       
			  /* convert digital value back into voltage */
			 voltage = (adc_value * 0.0008);
			 //sprintf(mesg, "\r\nVoltage = %0.3f Volts", voltage);
			 printstring(mesg);
			
 
			//DELAY1S();
			__ASM(" BL DELAY1S ");
			__ASM(" BL DELAY1S ");
			__ASM(" BL DELAY1S ");
			__ASM(" BL DELAY1S ");
			if(adc_value >= 2048)
			GPIOF->DATA  = 0x08; /* turn on green LED*/
			else if(adc_value < 2048)
			GPIOF->DATA  = 0x00; /* turn off green LED*/
    }
}


void UART5_init(void)
{
		SCB->CPACR |= 0x00f00000;
	
	SYSCTL->RCGCUART |= 0x20;  /* enable clock to UART5 */
    SYSCTL->RCGCGPIO |= 0x10;  /* enable clock to PORTE for PE4/Rx and RE5/Tx */
    Delay(1);
    /* UART0 initialization */
    UART5->CTL = 0;         /* UART5 module disbable */
    UART5->IBRD = 104;      /* for 9600 baud rate, integer = 104 */
    UART5->FBRD = 11;       /* for 9600 baud rate, fractional = 11*/
    UART5->CC = 0;          /*select system clock*/
    UART5->LCRH = 0x60;     /* data lenght 8-bit, not parity bit, no FIFO */
    UART5->CTL = 0x301;     /* Enable UART5 module, Rx and Tx */

    /* UART5 TX5 and RX5 use PE4 and PE5. Configure them digital and enable alternate function */
    GPIOE->DEN = 0x30;      /* set PE4 and PE5 as digital */
    GPIOE->AFSEL = 0x30;    /* Use PE4,PE5 alternate function */
    GPIOE->AMSEL = 0;    /* Turn off analg function*/
    GPIOE->PCTL = 0x00110000;     /* configure PE4 and PE5 for UART */
}
void UART5_Transmitter(unsigned char data)  
{
    while((UART5->FR & (1<<5)) != 0); /* wait until Tx buffer not full */
    UART5->DR = data;                  /* before giving it another byte */
}

void printstring(char *str)
{
  while(*str)
	{
		UART5_Transmitter(*(str++));
	}
}
void Delay(unsigned long counter)
{
	unsigned long i = 0;
	
	for(i=0; i< counter*1000; i++);
}
