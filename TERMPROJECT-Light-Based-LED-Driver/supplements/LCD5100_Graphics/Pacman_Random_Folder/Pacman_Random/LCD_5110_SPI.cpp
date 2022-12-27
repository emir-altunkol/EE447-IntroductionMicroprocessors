
// Modified to add Graphics by R.B.Owen (2016)
// Fuctions marked ***RBO*** by R.B.Owen
// Functions marked ***CH*** by Clarence Ho
// Functions marked ***HK*** adapted from LCD5110_Graph.cpp
// LCD5110_Graph.cpp - Arduino/chipKit library support for Nokia 5110 compatible LCDs
// Copyright (C)2015 Rinky-Dink Electronics, Henning Karlsen. All right reserved 
// Basic functionality of this library are based on the demo-code provided by
// http://www.RinkyDinkElectronics.com/



// Modified by Clarence Ho (2015)
// + Added setContrast as discussed on http://forum.43oh.com/topic/2876-energia-library-nokia-5110-lcd-boosterpackbreakout-pcb/
//
//  LCD_5110_SPI.cpp
//  Library C++ code
//  ----------------------------------
//  Developed with embedXcode
//
//  Project LCD 5110
//  Created by Rei VILO on Jan 12, 2013
//  Copyright (c) 2012 http://embeddedcomputing.weebly.com
//  Licence CC = BY SA NC
//

#include "LCD_5110_SPI.h"

const uint8_t  _commandLCD = 0x00;
const uint8_t  _dataLCD    = 0x01;
byte ss[504];

// 2015-02-07 Rei Vilo
// Pins numbers instead of pins names

LCD_5110_SPI::LCD_5110_SPI() { 
  // ***CH***
  
  LCD_5110_SPI myScreen(PA_7,    // Chip Select
                      PA_2,    // Data/Command
                      PB_5,    // Reset
                      PA_6,    // Backlight - not used in my program
                      PUSH2);  // Push Button 2 - not used in my program

  
  // pins names in MSP430G2553
   /* LCD_5110_SPI(10, // P2_2 Chip Select
                 11, // P2_3 Data/Command
                 2,  // P1_0 Reset
                 9,  // P2_1 Backlight
                 PUSH2);   // Push Button 2
    */             
                 
}




LCD_5110_SPI::LCD_5110_SPI(uint8_t pinChipSelect, uint8_t pinDataCommand, uint8_t pinReset, uint8_t pinBacklight, uint8_t pinPushButton) {
    // ***CH***
  
    _pinChipSelect  = pinChipSelect;
    _pinDataCommand = pinDataCommand;
    //    _pinSerialData  = pinSerialData; //
    //    _pinSerialClock = pinSerialClock; //
    _pinReset       = pinReset;
    _pinBacklight   = pinBacklight;
    _pinPushButton  = pinPushButton;
}

void LCD_5110_SPI::write(uint8_t dataCommand, uint8_t c) {
    // ***CH***
    digitalWrite(_pinDataCommand, dataCommand);
    
    digitalWrite(_pinChipSelect, LOW);
    SPI.transfer((char)c);
    digitalWrite(_pinChipSelect, HIGH);
}

void LCD_5110_SPI::setXY(uint8_t x, uint8_t y) {
    // ***CH*** not used
    write(_commandLCD, 0x40 | y);
    write(_commandLCD, 0x80 | x);
}

void LCD_5110_SPI::begin() {
    // ***CH***
    pinMode(_pinChipSelect, OUTPUT);
    pinMode(_pinReset, OUTPUT);
    pinMode(_pinDataCommand, OUTPUT);
    //  pinMode(_pinSerialData, OUTPUT);
    //  pinMode(_pinSerialClock, OUTPUT);
    pinMode(_pinBacklight, OUTPUT);
    pinMode(_pinPushButton, INPUT_PULLUP);
    
    
    
    digitalWrite(_pinDataCommand, LOW);
    delay(30);
    digitalWrite(_pinReset, LOW);
    delay(100); // as per 8.1 Initialisation
    digitalWrite(_pinReset, HIGH);
    
    write(_commandLCD, 0x21); // chip is active, horizontal addressing, use extended instruction set
    write(_commandLCD, 0xc8); // write VOP to register: 0xC8 for 3V — try other values
    write(_commandLCD, 0x12); // set Bias System 1:48
    write(_commandLCD, 0x20); // chip is active, horizontal addressing, use basic instruction set
    write(_commandLCD, 0x09); // temperature control
    write(_commandLCD, 0x0c); // normal mode
    delay(10);
    
    clear();
    _font = 0;
    setBacklight(false);
}

String LCD_5110_SPI::WhoAmI() {
    // ***CH***
    return "LCD Nokia 5110";
}

void LCD_5110_SPI::clear() {
    // ***CH***
    setXY(0, 0);
    for (uint16_t i=0; i<6*84; i++){
      write(_dataLCD, 0x00);
      ss[i]=0;
    }
    setXY(0, 0);
}


void LCD_5110_SPI::copyToScreen() {
    // ***RBO***
    // setXY(0, 0);
    for (uint16_t i=0; i<6*84; i++){
      write(_dataLCD, ss[i]);
    }
    // setXY(0, 0);
}


void LCD_5110_SPI::setBacklight(boolean b) {
    // ***CH***
    digitalWrite(_pinBacklight, b ? LOW : HIGH);
}

void LCD_5110_SPI::setFont(uint8_t font) {
    // ***CH***
    _font = font;
}




void LCD_5110_SPI::clearBuffer() {
    // ***RBO***
    for (uint16_t i=0; i<6*84; i++){
      ss[i]=0;
    }
}



void LCD_5110_SPI::clearBitmap(uint8_t x, uint8_t y, const unsigned char arr[], int w, int length) {
// ***RBO***
// Clear only those pixels set in bitmap  
   int i;
   int j;
   int h=8*length/w;
   int x1=x;
   int x2=x+w;
   int y1=y;
   int y2=y+h;
   int by1;
   int by2;
   int bi;
   int v;
   
   int bt_x=0;
   int bt_y=0;
   int bt_my;
   int bt_ky;
   int bt_ind;
   int bt_b;
   int bt_r;
       
    for (i=y1; i<y2; i++) {
       bt_y = i - y1;  // y-coord inside bitmap
       bt_my = bt_y/8;
       bt_ky = bt_y%8;     
      bi=i % 8;
      by1=((i/8)*84);
      for (j=x1; j<x2; j++){
          bt_x = j - x1; // x-coord inside bitmap
          bt_ind = bt_my*w + bt_x;
          bt_b = arr[bt_ind]>>bt_ky;
          bt_r = bt_b & 1;  // value of pixel at bt_x, bt_y inside bitmap
        by2=by1+j;      
        v=ss[by2] & (1<<bi);
        if(bt_r>0){
           ss[by2]=ss[by2] & ~(1<<bi);
         }
      }		
   }    
}


              
void LCD_5110_SPI::drawBitmap(uint8_t x, uint8_t y, const unsigned char arr[], int w, int length) {
  // ***RBO***
    // w is the width of the bitmap 
    // length = total number of bytes in bitmap definition
  
    int i;
    int xp;
    int yp=y;
    byte b;
    
    for (i=0; i<length; i++) {
       b=arr[i];
       xp=x+i%w;
       drawByte(b,xp,yp);
       if((i+1)%w==0){
          yp=yp+8; 
       }    
    }   
}





void LCD_5110_SPI::text(uint8_t x, uint8_t y, String s) {
// ***RBO adapted from CH***
// Print text at x, y (Graphics co-ordinates)
// x>=0 x<84
// y>=0 y<48  k=y/8  m=y%8
// i.e. co-ordinates ar the same as for every other graphic.

// (Original used co-ordinates 0<=x<=14 and 0<=y<=5
// for printing text only)
  
    uint8_t i;
    uint8_t j;
    int k;
    int m;
    int n;
    int maxi;
    
    
    
    if (_font==2) {
        k=y/8;
        m=y%8;
        if(m==0){
           // setXY(x, k);
           for (j=0; j<s.length(); j++) {
              n=k*84+j*4+x;
              for (i=0; i<3; i++){ 
                maxi=x+j*4+i;
                byte b=(Terminal3x5[s.charAt(j)-' '][i]);
                if(maxi<=83){
                  ss[n+i]= b|ss[n+i];
                }
              }
              if(maxi+1<=83){
                ss[n+3]=0x00|ss[n+3];
              }
           }
        }
        else{
          // setXY(x, k);
           for (j=0; j<s.length(); j++) {
             n=k*84+j*4+x;
              for (i=0; i<3; i++){
                maxi=x+j*4+i;
                byte b=(Terminal3x5[s.charAt(j)-' '][i])<<m %0xFF;
                if(maxi<=83){
                  ss[n+i]=b|ss[n+i];
                }
              }
              if(maxi+1<=83){
                ss[n+3]=0x00|ss[n+3];
              }
           }
          // setXY(x, k+1);
           k=k+1;
           for (j=0; j<s.length(); j++) {
              n=k*84+j*4+x;
              for (i=0; i<3; i++){ 
                maxi=x+j*4+i;
                byte b=(Terminal3x5[s.charAt(j)-' '][i])>>(8-m);
                if(maxi<=83){
                  ss[n+i]=b|ss[n+i]; 
                }
              }
              if(maxi+1<=83){
                ss[n+3]=0x00|ss[n+3];
              }
           }
          
        }
    }
    
    
    else if (_font==0) {
        k=y/8;
        m=y%8;
        if(m==0){
           // setXY(x, k);
           for (j=0; j<s.length(); j++) {
              n=k*84+j*6+x;
              for (i=0; i<5; i++){ 
                maxi=x+j*6+i;
                byte b=(Terminal6x8[s.charAt(j)-' '][i]);
                if(maxi<=83){
                  ss[n+i]= b|ss[n+i];
                }
              }
              if(maxi+1<=83){
                ss[n+5]=0x00|ss[n+5];
              }
           }
        }
        else{
          // setXY(x, k);
           for (j=0; j<s.length(); j++) {
             n=k*84+j*6+x;
              for (i=0; i<5; i++){
                maxi=x+j*6+i;
                byte b=(Terminal6x8[s.charAt(j)-' '][i])<<m %0xFF;
                if(maxi<=83){
                  ss[n+i]=b|ss[n+i];
                }
              }
              if(maxi+1<=83){
                ss[n+5]=0x00|ss[n+5];
              }
           }
          // setXY(x, k+1);
           k=k+1;
           for (j=0; j<s.length(); j++) {
              n=k*84+j*6+x;
              for (i=0; i<5; i++){ 
                maxi=x+j*6+i;
                byte b=(Terminal6x8[s.charAt(j)-' '][i])>>(8-m);
                if(maxi<=83){
                  ss[n+i]=b|ss[n+i]; 
                }
              }
              if(maxi+1<=83){
                ss[n+5]=0x00|ss[n+5];
              }
           }
          
        }
    }
    else if (_font==1) {
        k=y/8;
        m=y%8;
        if(m==0){
          
          
            for (j=0; j<s.length(); j++) {
               int n=k*84+j*12+x;
               for (i=0; i<11; i++) {
                 maxi=x+j*12+i;
                 byte b=Terminal11x16[s.charAt(j)-' '][2*i];  
                 if(maxi<=83){              
                   ss[n+i]= b|ss[n+i];
                 }
               }
               if(maxi+1<=83){
                 ss[n+11]=0x00|ss[n+11];
               }
            }
        
        
           // setXY(6*x, y+1);
           k=k+1;
           for (j=0; j<s.length(); j++) {
               int n=k*84+j*12+x;
               for (i=0; i<11; i++) {
                  maxi=x+j*12+i;
                  byte b=Terminal11x16[s.charAt(j)-' '][2*i+1];
                  if(maxi<=83){               
                   ss[n+i]= b|ss[n+i];
                  }
               }
               if(maxi+1<=83){
                 ss[n+11]=0x00|ss[n+11];
               }
           } 
    
    
           
        }
        else{
          
           for (j=0; j<s.length(); j++) {
               int n=k*84+j*12+x;
               for (i=0; i<11; i++) {
                 maxi=x+j*12+i;
                 byte b=(Terminal11x16[s.charAt(j)-' '][2*i])<<m %0xFF;
                 if(maxi<=83){                
                   ss[n+i]= b|ss[n+i];
                 }
               }
               if(maxi+1<=83){
                 s[n+11]=0x00|ss[n+11];
               }
            }
            
            k=k+1;
            for (j=0; j<s.length(); j++) {
               int n=k*84+j*12+x;
               for (i=0; i<11; i++) {
                 maxi=x+j*12+i;
                 byte b1=(Terminal11x16[s.charAt(j)-' '][2*i])>>(8-m);
                 byte b2=(Terminal11x16[s.charAt(j)-' '][2*i+1])<<m %0xFF; 
                 byte b=b1|b2;
                 if(maxi<=83){               
                   ss[n+i]= b|ss[n+i];
                 }
               }
               if(maxi+1<=83){
                 ss[n+11]=0x00|ss[n+11];
               }
            }
            
            k=k+1;
            for (j=0; j<s.length(); j++) {
               int n=k*84+j*12+x;
               for (i=0; i<11; i++) {
                 maxi=x+j*12+i;
                 byte b=(Terminal11x16[s.charAt(j)-' '][2*i+1])>>(8-m);
                 if(maxi<=83){                
                   ss[n+i]= b|ss[n+i];
                 }
               }
               if(maxi+1<=83){
                 ss[n+11]=0x00|ss[n+11];
               }
            }
          
          
        }
    }
}


void LCD_5110_SPI::drawByte(byte b, uint8_t x, uint8_t y) {
// ***RBO*** 
// Print byte at x, y (Graphics co-ordinates)
// x>=0 x<84
// y>=0 y<48  k=y/8  m=y%8 


    int k;
    int m;
    int n;
    byte nb1;
    byte nb2;
    
        k=y/8;
        m=y%8;
        if(m==0){        
          n=k*84+x;
          ss[n]= b|ss[n];
        }
        else{        
          n=k*84+x;
          nb1=b<<m %0xFF; 
          ss[n]=nb1|ss[n];
          k=k+1;
          n=k*84+x;
          nb2=b>>(8-m);
          ss[n]=nb2|ss[n];       
        }
}







void LCD_5110_SPI::setPixel(uint16_t x, uint16_t y)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		by=((y/8)*84)+x;
		bi=y % 8;

		ss[by]=ss[by] | (1<<bi);
	}
}

int LCD_5110_SPI::readPixel(uint16_t x, uint16_t y)
// ***RBO***
{
	int by, bi;
        byte tss = 0;
        int tssb = 0;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		by=((y/8)*84)+x;
		bi=y % 8;

		tss=ss[by] & (1<<bi);
                tssb = tss>>bi;
	}
        return tssb;
}

void LCD_5110_SPI::clearPixel(uint16_t x, uint16_t y)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		by=((y/8)*84)+x;
		bi=y % 8;

		ss[by]=ss[by] & ~(1<<bi);
	}
}

void LCD_5110_SPI::invertPixel(uint16_t x, uint16_t y)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		by=((y/8)*84)+x;
		bi=y % 8;

		if ((ss[by] & (1<<bi))==0)
			ss[by]=ss[by] | (1<<bi);
		else
			ss[by]=ss[by] & ~(1<<bi);
	}
}



void LCD_5110_SPI::drawHLine(int x, int y, int l)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		for (int cx=0; cx<l; cx++)
		{
			by=((y/8)*84)+x;
			bi=y % 8;

			ss[by+cx] |= (1<<bi);
		}
	}
}

void LCD_5110_SPI::clearHLine(int x, int y, int l)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		for (int cx=0; cx<l; cx++)
		{
			by=((y/8)*84)+x;
			bi=y % 8;

			ss[by+cx] &= ~(1<<bi);
		}
	}
}

void LCD_5110_SPI::drawVLine(int x, int y, int l)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		for (int cy=0; cy<l; cy++)
		{
			setPixel(x, y+cy);
		}
	}
}

void LCD_5110_SPI::clearVLine(int x, int y, int l)
// ***HK***
{
	int by, bi;

	if ((x>=0) and (x<84) and (y>=0) and (y<48))
	{
		for (int cy=0; cy<l; cy++)
		{
			clearPixel(x, y+cy);
		}
	}
}

void LCD_5110_SPI::drawLine(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;
	double delta, tx, ty;
	double m, b, dx, dy;
	
	if (((x2-x1)<0))
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
    if (((y2-y1)<0))
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
		tmp=y1;
		y1=y2;
		y2=tmp;
	}

	if (y1==y2)
	{
		if (x1>x2)
		{
			tmp=x1;
			x1=x2;
			x2=tmp;
		}
		drawHLine(x1, y1, x2-x1);
	}
	else if (x1==x2)
	{
		if (y1>y2)
		{
			tmp=y1;
			y1=y2;
			y2=tmp;
		}
		drawVLine(x1, y1, y2-y1);
	}
	else if (abs(x2-x1)>abs(y2-y1))
	{
		delta=(double(y2-y1)/double(x2-x1));
		ty=double(y1);
		if (x1>x2)
		{
			for (int i=x1; i>=x2; i--)
			{
				setPixel(i, int(ty+0.5));
        		ty=ty-delta;
			}
		}
		else
		{
			for (int i=x1; i<=x2; i++)
			{
				setPixel(i, int(ty+0.5));
        		ty=ty+delta;
			}
		}
	}
	else
	{
		delta=(float(x2-x1)/float(y2-y1));
		tx=float(x1);
        if (y1>y2)
        {
			for (int i=y2+1; i>y1; i--)
			{
		 		setPixel(int(tx+0.5), i);
        		tx=tx+delta;
			}
        }
        else
        {
			for (int i=y1; i<y2+1; i++)
			{
		 		setPixel(int(tx+0.5), i);
        		tx=tx+delta;
			}
        }
	}

}

void LCD_5110_SPI::clearLine(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;
	double delta, tx, ty;
	double m, b, dx, dy;
	
	if (((x2-x1)<0))
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
    if (((y2-y1)<0))
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
		tmp=y1;
		y1=y2;
		y2=tmp;
	}

	if (y1==y2)
	{
		if (x1>x2)
		{
			tmp=x1;
			x1=x2;
			x2=tmp;
		}
		clearHLine(x1, y1, x2-x1);
	}
	else if (x1==x2)
	{
		if (y1>y2)
		{
			tmp=y1;
			y1=y2;
			y2=tmp;
		}
		clearVLine(x1, y1, y2-y1);
	}
	else if (abs(x2-x1)>abs(y2-y1))
	{
		delta=(double(y2-y1)/double(x2-x1));
		ty=double(y1);
		if (x1>x2)
		{
			for (int i=x1; i>=x2; i--)
			{
				clearPixel(i, int(ty+0.5));
        		ty=ty-delta;
			}
		}
		else
		{
			for (int i=x1; i<=x2; i++)
			{
				clearPixel(i, int(ty+0.5));
        		ty=ty+delta;
			}
		}
	}
	else
	{
		delta=(float(x2-x1)/float(y2-y1));
		tx=float(x1);
        if (y1>y2)
        {
			for (int i=y2+1; i>y1; i--)
			{
		 		clearPixel(int(tx+0.5), i);
        		tx=tx+delta;
			}
        }
        else
        {
			for (int i=y1; i<y2+1; i++)
			{
		 		clearPixel(int(tx+0.5), i);
        		tx=tx+delta;
			}
        }
	}

}

void LCD_5110_SPI::drawRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}

	drawHLine(x1, y1, x2-x1);
	drawHLine(x1, y2, x2-x1);
	drawVLine(x1, y1, y2-y1);
	drawVLine(x2, y1, y2-y1+1);
}

void LCD_5110_SPI::clearRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}

	clearHLine(x1, y1, x2-x1);
	clearHLine(x1, y2, x2-x1);
	clearVLine(x1, y1, y2-y1);
	clearVLine(x2, y1, y2-y1+1);
}


void LCD_5110_SPI::drawFilledRectangle(int x1, int y1, int x2, int y2) {
// ***HK***
// Fill in all pixels in the rectangular area from x1,y1 to x2,y2
  
    int i;
    int sx=x2-x1;
    int tmp;
   
    if (x1>x2){
      tmp=x1;
      x1=x2;
      x2=tmp;
    }
    if (y1>y2){
      tmp=y1;
      y1=y2;
      y2=tmp;
    }
    
    for (i=y1; i<y2; i++) {
      drawHLine(x1, i, sx);
    }    
}

void LCD_5110_SPI::clearFilledRectangle(int x1, int y1, int x2, int y2) {
// ***HK***
// Clear all pixels in the rectangular area from x1,y1 to x2,y2
  
    int i;
    int sx=x2-x1;
        int tmp;
   
    if (x1>x2){
      tmp=x1;
      x1=x2;
      x2=tmp;
    }
    if (y1>y2){
      tmp=y1;
      y1=y2;
      y2=tmp;
    }
    
    for (i=y1; i<y2; i++) {
      clearHLine(x1, i, sx);
    }    
}


void LCD_5110_SPI::drawRoundRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
	if ((x2-x1)>4 && (y2-y1)>4)
	{
		setPixel(x1+1,y1+1);
		setPixel(x2-1,y1+1);
		setPixel(x1+1,y2-1);
		setPixel(x2-1,y2-1);
		drawHLine(x1+2, y1, x2-x1-3);
		drawHLine(x1+2, y2, x2-x1-3);
		drawVLine(x1, y1+2, y2-y1-3);
		drawVLine(x2, y1+2, y2-y1-3);
	}
}

void LCD_5110_SPI::clearRoundRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
	if ((x2-x1)>4 && (y2-y1)>4)
	{
		clearPixel(x1+1,y1+1);
		clearPixel(x2-1,y1+1);
		clearPixel(x1+1,y2-1);
		clearPixel(x2-1,y2-1);
		clearHLine(x1+2, y1, x2-x1-3);
		clearHLine(x1+2, y2, x2-x1-3);
		clearVLine(x1, y1+2, y2-y1-3);
		clearVLine(x2, y1+2, y2-y1-3);
	}
}



void LCD_5110_SPI::drawFilledRoundRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;
        int i;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
	if ((x2-x1)>4 && (y2-y1)>4)
	{
		drawHLine(x1+1,y1+1,x2-1-x1-1);
		drawHLine(x1+1,y2-1,x2-1-x1-1);
		drawHLine(x1+2, y1, x2-x1-3);
		drawHLine(x1+2, y2, x2-x1-3);
                for(i=x1; i<x2; i++){
                  drawVLine(i, y1+2, y2-y1-3);
                }
	}
}


void LCD_5110_SPI::clearFilledRoundRectangle(int x1, int y1, int x2, int y2)
// ***HK***
{
	int tmp;
        int i;

	if (x1>x2)
	{
		tmp=x1;
		x1=x2;
		x2=tmp;
	}
	if (y1>y2)
	{
		tmp=y1;
		y1=y2;
		y2=tmp;
	}
	if ((x2-x1)>4 && (y2-y1)>4)
	{
		clearHLine(x1+1,y1+1,x2-1-x1-1);
		clearHLine(x1+1,y2-1,x2-1-x1-1);
		clearHLine(x1+2, y1, x2-x1-3);
		clearHLine(x1+2, y2, x2-x1-3);
                for(i=x1; i<x2; i++){
                  clearVLine(i, y1+2, y2-y1-3);
                }
	}
}


void LCD_5110_SPI::drawRealCircle(int xCenter, int yCenter, int radius)
// ***RBO***
    {   
       drawEllipse(xCenter, yCenter, radius, radius*0.9); 
    }


void LCD_5110_SPI::drawCirclePoints(int cx, int cy, int x, int y)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

    {
        
        if (x == 0) {
            setPixel(cx, cy + y);
            setPixel(cx, cy - y);
            setPixel(cx + y, cy);
            setPixel(cx - y, cy);
        } else 
        if (x == y) {
            setPixel(cx + x, cy + y);
            setPixel(cx - x, cy + y);
            setPixel(cx + x, cy - y);
            setPixel(cx - x, cy - y);
        } else 
        if (x < y) {
            setPixel(cx + x, cy + y);
            setPixel(cx - x, cy + y);
            setPixel(cx + x, cy - y);
            setPixel(cx - x, cy - y);
            setPixel(cx + y, cy + x);
            setPixel(cx - y, cy + x);
            setPixel(cx + y, cy - x);
            setPixel(cx - y, cy - x);
        }
    }

void LCD_5110_SPI::drawCircle(int xCenter, int yCenter, int radius)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

    {
        int x = 0;
        int y = radius;
        int p = (5 - radius*4)/4;

        drawCirclePoints(xCenter, yCenter, x, y);
        while (x < y) {
            x++;
            if (p < 0) {
                p += 2*x+1;
            } else {
                y--;
                p += 2*(x-y)+1;
            }
            drawCirclePoints(xCenter, yCenter, x, y);
        }
    }
 


void LCD_5110_SPI::drawCircleLines(int cx, int cy, int x, int y)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

    {
        
        if (x == 0) {
            drawLine(cx, cy + y, cx, cy - y);
            // drawLine(cx + y, cy, cx - y, cy);
        } else 
        if (x == y) {
            drawLine(cx + x, cy + y, cx + x, cy - y);
            drawLine(cx - x, cy + y, cx - x, cy - y);
        } else 
        if (x < y) {
            drawLine(cx + x, cy + y, cx + x, cy - y);
            drawLine(cx - x, cy + y, cx - x, cy - y);
            drawLine(cx + y, cy + x, cx + y, cy - x);
            drawLine(cx - y, cy + x, cx - y, cy - x);
        }
    }


void LCD_5110_SPI::drawRealFilledCircle(int xCenter, int yCenter, int radius)
// ***RBO***
    {   
       drawFilledEllipse(xCenter, yCenter, radius, radius*0.9); 
    }

    
void LCD_5110_SPI::drawFilledCircle(int xCenter, int yCenter, int radius)
// ***RBO***

    {
        int x = 0;
        int y = radius;
        int p = (5 - radius*4)/4;

        drawCircleLines(xCenter, yCenter, x, y);
        while (x < y) {
            x++;
            if (p < 0) {
                p += 2*x+1;
            } else {
                y--;
                p += 2*(x-y)+1;
            }
            drawCircleLines(xCenter, yCenter, x, y);
        }
    }


void LCD_5110_SPI::clearCircleLines(int cx, int cy, int x, int y)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

    {
        
        if (x == 0) {
            clearLine(cx, cy + y, cx, cy - y);
            // drawLine(cx + y, cy, cx - y, cy);
        } else 
        if (x == y) {
            clearLine(cx + x, cy + y, cx + x, cy - y);
            clearLine(cx - x, cy + y, cx - x, cy - y);
        } else 
        if (x < y) {
            clearLine(cx + x, cy + y, cx + x, cy - y);
            clearLine(cx - x, cy + y, cx - x, cy - y);
            clearLine(cx + y, cy + x, cx + y, cy - x);
            clearLine(cx - y, cy + x, cx - y, cy - x);
        }
    }

 
void LCD_5110_SPI::clearRealFilledCircle(int xCenter, int yCenter, int radius)
// ***RBO***
    {   
       clearFilledEllipse(xCenter, yCenter, radius, radius*0.9); 
    } 

    
void LCD_5110_SPI::clearFilledCircle(int xCenter, int yCenter, int radius)
// ***RBO***

    {
        int x = 0;
        int y = radius;
        int p = (5 - radius*4)/4;

        clearCircleLines(xCenter, yCenter, x, y);
        while (x < y) {
            x++;
            if (p < 0) {
                p += 2*x+1;
            } else {
                y--;
                p += 2*(x-y)+1;
            }
            clearCircleLines(xCenter, yCenter, x, y);
        }
    }


void LCD_5110_SPI::clearCirclePoints(int cx, int cy, int x, int y)
// ***RBO***
    {
        
        if (x == 0) {
            clearPixel(cx, cy + y);
            clearPixel(cx, cy - y);
            clearPixel(cx + y, cy);
            clearPixel(cx - y, cy);
        } else 
        if (x == y) {
            clearPixel(cx + x, cy + y);
            clearPixel(cx - x, cy + y);
            clearPixel(cx + x, cy - y);
            clearPixel(cx - x, cy - y);
        } else 
        if (x < y) {
            clearPixel(cx + x, cy + y);
            clearPixel(cx - x, cy + y);
            clearPixel(cx + x, cy - y);
            clearPixel(cx - x, cy - y);
            clearPixel(cx + y, cy + x);
            clearPixel(cx - y, cy + x);
            clearPixel(cx + y, cy - x);
            clearPixel(cx - y, cy - x);
        }
    }
    
    
void LCD_5110_SPI::clearRealCircle(int xCenter, int yCenter, int radius)
// ***RBO***
    {   
       clearEllipse(xCenter, yCenter, radius, radius*0.9); 
    }    

void LCD_5110_SPI::clearCircle(int xCenter, int yCenter, int radius)
// ***RBO***
    {
        int x = 0;
        int y = radius;
        int p = (5 - radius*4)/4;

        clearCirclePoints(xCenter, yCenter, x, y);
        while (x < y) {
            x++;
            if (p < 0) {
                p += 2*x+1;
            } else {
                y--;
                p += 2*(x-y)+1;
            }
            clearCirclePoints(xCenter, yCenter, x, y);
        }
    }






void LCD_5110_SPI::drawEllipse(int xCenter, int yCenter, int Rx, int Ry)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

{
  int Rx2 = Rx*Rx;
  int Ry2 = Ry*Ry;
  int twoRx2 = 2*Rx2;
  int twoRy2 = 2*Ry2;
  int p;
  int x = 0;
  int y = Ry;
  int px = 0;
  int py = twoRx2*y;

   /* Plot the first set of points */
  ellipsePlotPoints(xCenter, yCenter, x, y);
  p = (Ry2 - (Rx2*Ry) + (0.25*Rx2))+0.5;

  /* Region 1 */
  while (px < py) {
    x++;
    px += twoRy2;
    if (p < 0){
      p += Ry2 + px;
    }
    else 
    {
      y--;
      py -= twoRx2;
      p += Ry2 + px - py;
    }
    ellipsePlotPoints(xCenter, yCenter, x, y);
   }


  /* Region 2 */
  p = (Ry2*(x+0.5)*(x+0.5) + Rx2*(y-1)*(y-1) - Rx2*Ry2)+0.5;
  while (y > 0) {
    y--;
    py -= twoRx2;
    if (p > 0){
      p += Rx2 - py;
    }
    else {
      x++;
      px += twoRy2;
      p += Rx2 - py + px;
    }
    ellipsePlotPoints(xCenter, yCenter, x, y);
  }
}



void LCD_5110_SPI::ellipsePlotPoints (int xCenter, int yCenter, int x, int y)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1
{
    setPixel (xCenter + x, yCenter + y);
    setPixel (xCenter - x, yCenter + y);
    setPixel (xCenter + x, yCenter - y);
    setPixel (xCenter - x, yCenter - y);
}



void LCD_5110_SPI::drawFilledEllipse(int xCenter, int yCenter, int Rx, int Ry)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

{
  int Rx2 = Rx*Rx;
  int Ry2 = Ry*Ry;
  int twoRx2 = 2*Rx2;
  int twoRy2 = 2*Ry2;
  int p;
  int x = 0;
  int y = Ry;
  int px = 0;
  int py = twoRx2*y;

   /* Plot the first set of points */
  ellipsePlotLines(xCenter, yCenter, x, y);
  p = (Ry2 - (Rx2*Ry) + (0.25*Rx2))+0.5;

  /* Region 1 */
  while (px < py) {
    x++;
    px += twoRy2;
    if (p < 0){
      p += Ry2 + px;
    }
    else 
    {
      y--;
      py -= twoRx2;
      p += Ry2 + px - py;
    }
    ellipsePlotLines(xCenter, yCenter, x, y);
   }


  /* Region 2 */
  p = (Ry2*(x+0.5)*(x+0.5) + Rx2*(y-1)*(y-1) - Rx2*Ry2)+0.5;
  while (y > 0) {
    y--;
    py -= twoRx2;
    if (p > 0){
      p += Rx2 - py;
    }
    else {
      x++;
      px += twoRy2;
      p += Rx2 - py + px;
    }
    ellipsePlotLines(xCenter, yCenter, x, y);
  }
}


void LCD_5110_SPI::ellipsePlotLines (int xCenter, int yCenter, int x, int y)
// ***RBO***
{
    drawLine(xCenter + x, yCenter + y, xCenter + x, yCenter - y);
    drawLine(xCenter - x, yCenter + y, xCenter - x, yCenter - y);
}



void LCD_5110_SPI::clearEllipse(int xCenter, int yCenter, int Rx, int Ry)
// ***RBO***

{
  int Rx2 = Rx*Rx;
  int Ry2 = Ry*Ry;
  int twoRx2 = 2*Rx2;
  int twoRy2 = 2*Ry2;
  int p;
  int x = 0;
  int y = Ry;
  int px = 0;
  int py = twoRx2*y;

   /* Plot the first set of points */
  ellipseClearPoints(xCenter, yCenter, x, y);
  p = (Ry2 - (Rx2*Ry) + (0.25*Rx2))+0.5;

  /* Region 1 */
  while (px < py) {
    x++;
    px += twoRy2;
    if (p < 0){
      p += Ry2 + px;
    }
    else 
    {
      y--;
      py -= twoRx2;
      p += Ry2 + px - py;
    }
    ellipseClearPoints(xCenter, yCenter, x, y);
   }


  /* Region 2 */
  p = (Ry2*(x+0.5)*(x+0.5) + Rx2*(y-1)*(y-1) - Rx2*Ry2)+0.5;
  while (y > 0) {
    y--;
    py -= twoRx2;
    if (p > 0){
      p += Rx2 - py;
    }
    else {
      x++;
      px += twoRy2;
      p += Rx2 - py + px;
    }
    ellipseClearPoints(xCenter, yCenter, x, y);
  }
}



void LCD_5110_SPI::ellipseClearPoints (int xCenter, int yCenter, int x, int y)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1
{
    clearPixel (xCenter + x, yCenter + y);
    clearPixel (xCenter - x, yCenter + y);
    clearPixel (xCenter + x, yCenter - y);
    clearPixel (xCenter - x, yCenter - y);
}





void LCD_5110_SPI::clearFilledEllipse(int xCenter, int yCenter, int Rx, int Ry)
// ***RBO***
// from Computer Graphics by Hearn & Baker
// https://docs.google.com/file/d/0B_YZ665nBRhlYmNiOTU5ZDItMmU2OC00YTVmLThiNmMtMjg3Y2E3ZTgwZDYw/edit?hl=en_US&pref=2&pli=1

{
  int Rx2 = Rx*Rx;
  int Ry2 = Ry*Ry;
  int twoRx2 = 2*Rx2;
  int twoRy2 = 2*Ry2;
  int p;
  int x = 0;
  int y = Ry;
  int px = 0;
  int py = twoRx2*y;

   /* Plot the first set of points */
  ellipseClearLines(xCenter, yCenter, x, y);
  p = (Ry2 - (Rx2*Ry) + (0.25*Rx2))+0.5;

  /* Region 1 */
  while (px < py) {
    x++;
    px += twoRy2;
    if (p < 0){
      p += Ry2 + px;
    }
    else 
    {
      y--;
      py -= twoRx2;
      p += Ry2 + px - py;
    }
    ellipseClearLines(xCenter, yCenter, x, y);
   }


  /* Region 2 */
  p = (Ry2*(x+0.5)*(x+0.5) + Rx2*(y-1)*(y-1) - Rx2*Ry2)+0.5;
  while (y > 0) {
    y--;
    py -= twoRx2;
    if (p > 0){
      p += Rx2 - py;
    }
    else {
      x++;
      px += twoRy2;
      p += Rx2 - py + px;
    }
    ellipseClearLines(xCenter, yCenter, x, y);
  }
}


void LCD_5110_SPI::ellipseClearLines (int xCenter, int yCenter, int x, int y)
// ***RBO***
{
    clearLine(xCenter + x, yCenter + y, xCenter + x, yCenter - y);
    clearLine(xCenter - x, yCenter + y, xCenter - x, yCenter - y);
}


boolean LCD_5110_SPI::getButton() {
  // ***CH***
    if (digitalRead(_pinPushButton)==LOW) {
        while (digitalRead(_pinPushButton)==LOW); // debounce
        return true;
    } else {
        return false;
    }
}

void LCD_5110_SPI::setContrast(uint8_t value) {
  // ***CH***
    if (value > 0x7f) value = 0x7f;

    write(_commandLCD, 0x21);
    write(_commandLCD, 0x80 + value);
    write(_commandLCD, 0x20);
}



