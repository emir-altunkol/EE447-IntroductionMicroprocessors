// *************************************************************** 
// main.c
// This program is aimed to control the brightness of a LED using
// feedback from  a light sensor and the output is displayed on 
// Nokia 5110 LCD display.
// @author: ozgurgulsuna
// Created on 27/12/2022
//*************************************************************** 
//
// Wiring
// TM4C123 -  LCD 5110        Comment
// ==============================================================
// 3.3V    -  Vcc             5110 supports 3v to 5v
// PA4     -  BL              GPIO    / Backlight
// GND     -  GND
// PA_7    -  RST             GPIO    / Reset 
// PA_2    -  Clk             SSI0Clk / SCK(0) to Clock
// PA_5    -  Din             SSI0Tx  / MOSI(0) to Serial Data in
// PA_3    -  CE              SSI0Fss / Chip Select
// PA_6    -  DC              GPIO    / Select Data or Command
// ==============================================================
//
//
// Wiring
// TM4C123 -  TSL2561        Comment
// ==============================================================
// PC4     -  INT              GPIO    / Interrupt
// 3.3V    -  3.3V             
// GND     -  GND
// PB2		 -	SCL							
// PB3		 -	SDA					
// ==============================================================

// Include application, user and local libraries
#include <stdio.h>
#include <math.h>
#include "TM4C123GH6PM.h"
#include "Nokia5110_fonts.h"
#include "i2c.h"
#include "lux.h"



// Function prototypes
extern 		void PORTA_SSI0_INIT(void);
extern		void SCREEN_MAP(void);
extern 		void N5110_INIT(void);
extern 		void AnnounceResult(void);

// Address for the memory locations
unsigned char * background = (unsigned char*)0x20002020;
unsigned char * sayilar_adress = (unsigned char*) 0x20002218; 
unsigned char * font_adress = (unsigned char*)0x2000229C;

// Input array definitions
unsigned char sayilar[84] ; 

// Static variables
static unsigned int i = 0;
static unsigned int j = 0;
static unsigned int k = 0;

// I2C vairables
static unsigned int Address = 0x39 ;//Slave addr – also 0x29 or 0x49
unsigned int Command = 0x8C ;//Set Command bit Read Byte Protocol
 char data1 = 0xF2;
 char data2 = 0xF2;
 char data3 = 0xF2;
 char data4 = 0xF2;
 
 unsigned int ch00 = 0;
 unsigned int ch11 = 0;
 
 int luxo = 0;
 int pot = 0xfB;

void adc_init(void)
{
	SYSCTL->RCGCGPIO |= 0x10;
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");
	while (SYSCTL->PRGPIO == 0);
	
	GPIOE->DIR &= 0xFFFFFFF7;
	GPIOE->AMSEL |= 0x08;
	GPIOE->AFSEL |= 0x08;
	
	GPIOE->DEN |= 0x04;
	GPIOE->AFSEL &= 0xFFFFFFFB;
	GPIOE->DIR &= 0xFFFFFFFB;
		
	SYSCTL->RCGCADC |= 0x01;
	__ASM("NOP");
	__ASM("NOP");
	__ASM("NOP");
	while (SYSCTL->PRADC == 0);
	
	ADC0->ACTSS &= 0xFFFFFFF7;
	ADC0->EMUX &= 0xFFFF0FFF;
	ADC0->SSCTL3 |= 0x06;
	ADC0->PC |= 0x01;
	ADC0->ACTSS |= 0x08;
	ADC0->PSSI |= 0x08;
	ADC0->ISC |= 0x08;
}

int data_read(void){
	int temp;
	while (1){
		if (ADC0->RIS & 0x8){
			temp = ADC0->SSFIFO3;
			ADC0->ISC |= 0x08;
			ADC0->PSSI |= 0x08;
			return temp;
		}
	}
}

int button_pressed(void)
{
	if (GPIOE->DATA | 0xFFFFFFFB)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}


int main (void){
	PORTA_SSI0_INIT();
	N5110_INIT();
	
//for (  i =1;  i < 84;i++ ){							// Initialize array to print
//sayilar[i] = (sin(i/4.0)+1.5)*80.0;
//}
	
	for (i = 0; i< 84; i++){								// Save array to be printed to the memory
		*(sayilar_adress+i) = sayilar[i];
	}

	for (  i =1;  i < 504;i++ ){
	//*(background+i) = NOKIA_DICK[i];
	*(background+i) = nokia[i];
	//*(background+i) = 0xff;
  //*(background+i) = 0x00;
	}
	
	for (  i =0;  i < 60;i++ ){
		for ( j =0;  j < 7;j++ ){
		*(font_adress+i*7+j) = FontThick[i][j];
		}
	}
	
//	for (  i =0;  i < (0+8);i++ ){
//	*(background+i+32) = FontWide[24][i];
//	}

//	for (  i =0;  i < (0+12);i++ ){
//	*(background+i+84) = FontLarge[25][i]/256;
//	*(background+i) = FontLarge[25][i]%256;
//	}
	

	
//AnnounceResult();
//_ASM("MOV ");
SCREEN_MAP();	
	
			for (  i =0;  i < 600;i++ ){
		for ( j =0;  j < 3000;j++ ){
		__ASM("NOP");
		}
	}
			
		for (  i =1;  i < 504;i++ ){
	//*(background+i) = NOKIA_DICK[i];
	//*(background+i) = nokia[i];
	//*(background+i) = 0xff;
  *(background+i) = 0x00;
	}
//
		

	
//----I2C INIT----//

char data[2];
I2C3_Init();

DELAY50();
DELAY50();
DELAY50();
	
I2C3_Write_Multiple(0x39,0x81,1,0x00);
DELAY50();

I2C3_Write_Multiple(0x39,0x80,1,0x03);
DELAY50();

	
adc_init();

	
	
	
	
	
	
//

	while(1){
		//I2C0_Init();
		for (  i =0;  i < 600;i++ ){
		for ( j =0;  j < 20;j++ ){
		__ASM("NOP");
		}
	}
		
	
		for (  i =1;  i < 84;i++ ){
		sayilar[(i+k)%84] = (sin(i/4.45/3*4)+6)*20.0;
		}
		for (i = 0; i< 84; i++){
		*(sayilar_adress+i) = sayilar[i];
		}
		k++;
		AnnounceResult();
	
	
		//I2C3_Write_Multiple(0x39,0x80,1,0x03);
		I2C3_read_Multiple(0x39,0x8C,1,data1);
	DELAY50();
		I2C3_read_Multiple(0x39,0x8D,1,data2);
		DELAY50();
		ch00 = data2*256 + data1;
		
		
		I2C3_read_Multiple(0x39,0x8E,1,data3);
		DELAY50();
		I2C3_read_Multiple(0x39,0x8F,1,data4);
		DELAY50();
		ch11 = data4*256 + data3;
		
		luxo = CalculateLux(0,0,ch00,ch11,0);
		DELAY50();
		I2C3_Write_Multiple(0x39,0xC0,1,0x00);
		
		pot=data_read();


		
		//I2C0_read_Multiple(Address,0x8C,1,DataLow);
		
	}
}