/* TM4C123G Tiva C Series ADC Example */

/* This Program controls the onboard green LED based on discrete digital value of ADC */
/* If AN0 channel value is less 2048 digital value than LED turns off and otherwise remain on */
#include "TM4C123GH6PM.h"

int main(void)
{
     unsigned int adc_value;
	
    /* Enable Clock to ADC0 and GPIO pins*/
    SYSCTL->RCGCGPIO |= (1<<4);   /* Enable Clock to GPIOE or PE3/AN0 */
    SYSCTL->RCGCADC |= (1<<0);    /* AD0 clock enable*/
    
    /* initialize PE3 for AIN0 input  */
    GPIOE->AFSEL |= (1<<3);       /* enable alternate function */
    GPIOE->DEN &= ~(1<<3);        /* disable digital function */
    GPIOE->AMSEL |= (1<<3);       /* enable analog function */
   
    /* initialize sample sequencer3 */
    ADC0->ACTSS &= ~(1<<3);        /* disable SS3 during configuration */
    ADC0->EMUX &= ~0xF000;    /* software trigger conversion */
    ADC0->SSMUX3 = 0;         /* get input from channel 0 */
    ADC0->SSCTL3 |= (1<<1)|(1<<2);        /* take one sample at a time, set flag at 1st sample */
    ADC0->ACTSS |= (1<<3);         /* enable ADC0 sequencer 3 */
    
	  /*Iniitialize PF3 as a digital output pin */
	  	 
   SYSCTL->RCGCGPIO |= 0x20; // turn on bus clock for GPIOF
   GPIOF->DIR       |= 0x08; //set GREEN pin as a digital output pin
   GPIOF->DEN       |= 0x08;  // Enable PF3 pin as a digital pin
    while(1)
    {
        ADC0->PSSI |= (1<<3);        /* Enable SS3 conversion or start sampling data from AN0 */
        while((ADC0->RIS & 8) == 0) ;   /* Wait untill sample conversion completed*/
        adc_value = ADC0->SSFIFO3; /* read adc coversion result from SS3 FIFO*/
        ADC0->ISC = 8;          /* clear coversion clear flag bit*/
			/*control Green PF3->LED */
			if(adc_value >= 2048)
	GPIOF->DATA  = 0x08; /* turn on green LED*/
	else if(adc_value < 2048)
	GPIOF->DATA  = 0x00; /* turn off green LED*/
    }
}

//void SystemInit(void)
//{
//    SCB->CPACR |= 0x00f00000;
//}