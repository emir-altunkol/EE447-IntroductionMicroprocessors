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

// Include application, user and local libraries
#include <stdio.h>
#include <math.h>
#include "TM4C123GH6PM.h"
#include "NOKIA5110_FONTS.h"


// Function prototypes
extern 		void PORTA_SSI0_INIT(void);
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
	//*(background+i) = 0xff;
  *(background+i) = 0x00;
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

	while(1){
		for (  i =0;  i < 600;i++ ){
		for ( j =0;  j < 80;j++ ){
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
	}
}