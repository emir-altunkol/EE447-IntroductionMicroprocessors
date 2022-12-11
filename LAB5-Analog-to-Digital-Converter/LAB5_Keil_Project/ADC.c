#include "TM4C123GH6PM.h"
#include <stdio.h>

int adc_raw = 0;
float voltage = 0;
char charArr[24] ;

extern void DELAY1S(void);
extern void DELAY100(void);
extern void OutStr(char*); 


void GPIO_init(void);
void ADC0_init(void);

void GPIO_init(void){
	/*PIN Initialization for PE3 used with AIN0 */
	SYSCTL->RCGCGPIO |= (1<<4);   				/* GPIOE or PE3/AN0 clock enable */
	GPIOE->AFSEL |= (1<<3);       				/* enable alternate function */
	//__ASM("NOP");
	//__ASM("NOP");
	//__ASM("NOP");
	GPIOE->AMSEL |= (1<<3);       				/* enable analog function */
	GPIOE->DEN &= ~(1<<3);        				/* disable digital function */
	//GPIOE->DIR	|= (1<<3);							/* direction for PE3 is input */
	
	/*PIN Initialization for PF1 (RED LED) as digital out*/
	SYSCTL->RCGCGPIO |= 0x20; 						/* turn on bus clock for GPIOF */
  GPIOF->DIR       |= 0x02; 						/* set RED pin as a digital output pin */
  GPIOF->DEN       |= 0x02;  					  /* Enable PF1 pin as a digital pin */
	
	//SCB->CPACR |= 0x00f00000;
}


void ADC0_init(void){
	/*CLOCK ENABLE for ADC0 and PE3 */
	SYSCTL->RCGCADC |= (1<<0); 						/* AD0 clock enable*/
	//__ASM(" BL DELAY1S ");
	//__ASM(" BL DELAY1S ");
	//__ASM(" BL DELAY1S ");
	DELAY1S();
	
	/* initialize sample sequencer3 */
	ADC0->ACTSS &= ~(1<<3);        				/* disable SS3 during configuration */
  ADC0->EMUX &= ~0xF000;    						/* software trigger conversion */
  ADC0->SSMUX3 = 0;         						/* get input from channel 0 */
  ADC0->SSCTL3 |= (1<<1)|(1<<2);        /* take one sample at a time, set flag at 1st sample */
	ADC0->PC		|= (1<<0);								/* set sample rate to 125 ksps */ 
  ADC0->ACTSS |= (1<<3);         				/* enable ADC0 sequencer 3 */	

}

///PART-1///////////////////////////////////////////////////////////////////////////////////////////////
//int main(void)
//{
//  GPIO_init();
//	ADC0_init();
//  while(1)
//  {
//			ADC0->PSSI |= (1<<3);        		  /* Enable SS3 conversion or start sampling data from AN0 */
//			while((ADC0->RIS & 8) == 0) ;     /* Wait untill sample conversion completed*/
//			adc_raw = ADC0->SSFIFO3; 				  /* read adc coversion result from SS3 FIFO*/
//			ADC0->ISC = 8;          				  /* clear coversion clear flag bit*/
//		
//			//DELAY1S();
//			__ASM(" BL DELAY100 ");
//			__ASM(" BL DELAY100 ");
//			__ASM(" BL DELAY100 ");
//		  __ASM(" BL DELAY100 ");
//		  __ASM(" BL DELAY100 ");
//		
//			if(adc_raw >= 2048)
//			GPIOF->DATA  = 0x02;              /* turn on green LED*/
//			else if(adc_raw < 2048)
//			GPIOF->DATA  = 0x00;              /* turn off green LED*/
//    }
//}
///PART-1///////////////////////////////////////////////////////////////////////////////////////////////


///PART-2-3///////////////////////////////////////////////////////////////////////////////////////////////
//int main(void)
//{
//  GPIO_init();
//	ADC0_init();
//  while(1)
//  {
//		ADC0->PSSI |= (1<<3);        		  /* Enable SS3 conversion or start sampling data from AN0 */
//		while((ADC0->RIS & 8) == 0) ;     /* Wait untill sample conversion completed*/
//		adc_raw = ADC0->SSFIFO3; 				  /* read adc coversion result from SS3 FIFO*/
//		ADC0->ISC = 8;          				  /* clear coversion clear flag bit*/
//
//		if(adc_raw >= 2048)
//		GPIOF->DATA  = 0x02;              /* turn on green LED*/
//		else if(adc_raw < 2048)
//		GPIOF->DATA  = 0x00;              /* turn off green LED*/
//			
//		voltage = (adc_raw * 0.0008) - 1.65;
//		sprintf(charArr, "%.2f", voltage);
//		//DELAY1S();
//		__ASM(" BL DELAY100 ");
//		__ASM(" BL DELAY100 ");
//    }
//}
///PART-2-3///////////////////////////////////////////////////////////////////////////////////////////////

///PART-4///////////////////////////////////////////////////////////////////////////////////////////////
int main(void)
{
  GPIO_init();
	ADC0_init();
  while(1)
  {
		ADC0->PSSI |= (1<<3);        		  /* Enable SS3 conversion or start sampling data from AN0 */
		while((ADC0->RIS & 8) == 0) ;     /* Wait untill sample conversion completed*/
		adc_raw = ADC0->SSFIFO3; 				  /* read adc coversion result from SS3 FIFO*/
		ADC0->ISC = 8;          				  /* clear coversion clear flag bit*/

		if(adc_raw >= 2048)
		GPIOF->DATA  = 0x02;              /* turn on green LED*/
		else if(adc_raw < 2048)
		GPIOF->DATA  = 0x00;              /* turn off green LED*/
			
		voltage = (adc_raw * 0.0008) - 1.65;
		sprintf(charArr, "\r\n %.2f \r\4", voltage);
		OutStr(charArr);
		//DELAY1S();
		__ASM(" BL DELAY1S ");
    }
}
///PART-4///////////////////////////////////////////////////////////////////////////////////////////////

///PART-5///////////////////////////////////////////////////////////////////////////////////////////////
//int main(void)
//{
//  GPIO_init();
//	ADC0_init();
//  while(1)
//  {
//		ADC0->PSSI |= (1<<3);        		  /* Enable SS3 conversion or start sampling data from AN0 */
//		while((ADC0->RIS & 8) == 0) ;     /* Wait untill sample conversion completed*/
//		adc_raw = ADC0->SSFIFO3; 				  /* read adc coversion result from SS3 FIFO*/
//		ADC0->ISC = 8;          				  /* clear coversion clear flag bit*/
//			
//		voltage = (adc_raw * 0.0008);
//		
//		if(voltage >= 1.65)
//		GPIOF->DATA  = 0x02;              /* turn on green LED*/
//		else if(voltage < 1.65)
//		GPIOF->DATA  = 0x00;              /* turn off green LED*/
//		
//		sprintf(charArr, "\r\n %.2f \r\4", voltage);
//		OutStr(charArr);
//		//DELAY1S();
//		__ASM(" BL DELAY100 ");
//    }
//}
///PART-5///////////////////////////////////////////////////////////////////////////////////////////////

