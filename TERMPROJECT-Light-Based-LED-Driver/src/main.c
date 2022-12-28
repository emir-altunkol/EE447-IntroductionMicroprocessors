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
#include "TM4C123GH6PM.h"
#include <stdio.h>

extern 		void PORTA_SSI0_INIT(void)			;
extern 		void N5110_INIT(void)				;
extern 		void LOSER_ROM(void)	;
extern		void SCREEN_ROM(void);
extern 		void AnnounceResult(void) ;

//extern 		void DELAY50(void);
//extern 		void NOT_READY(void);
//extern 		void WRITE_CHAR(void);
//extern 		void FIFO_FULL(void);
//extern 		void CAL_MEMORY(void);
//extern 		void SCREEN_MAP(void);
//extern 		void SET_XY(void);


int main (void){
	PORTA_SSI0_INIT();
	N5110_INIT();
	LOSER_ROM();
	SCREEN_ROM();
	AnnounceResult();
	
	while(1){
	}
}