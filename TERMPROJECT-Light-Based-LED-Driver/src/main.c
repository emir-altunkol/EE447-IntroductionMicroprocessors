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

#define NOKIA5110_FONT_Thick

extern 		void PORTA_SSI0_INIT(void)			;
extern 		void N5110_INIT(void)				;
//extern 		void START_SCREEN(void);
extern 		void LOSER_ROM(void)	;
extern		void SCREEN_ROM(void);
extern 		void AnnounceResult(void) ;

unsigned char * ahmet = (unsigned char*)0x20002020;
unsigned char * font_adress = (unsigned char*)0x2000221A;


static unsigned char NOKIA_DICK [] = {
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0xC0, 0xC0, 0xC0, 0xE0, 0x70, 0x70, 0x30, 0x30, 0x38, 0x18, 0x18, 0x1C, 0x0C, 0x0C,
0x0E, 0x06, 0x06, 0x07, 0x03, 0x03, 0x03, 0x83, 0x83, 0x83, 0xC3, 0xC3, 0xC3, 0xE3, 0xF3, 0x77,
0x3E, 0xFC, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x80, 0xE0, 0xF0, 0x38, 0x18, 0x1C, 0x0E, 0x06, 0x07, 0x83, 0x83, 0x03, 0x03,
0x03, 0x03, 0x07, 0x0E, 0xFC, 0xF8, 0xC0, 0x00, 0x80, 0x80, 0xC0, 0xE0, 0x60, 0x70, 0x30, 0x38,
0x1C, 0x0C, 0x0C, 0x0E, 0x06, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00,
0x00, 0x00, 0x80, 0xE0, 0xFC, 0x3F, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x03, 0x01, 0x00, 0x00, 0x00, 0x60, 0x60, 0x00, 0x00,
0xC1, 0xC1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0F, 0x07, 0x03, 0x03, 0x01, 0x01, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0xC0, 0xC0, 0xE0, 0x60, 0x70, 0x30,
0x38, 0x18, 0x1C, 0x0C, 0x0E, 0x07, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0F, 0x1E, 0x38, 0x70, 0xE0, 0xC0,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18,
0x18, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0xF0, 0xF0, 0xB0, 0x38, 0x18, 0x18, 0x18, 0x18, 0x18,
0x18, 0x18, 0x1C, 0x0C, 0x0C, 0x0E, 0x06, 0x06, 0x06, 0x07, 0x03, 0x03, 0x03, 0x01, 0x01, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x7C, 0x70, 0x60,
0x60, 0x60, 0xE3, 0xC3, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xE0, 0xF0, 0x7F, 0x1F, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
};


#ifdef NOKIA5110_FONT_Wide

// ASCII font file : Number five Wide font 8 by 8 
// Define the ASCII table as Data array
// cols left to right 0x00 is  off 0xFF is all on 
// Each character is in a 10 by 8 bit pixel box 

const unsigned char FontWide[59][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}, //  
    {0x00, 0x00, 0x00, 0x5f, 0x00, 0x00, 0x00, 0x00}, // !
    {0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00}, // "
    {0x0a, 0x1f, 0x0a, 0x1f, 0x0a, 0x00, 0x00, 0x00}, // #
    {0x24, 0x2a, 0x2a, 0x7f, 0x2a, 0x2a, 0x12, 0x00}, // $
    {0x00, 0x47, 0x25, 0x17, 0x08, 0x74, 0x52, 0x71}, // %
    {0x00, 0x36, 0x49, 0x49, 0x49, 0x41, 0x41, 0x38}, // &
    {0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00}, // '
    {0x00, 0x3e, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00}, // (
    {0x41, 0x3e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}, // )
    {0x04, 0x15, 0x0e, 0x15, 0x04, 0x00, 0x00, 0x00}, // *
    {0x08, 0x08, 0x3e, 0x08, 0x08, 0x00, 0x00, 0x00}, // +
    {0x00, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00, 0x00}, // ,
    {0x08, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00, 0x00}, // -
    {0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}, // .
    {0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00}, // /
    {0x00, 0x3e, 0x61, 0x51, 0x49, 0x45, 0x43, 0x3e}, // 0
    {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00, 0x00}, // 1
    {0x00, 0x71, 0x49, 0x49, 0x49, 0x49, 0x49, 0x46}, // 2
    {0x41, 0x49, 0x49, 0x49, 0x49, 0x49, 0x36, 0x00}, // 3
    {0x00, 0x0f, 0x10, 0x10, 0x10, 0x10, 0x10, 0x7f}, // 4
    {0x00, 0x4f, 0x49, 0x49, 0x49, 0x49, 0x49, 0x31}, // 5
    {0x00, 0x3e, 0x49, 0x49, 0x49, 0x49, 0x49, 0x30}, // 6
    {0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x7e, 0x00}, // 7
    {0x00, 0x36, 0x49, 0x49, 0x49, 0x49, 0x49, 0x36}, // 8
    {0x00, 0x06, 0x49, 0x49, 0x49, 0x49, 0x49, 0x3e}, // 9
    {0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00}, // :
    {0x00, 0x34, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00}, // ;
    {0x08, 0x14, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00}, // <
    {0x14, 0x14, 0x14, 0x14, 0x14, 0x00, 0x00, 0x00}, // =
    {0x22, 0x14, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00}, // >
    {0x00, 0x06, 0x01, 0x01, 0x59, 0x09, 0x09, 0x06}, // ?
    {0x00, 0x3e, 0x41, 0x5d, 0x55, 0x5d, 0x51, 0x5e}, // @
    {0x00, 0x7e, 0x01, 0x09, 0x09, 0x09, 0x09, 0x7e}, // A
    {0x00, 0x7f, 0x41, 0x49, 0x49, 0x49, 0x49, 0x36}, // B
    {0x00, 0x3e, 0x41, 0x41, 0x41, 0x41, 0x41, 0x22}, // C
    {0x00, 0x7f, 0x41, 0x41, 0x41, 0x41, 0x41, 0x3e}, // D
    {0x00, 0x3e, 0x49, 0x49, 0x49, 0x49, 0x49, 0x41}, // E
    {0x00, 0x7e, 0x09, 0x09, 0x09, 0x09, 0x09, 0x01}, // F
    {0x00, 0x3e, 0x41, 0x49, 0x49, 0x49, 0x49, 0x79}, // G
    {0x00, 0x7f, 0x08, 0x08, 0x08, 0x08, 0x08, 0x7f}, // H
    {0x00, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00}, // I
    {0x00, 0x38, 0x40, 0x40, 0x41, 0x41, 0x41, 0x3f}, // J
    {0x00, 0x7f, 0x08, 0x08, 0x08, 0x0c, 0x0a, 0x71}, // K
    {0x00, 0x3f, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40}, // L
    {0x00, 0x7e, 0x01, 0x01, 0x7e, 0x01, 0x01, 0x7e}, // M
    {0x00, 0x7e, 0x01, 0x01, 0x3e, 0x40, 0x40, 0x3f}, // N
    {0x00, 0x3e, 0x41, 0x41, 0x41, 0x41, 0x41, 0x3e}, // O
    {0x00, 0x7e, 0x09, 0x09, 0x09, 0x09, 0x09, 0x06}, // P
    {0x00, 0x3e, 0x41, 0x41, 0x71, 0x51, 0x51, 0x7e}, // Q
    {0x00, 0x7e, 0x01, 0x31, 0x49, 0x49, 0x49, 0x46}, // R
    {0x00, 0x46, 0x49, 0x49, 0x49, 0x49, 0x49, 0x31}, // S
    {0x01, 0x01, 0x01, 0x7f, 0x01, 0x01, 0x01, 0x00}, // T
    {0x00, 0x3f, 0x40, 0x40, 0x40, 0x40, 0x40, 0x3f}, // U
    {0x00, 0x0f, 0x10, 0x20, 0x40, 0x20, 0x10, 0x0f}, // V
    {0x00, 0x3f, 0x40, 0x40, 0x3f, 0x40, 0x40, 0x3f}, // W
    {0x00, 0x63, 0x14, 0x08, 0x08, 0x08, 0x14, 0x63}, // X
    {0x00, 0x07, 0x08, 0x08, 0x78, 0x08, 0x08, 0x07}, // Y
    {0x00, 0x71, 0x49, 0x49, 0x49, 0x49, 0x49, 0x47}, // Z
};
#endif //end of wide

#ifdef NOKIA5110_FONT_Thick

// ASCII font file : Thick Font 7 by 8 
// Define the ASCII table as Data array
// cols left to right 0x00 is  off 0xFF is all on
// Each character is 7 bytes wide one byte height. 
// so ! is 0x5f,0x5f,0x00,0x00,0x00,0x00,0x00,0x00 , 
// Also the code adds two blank lines on LHS and RHS side 
// Each character is in a 9 by 8 bit pixel box.

const unsigned char FontThick[59][7] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}, //  
    {0x5f, 0x5f, 0x00, 0x00, 0x00, 0x00, 0x00}, // !
    {0x07, 0x07, 0x00, 0x07, 0x07, 0x00, 0x00}, // "
    {0x14, 0x7f, 0x7f, 0x14, 0x7f, 0x7f, 0x14}, // #
    {0x6f, 0x6f, 0x6b, 0xeb, 0x6b, 0x7b, 0x7b}, // $
    {0x63, 0x73, 0x38, 0x1c, 0x0e, 0x67, 0x63}, // %
    {0x7f, 0x7f, 0x6b, 0x63, 0x68, 0x78, 0x78}, // &
    {0x07, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00}, // '
    {0xff, 0xff, 0x80, 0x00, 0x00, 0x00, 0x00}, // (
    {0x80, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00}, // )
    {0x36, 0x08, 0x7f, 0x7f, 0x7f, 0x08, 0x36}, // *
    {0x08, 0x08, 0x3e, 0x08, 0x08, 0x00, 0x00}, // +
    {0xe0, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00}, // ,
    {0x08, 0x08, 0x08, 0x08, 0x08, 0x00, 0x00}, // -
    {0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00}, // .
    {0x70, 0x1c, 0x07, 0x00, 0x00, 0x00, 0x00}, // /
    {0x7f, 0x7f, 0x63, 0x63, 0x63, 0x7f, 0x7f}, // 0
    {0x60, 0x66, 0x66, 0x7f, 0x7f, 0x60, 0x60}, // 1
    {0x7b, 0x7b, 0x6b, 0x6b, 0x6b, 0x6f, 0x6f}, // 2
    {0x63, 0x63, 0x6b, 0x6b, 0x6b, 0x7f, 0x7f}, // 3
    {0x1f, 0x1f, 0x18, 0x18, 0x18, 0x7e, 0x7e}, // 4
    {0x6f, 0x6f, 0x6b, 0x6b, 0x6b, 0x7b, 0x7b}, // 5
    {0x7f, 0x7f, 0x6c, 0x6c, 0x6c, 0x7c, 0x7c}, // 6
    {0x43, 0x63, 0x73, 0x3b, 0x1f, 0x0f, 0x07}, // 7
    {0x7f, 0x7f, 0x6b, 0x6b, 0x6b, 0x7f, 0x7f}, // 8
    {0x1f, 0x1f, 0x1b, 0x1b, 0x1b, 0x7f, 0x7f}, // 9
    {0x6c, 0x6c, 0x00, 0x00, 0x00, 0x00, 0x00}, // :
    {0xec, 0xec, 0x00, 0x00, 0x00, 0x00, 0x00}, // ;
    {0x08, 0x14, 0x22, 0x22, 0x00, 0x00, 0x00}, // <
    {0x14, 0x14, 0x14, 0x14, 0x14, 0x00, 0x00}, // =
    {0x22, 0x22, 0x14, 0x08, 0x00, 0x00, 0x00}, // >
    {0x03, 0x03, 0x5b, 0x5b, 0x0b, 0x0f, 0x0f}, // ?
    {0x7f, 0x7f, 0x63, 0x6f, 0x6b, 0x6f, 0x6f}, // @
    {0x7f, 0x7f, 0x1b, 0x1b, 0x1b, 0x7f, 0x7f}, // A
    {0x7f, 0x7f, 0x6b, 0x6b, 0x6f, 0x7e, 0x7c}, // B
    {0x7f, 0x7f, 0x63, 0x63, 0x63, 0x63, 0x63}, // C
    {0x7f, 0x7f, 0x63, 0x63, 0x67, 0x7e, 0x7c}, // D
    {0x7f, 0x7f, 0x6b, 0x6b, 0x6b, 0x6b, 0x6b}, // E
    {0x7f, 0x7f, 0x0b, 0x0b, 0x0b, 0x03, 0x03}, // F
    {0x7f, 0x7f, 0x63, 0x63, 0x6b, 0x7b, 0x7b}, // G
    {0x7f, 0x7f, 0x18, 0x18, 0x18, 0x7f, 0x7f}, // H
    {0x63, 0x63, 0x7f, 0x7f, 0x63, 0x63, 0x63}, // I
    {0x60, 0x60, 0x60, 0x60, 0x60, 0x7f, 0x3f}, // J
    {0x7f, 0x7f, 0x18, 0x18, 0x1e, 0x7f, 0x79}, // K
    {0x7f, 0x7f, 0x60, 0x60, 0x60, 0x60, 0x60}, // L
    {0x7f, 0x7f, 0x03, 0x06, 0x03, 0x7f, 0x7f}, // M
    {0x7f, 0x7f, 0x0e, 0x1c, 0x38, 0x7f, 0x7f}, // N
    {0x7f, 0x7f, 0x63, 0x63, 0x63, 0x7f, 0x7f}, // O
    {0x7f, 0x7f, 0x1b, 0x1b, 0x1b, 0x1f, 0x1f}, // P
    {0x7f, 0x7f, 0x63, 0xf3, 0xf3, 0x7f, 0x7f}, // Q
    {0x7f, 0x7f, 0x1b, 0x3b, 0x7b, 0x7f, 0x5f}, // R
    {0x6f, 0x6f, 0x6b, 0x6b, 0x6b, 0x7b, 0x7b}, // S
    {0x03, 0x03, 0x7f, 0x7f, 0x03, 0x03, 0x03}, // T
    {0x7f, 0x7f, 0x60, 0x60, 0x60, 0x7f, 0x7f}, // U
    {0x1f, 0x3f, 0x70, 0x60, 0x70, 0x3f, 0x1f}, // V
    {0x3f, 0x7f, 0x60, 0x30, 0x60, 0x7f, 0x3f}, // W
    {0x77, 0x7f, 0x1c, 0x08, 0x1c, 0x7f, 0x77}, // X
    {0x07, 0x0f, 0x7c, 0x78, 0x7c, 0x0f, 0x07}, // Y
    {0x73, 0x7b, 0x6b, 0x6b, 0x6b, 0x6f, 0x67}, // Z
};

#endif


#ifdef NOKIA5110_FONT_Large
// ASCII font file : "large" 12 by 16 
// Define the ASCII table as Data array
// cols left to right, 0x00 is off, 0xFF is all on
// Each character is 12 bits wide, two byte height.
// NO LOWERCASE LETTERS

const  uint16_t FontLarge[59][12] = {
    {0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000}, //
    {0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x39FE, 0x39FE, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000}, // !
    {0x0000, 0x0000, 0x0000, 0x00FC, 0x00FC, 0x0000, 0x0000, 0x00FC, 0x00FC, 0x0000, 0x0000, 0x0000}, // "
    {0x0000, 0x0000, 0x0810, 0x0810, 0x7FFE, 0x0810, 0x0810, 0x7FFE, 0x0810, 0x0810, 0x0000, 0x0000}, // #
    {0x0000, 0x0000, 0x0000, 0x3070, 0x18D8, 0x3FFE, 0x1B0C, 0x0618, 0x0030, 0x0000, 0x0000, 0x0000}, // $
    {0x0000, 0x3000, 0x1800, 0x0C3E, 0x0622, 0x033E, 0x0180, 0x00C0, 0x3E60, 0x2230, 0x3E18, 0x0000}, // %
    {0X0000, 0x007f, 0x007f, 0x006b, 0x0063, 0x0068, 0x0078, 0x0078, 0x0000, 0x0000, 0x0000, 0X0000}, // &
    {0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x003F, 0x003F, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000}, // '
    {0x0000, 0x0000, 0x1FFC, 0x3FFE, 0x2002, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000}, // (
    {0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x2002, 0x3FFE, 0x1FFC, 0x0000, 0x0000}, // )
    {0x0000, 0x18C6, 0x0CCC, 0x06D8, 0x03F0, 0x7FFE, 0x7FFE, 0x03F0, 0x06D8, 0x0CCC, 0x18C6, 0x0000}, // *
    {0x0000, 0x0380, 0x0380, 0x0380, 0x7FFE, 0x7FFE, 0x7FFE, 0x0380, 0x0380, 0x0380, 0x0000, 0x0000}, // +
    {0x0000, 0x0000, 0x0000, 0x4000, 0x6000, 0x7E00, 0x7F00, 0x0380, 0x0000, 0x0000, 0x0000, 0x0000}, // ,
    {0x0000, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x03C0, 0x0000}, // -
    {0x0000, 0x0000, 0x0000, 0x7F00, 0x7F00, 0x7F00, 0x7F00, 0x7F00, 0x0000, 0x0000, 0x0000, 0x0000}, // .
    {0x0000, 0x7000, 0x3800, 0x1C00, 0x0E00, 0x0700, 0x0380, 0x01C0, 0x00E0, 0x0070, 0x0038, 0x0000}, // /
    {0x0000, 0x0000, 0x3FFF, 0x3FFF, 0x3103, 0x3083, 0x3043, 0x3023, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 0
    {0x0000, 0x0000, 0x000C, 0x000C, 0x3006, 0x3006, 0x3FFF, 0x3FFF, 0x3FFF, 0x3000, 0x3000, 0x0000}, // 1
    {0x0000, 0x0000, 0x0000, 0x3FC3, 0x3FC3, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x30FF, 0x30FF, 0x0000}, // 2
    {0x0000, 0x0000, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 3
    {0x0000, 0x0000, 0x00FF, 0x00FF, 0x00C0, 0x00C0, 0x00C0, 0x00C0, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 4
    {0x0000, 0x0000, 0x30FF, 0x30FF, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x3FC3, 0x3FC3, 0x0000, 0x0000}, // 5
    {0x0000, 0x0000, 0x3FFF, 0x3FFF, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x3FC3, 0x3FC3, 0x0000, 0x0000}, // 6
    {0x0000, 0x0000, 0x0003, 0x0003, 0x0003, 0x0003, 0x0003, 0x0003, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 7
    {0x0000, 0x0000, 0x3FFF, 0x3FFF, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 8
    {0x0000, 0x0000, 0x30FF, 0x30FF, 0x30C3, 0x30C3, 0x30C3, 0x30C3, 0x3FFF, 0x3FFF, 0x0000, 0x0000}, // 9
    {0x0000, 0x0000, 0x0000, 0x0000, 0x3E3E, 0x3E3E, 0x3E3E, 0x3E3E, 0x0000, 0x0000, 0x0000, 0x0000}, // :
    {0x0000, 0x0000, 0x0000, 0x3000, 0x1E3E, 0x0E3E, 0x063E, 0x023E, 0x0000, 0x0000, 0x0000, 0x0000}, // ;
    {0x0180, 0x0660, 0x0C30, 0x1818, 0x300C, 0x6006, 0x4002, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000}, // <
    {0x0000, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0198, 0x0000}, // =
    {0x0000, 0x0000, 0x0000, 0x0000, 0x6006, 0x6006, 0x300C, 0x1818, 0x0C30, 0x0660, 0x0180, 0x0000}, // >
    {0x0000, 0x0018, 0x0018, 0x000C, 0x0006, 0x6706, 0x6706, 0x07FE, 0x00FE, 0x0000, 0x0000, 0x0000}, // ?
    {0x0000, 0x1F00, 0x3FF0, 0x307C, 0x27CE, 0x26C6, 0x06C6, 0x06C6, 0x0606, 0x07FE, 0x07FE, 0x0000}, // @
    {0x0000, 0x3FFE, 0x3FFF, 0x3FFF, 0x01C3, 0x01C3, 0x01C3, 0x01C3, 0x3FFF, 0x3FFF, 0x3FFE, 0x0000}, // A
    {0x0000, 0x2002, 0x3003, 0x3003, 0x3FFF, 0x3FFF, 0x30C3, 0x30C3, 0x3FFF, 0x3FFF, 0x3FFE, 0x0000}, // B
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3807, 0x3807, 0x3807, 0x3807, 0x3807, 0x3003, 0x0000, 0x0000}, // C
    {0x0000, 0x1806, 0x3807, 0x3807, 0x3FFF, 0x3FFF, 0x3807, 0x3807, 0x3FFF, 0x3FFF, 0x3FFF, 0x0000}, // D
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x38C7, 0x38C7, 0x38C7, 0x38C7, 0x3807, 0x3003, 0x0000, 0x0000}, // E
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x01C7, 0x00C7, 0x00C7, 0x00C7, 0x0047, 0x0003, 0x0000, 0x0000}, // F
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3807, 0x3807, 0x3987, 0x3987, 0x3987, 0x3F87, 0x1F03, 0x0000}, // G
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x00E0, 0x00E0, 0x00E0, 0x00E0, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // H
    {0x0000, 0x1806, 0x3807, 0x3807, 0x3807, 0x3FFF, 0x3FFF, 0x3807, 0x3807, 0x3807, 0x1806, 0x0000}, // I
    {0x0000, 0x1FC0, 0x3FC0, 0x3C00, 0x3800, 0x3800, 0x3800, 0x3800, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // J
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x01C0, 0x01C0, 0x01E0, 0x0330, 0x0618, 0x0C0C, 0x1806, 0x0000}, // K
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3C00, 0x3800, 0x3800, 0x3800, 0x3800, 0x3800, 0x3800, 0x3000}, // L
    {0x0000, 0x1FFE, 0x3FFF, 0x1FFF, 0x000E, 0x0078, 0x0078, 0x000E, 0x1FFF, 0x3FFF, 0x1FFE, 0x0000}, // M
    {0x0000, 0x1FFE, 0x3FFF, 0x1FFF, 0x003E, 0x00F0, 0x03C0, 0x0780, 0x1FFF, 0x3FFF, 0x1FFE, 0x0000}, // N
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3C0F, 0x3807, 0x3807, 0x3C0F, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // O
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x01C7, 0x00C7, 0x00C7, 0x00C7, 0x00FF, 0x00FF, 0x00FE, 0x0000}, // P
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3C0F, 0x3987, 0x3B07, 0x3E0F, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // Q
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x03C7, 0x06C7, 0x0CC7, 0x18C7, 0x30FF, 0x007E, 0x0000, 0x0000}, // R
    {0x0000, 0x187E, 0x38FF, 0x38FF, 0x38C7, 0x38C7, 0x38C7, 0x3FC7, 0x3FC7, 0x1FC6, 0x0000, 0x0000}, // S
    {0x0000, 0x0003, 0x0007, 0x0007, 0x0007, 0x1FFF, 0x1FFF, 0x0007, 0x0007, 0x0007, 0x0003, 0x0000}, // T
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x3C00, 0x3800, 0x3800, 0x3C00, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // U
    {0x0000, 0x000F, 0x003F, 0x01FC, 0x03C0, 0x1E00, 0x1E00, 0x0FC0, 0x01FC, 0x003F, 0x000F, 0x0000}, // V
    {0x0000, 0x1FFE, 0x3FFF, 0x3FFF, 0x1E00, 0x07C0, 0x07C0, 0x1E00, 0x3FFF, 0x3FFF, 0x1FFE, 0x0000}, // W
    {0x0000, 0x0E07, 0x070E, 0x039C, 0x01F8, 0x01F0, 0x01F0, 0x01DC, 0x038E, 0x0707, 0x0E03, 0x0000}, // X
    {0x0000, 0x007E, 0x20FF, 0x30FF, 0x30E0, 0x30C0, 0x30C0, 0x30E0, 0x3FFE, 0x3FFF, 0x1FFE, 0x0000}, // Y
    {0x0000, 0x1C06, 0x3E07, 0x3F07, 0x3B87, 0x39C7, 0x38E7, 0x3877, 0x383F, 0x381F, 0x180E, 0x0000} // Z
};
#endif //end of wide




//__ASM("EXPORT NOKIA_5110");

//export NOKIA_5110 ;
//extern 		void DELAY50(void);
//extern 		void NOT_READY(void);
//extern 		void WRITE_CHAR(void);
//extern 		void FIFO_FULL(void);
//extern 		void CAL_MEMORY(void);
//extern 		void SCREEN_MAP(void);
//extern 		void SET_XY(void);

static unsigned int i = 0;
static unsigned int j = 0;

int main (void){
	PORTA_SSI0_INIT();
	N5110_INIT();
	//
	//

	for (  i =0;  i < 504;i++ ){
//	*(ahmet+i) = NOKIA_DICK[i];
	*(ahmet+i) = 0;
	}
	*(ahmet)=0;
	
	for (  i =0;  i < 59;i++ ){
		for ( j =0;  j < 7;j++ ){
		*(font_adress+i*7+j) = FontThick[i][j];
		}
	}
	
//	for (  i =0;  i < (0+8);i++ ){
//	*(ahmet+i+32) = FontWide[24][i];
//	}
	
	
	//LOSER_ROM();
	//SCREEN_ROM();
	/*
	for (  i =0;  i < (0+12);i++ ){
	*(ahmet+i+84) = FontLarge[25][i]/256;
	*(ahmet+i) = FontLarge[25][i]%256;
	
	}*/
	
	AnnounceResult();

	
	while(1){
	}
}