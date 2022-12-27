// By Clarence Ho (2015)
// TM4C123 connected to Nokia 5110 LCD display and DHT11 sensor
//
// Nokia LCD 5110 part based on sample of LCD_5110_SPI library
//
// Wiring (using the third SPI port on TM4C123):
// TM4C123 -  LCD 5110        Comment
// ==================================
// VBUS    -  Vcc             My version of 5110 supports 3v to 5v
// VBUS    -  BL              Backlight
// GND     -  GND
// PB_5    -  RST             Reset 
// PB_4    -  Clk             SCK(2) to Clock
// PB_7    -  Din             MOSI(2) to Serial data in
// PA_7    -  CE              Chip Select
// PA_2    -  DC              Select between data or command


// TM4C123 -  DHT11        Comment
// ==================================
// PD_7    -  Data
// VBUS    -  Vcc
// GND     -  GND

// Core library for code-sense
#if defined(WIRING) // Wiring specific
#include "Wiring.h"
#elif defined(MAPLE_IDE) // Maple specific
#include "WProgram.h"
#elif defined(MPIDE) // chipKIT specific
#include "WProgram.h"
#elif defined(ENERGIA) // LaunchPad, FraunchPad and StellarPad specific
#include "Energia.h"
#elif defined(CORE_TEENSY) // Teensy specific
#include "WProgram.h"
#elif defined(ARDUINO) && (ARDUINO >= 100) // Arduino 1.0 and 1.5 specific
#include "Arduino.h"
#elif defined(ARDUINO) && (ARDUINO < 100) // Arduino 23 specific
#include "WProgram.h"
#else // error
#error Platform not defined
#endif


// Include application, user and local libraries
#include "SPI.h"
#include "LCD_5110_SPI.h"
#include "Graphics.c"
// #include "dht11.h"

LCD_5110_SPI myScreen(PA_7,    // Chip Select
                      PA_2,    // Data/Command
                      PB_5,    // Reset
                      PA_6,    // Backlight - not used in my program
                      PUSH2);  // Push Button 2 - not used in my program


int count=0;

String s;

int longdelay=1000;
int middelay=1000;
int shortdelay=600;
    
// Add setup code
void setup() {
    SPI.setModule(2);      // using the third SPI port
    SPI.begin();
    SPI.setClockDivider(SPI_CLOCK_DIV128); // for LM4F120H5QR DIV2 = 4 MHz !
    
    myScreen.begin();
    myScreen.setContrast(0x48);  // try different values here to suit your display
    myScreen.clear();
    myScreen.setFont(0);
    // myScreen.text(0, 0, "Initializing");
    myScreen.copyToScreen();
    
    delay(1000);

    myScreen.clear();
    Serial.begin(115200);
    
    pinMode(PUSH1, INPUT_PULLUP);
    pinMode(PUSH2, INPUT_PULLUP);
    
}






// Add loop code
void loop() {
   myScreen.clear();
   
   
   
   while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
     myScreen.setFont(0);
     myScreen.text(18,0,"Graphics"); 
     myScreen.text(21,9,"Library");
     myScreen.text(6,18,"LCD_5110_SPI");
     myScreen.setFont(2);
     myScreen.text(2,31,"PRESS SWITCH 2 TO GO");
     myScreen.text(12,37,"TO NEXT SECTION");
     myScreen.copyToScreen();
   }
   
   

  
   // Examples: Using the graphics library added to LCD_5110_SPI.cpp
   // by R.B.Owen (2016)
  
   // Here are examples of the graphics commands that can be used.
   // Upload this code to a TM4C123 Launchpad with Nokia 5110 LCD connected
   // using pins as described at the beginning of this program.
   
   // CO-ORDINATE SYSTEM:
   // All commands use the graphics screen co-ordinates 0<=x<=83  and 0<=y<=47
   // The (x,y) co-ordinates quoted in each of the following commands are
   // for the UPPER LEFT corner of each graphic.
   
   // COPY TO SCREEN: (From screen buffer)
   // All graphics commands write data to a screen buffer. This data will only
   // appear on screen when the command myScreen.copyToScreen() is carried out.
   
   
    // **************** Text ************************************************
    
    // Text characters are defined in the following files:
    // Terminal6.h (Font0: 6x8)
    // Terminal12.h (Font1: 12x16)
    // Terminal3.h (Font2: 3x5)
    
    // Here is an example of the definition of the character "F"
    // in Font 0 (5 pixels wide by 8 pixels high)
       
    // character "F" is 0x7F, 0x09, 0x09, 0x09, 0x01
    // because: (Add up the bit values in each column)
    
    //                          7F   09  09  09  01
    //                     1:    1    1   1   1   1
    //                     2:    1    0   0   0   0
    // second half of byte 4:    1    0   0   0   0
    //                     8:    1    1   1   1   0
    // ----------------------------------------------
    //                     1:    1    0   0   0   0 
    //                     2:    1    0   0   0   0
    // first half of byte  4:    1    0   0   0   0
    //                     8:    0    0   0   0   0
    
    // Only FIVE bytes appear in each definition, but printing a
    // string automatically adds a blank column after each character,
    // so that Font0 text occupies a space of 6 x 8
    
    // TEXT TRUNCATION
    // If the text is too long to fit on the display, the text will be truncated.   
    // Each character (Font 0) is 6 pixels wide. Since the width of the LCD is 84 pixels,
    // only 84/6 = 14 characters can be printed on screen. 
    // So myScreen.text(0,0,"abcdefghijklmnopqrstuvwxyz")
    // will only show "abcdefghijklmn" on screen. The rest will not be shown. 
    // Font 0 is 8 pixels high, so lines should be separated by 9 pixels.
    
    // This is Font0:
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.setFont(0);
    myScreen.text(0,0,"Text can be in");
    myScreen.text(9,9,"THREE fonts");
    myScreen.text(21,18,"This is");
    myScreen.text(24,30,"Font 0");
    myScreen.copyToScreen();
    }
    
    
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.text(10,0,"Text"); 
    myScreen.text(35,6,"can");
    myScreen.text(23,20,"be printed"); 
    myScreen.copyToScreen();
    myScreen.text(0,30,"anywhere");
    myScreen.text(5,39,"on"); 
    myScreen.text(40,40,"screen"); 
    myScreen.copyToScreen();
    }
    
    
    
    // This is the large font (Font 1)
    // It is 12 pixels wide, and 16 pixels high
    // text(uint8_t x, uint8_t y, String s);
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.setFont(1);
    myScreen.text(0,0,"Here is");  
    myScreen.text(7,19,"F");
    myScreen.text(19,22,"o");
    myScreen.text(32,25,"n");
    myScreen.text(45,28,"t");
    myScreen.text(68,31,"1");
    myScreen.copyToScreen();
    }
    
    
    // Here is Font 2 which is very small font.
    // It is 5 pixels high and 3 pixels wide
    // The digits and uppercase letters are OK,
    // but some of the lower case letters are
    // poorly drawn - they cannot be drawn in a
    // 5x3 grid.
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.setFont(2);
    myScreen.text(20,0,"HERE IS"); 
    myScreen.text(20,9,"A SMALL FONT");
    myScreen.text(20,18,"(FONT 2)");
    // Uppercase letters:
    myScreen.text(20,31,"ABCDEFGHIJKLM");
    myScreen.text(20,37,"NOPQRSTUVWXYZ");
    // Digits - can be used to print variables
    // using (String) command
    long score=1234567890;
    myScreen.text(22,43,(String)score);
    myScreen.copyToScreen();
    }
    
    // ****************** Graphics *******************
    
    // Introduction to graphics 1
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.setFont(0);
    myScreen.text(3,0,"Here are some");
    myScreen.text(23,9,"of the");
    myScreen.text(13,18,"Graphics");
    myScreen.text(3,27,"that can be");
    myScreen.text(13,36,"drawn ...");
    myScreen.copyToScreen();
    }
   
    
    // Introduction to graphics 2
    // In the graphics commands, the word
    // DRAW means draw in black pixels on a white background
    // and CLEAR means draw in white pixels on a black background.
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.setFont(0);
    myScreen.text(12,0,"DRAW means");
    myScreen.text(3,9,"draw in black");
    myScreen.text(18,18,"on white");
    myScreen.text(9,27,"background.");
    myScreen.copyToScreen();
    }
    
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
    myScreen.text(12,0,"CLEAR means");
    myScreen.text(3,9,"draw in white");
    myScreen.text(18,18,"on black");
    myScreen.text(9,27,"background.");
    myScreen.copyToScreen();
    }
   
   
   /*
    // PIXELS:
    // setPixel(x,y) draw pixels in black on white background
    // clearPixel(x,y) clears pixels i.e. turns them white - only
    // obvious of course on a blacl background
    // invertPixel(x,y) changes black to white, or white to black
    myScreen.clear();
    myScreen.setFont(0);
    myScreen.text(0,0,"set (draw)");
    myScreen.text(0,9,"random pixels:");
    
    for(int i=0; i<200; i++){
      long xp = random(23,65);
      long yp = random(21,41);
      myScreen.setPixel(xp,yp);
      myScreen.copyToScreen();
      // delay(1);
    }
    delay(middelay);
    
    myScreen.clear();
    myScreen.setFont(0);
    myScreen.text(0,0,"clear random");
    myScreen.text(0,9,"pixels:");
      
    myScreen.drawFilledRectangle(23,21,64,40);
    for(int i=0; i<200; i++){
      long xp = random(23,65);
      long yp = random(21,41);
      myScreen.clearPixel(xp,yp);
      myScreen.copyToScreen();
      // delay(1);
    }
    delay(middelay);
    
    myScreen.clear();
    myScreen.setFont(0);
    myScreen.text(0,0,"invert random");
    myScreen.text(0,9,"pixels:");
      
    myScreen.drawRectangle(22,20,65,41);
    myScreen.drawFilledRectangle(43,20,65,41);
    for(int i=0; i<200; i++){
      long xp = random(23,65);
      long yp = random(21,41);
      myScreen.invertPixel(xp,yp);
      myScreen.copyToScreen();
      // delay(1);
    }
    delay(longdelay);
    */
    
   
    // LINES: 
    // HLine = Horizontal Line  (x, y, length)
    // VLine = Vertical Line    (x, y, height)
    // Line = Diagonal Line     (x1, y1, x2, y2)
    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){ 
    myScreen.text(0,0,"Draw");
    myScreen.text(0,9,"VLine");
    myScreen.drawVLine(32,2,45); 
    myScreen.text(0,18,"HLine");
    myScreen.drawHLine(32,47,51);
    myScreen.text(0,27,"Line");
    myScreen.drawLine(83,47,32,2);
    myScreen.copyToScreen();
    }
    

    myScreen.clear();
    delay(longdelay);
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
       // make black background
       myScreen.drawFilledRectangle(31, 0, 83, 47 );
    myScreen.text(0,0,"Clear");
    myScreen.text(0,9,"VLine");
    myScreen.clearVLine(35,4,40); // to 35,44
    myScreen.text(0,18,"Hline");
    myScreen.clearHLine(35,44,44);  // to 79,44
    myScreen.text(0,27,"Line");
    myScreen.clearLine(79,44,35,4);  // to 35,4
    myScreen.copyToScreen();
    }
    
    
    // RECTANGLE:
    // draw = black rectangle outline
    // drawFilled = black filled rectangle
    // clear = white rectangle outline
    // clearFilled = white filled rectangle
    myScreen.clear();
    delay(longdelay);
    myScreen.text(0,0,"rectangle");
    myScreen.text(0,9,"draw");
    myScreen.drawRectangle(37,10,83,45);
    myScreen.copyToScreen();
    delay(longdelay);
       myScreen.clearFilledRectangle(0, 9, 26, 17 );
    myScreen.text(0,9,"fill");
    myScreen.drawFilledRectangle(37,10,83,45);
    myScreen.copyToScreen();
    delay(longdelay);
       myScreen.clearFilledRectangle(0, 9, 26, 17 );
    myScreen.clearRectangle(41, 14, 79, 41 );
    myScreen.text(0,9,"clear");
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.text(0,18,"filled");
    myScreen.clearFilledRectangle(41, 14, 79, 41);
    myScreen.copyToScreen();
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){     
    }
    delay(longdelay);
    
    // RoundRectangle = Rectangle with curved corners
    // drawRoundRectangle(int x1, int y1, int x2, int y2);
    myScreen.clear();
    myScreen.text(0,0,"rectangle");
    myScreen.text(0,9,"round");
    myScreen.text(0,18,"draw");
    myScreen.copyToScreen();
    delay(middelay);
    myScreen.drawRoundRectangle(37,10,83,45);
    myScreen.copyToScreen();
    delay(longdelay);
      myScreen.clearFilledRectangle(0, 18, 25, 26 );
    myScreen.text(0,18,"fill");
    myScreen.drawFilledRoundRectangle(37,10,83,45);
    myScreen.copyToScreen();
    delay(longdelay);
      myScreen.clearFilledRectangle(0, 18, 25, 26 );
    myScreen.clearRoundRectangle(41, 14, 79, 41 );
    myScreen.text(0,18,"clear");
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.text(0,27,"filled");
      myScreen.clearFilledRoundRectangle(41, 14, 79, 41);
    myScreen.copyToScreen();
  
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){     
    }
    delay(longdelay);
    
 
    /*
    // CIRCLES:
    // The code in the function drawCircle in the .cpp file, SHOULD produce a Circle 
    // ... but ... on my display, it appears to be squashed horizontally,
    // i.e. with height longer than its width.
    
    // As an alternative, there is also a command
    // drawRealCircle()
    // which seems to produce a better circle.
    // (It's actually an ellipse with vertical dimension 
    // equal to 0.9 x its horizontal dimension)
    // (See next block of code)
    // Choose drawCircle or drawRealCircle according to
    // which looks best on your display.
    
    myScreen.clear();
    myScreen.text(0,0,"circle");
    myScreen.text(0,9,"draw");
    myScreen.copyToScreen();
    delay(middelay);
    myScreen.drawCircle(60,24,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 9, 25, 19 );
    myScreen.text(0,9,"fill");
    myScreen.drawFilledCircle(60,24,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 9, 25, 19 );
    myScreen.text(0,9,"clear");
    myScreen.clearCircle(60,24,15);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.text(0,18,"filled");
    myScreen.clearFilledCircle(60,24,15);
    myScreen.copyToScreen();
    delay(2*longdelay);
    */
    
    
    
    // Here's an example of the drawRealCircle command
    myScreen.clear();
    delay(longdelay);
    myScreen.text(0,0,"real");
    myScreen.text(0,9,"circle");
    myScreen.text(0,18,"draw");
    myScreen.copyToScreen();
    delay(middelay);
    myScreen.drawRealCircle(60,24,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 18, 25, 27 );
    myScreen.text(0,18,"fill");
    myScreen.drawRealFilledCircle(60,24,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 18, 25, 27 );
    myScreen.text(0,18,"clear");
    myScreen.clearRealCircle(60,24,15);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.text(0,27,"filled");
    myScreen.clearRealFilledCircle(60,24,15);
    myScreen.copyToScreen();
   
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){     
    }
    delay(longdelay);
    
    
   
    // ELLIPSES:
    // Ellipses can be drawn with x-dimension larger than y-dimension
    // or with y-dimension larger than x-dimension
    myScreen.clear();
    myScreen.text(0,0,"ellipse");
    myScreen.text(0,9,"draw");
    myScreen.copyToScreen();
    delay(middelay);
    myScreen.drawEllipse(62,23,18,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 9, 25, 19 );
    myScreen.text(0,9,"fill");
    myScreen.drawFilledEllipse(62,23,18,23);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.clearFilledRectangle(0, 9, 25, 19 );
    myScreen.text(0,9,"clear");
    myScreen.clearEllipse(62,23,16,11);
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.text(0,18,"filled");
    myScreen.clearFilledEllipse(62,23,16,11);
    myScreen.copyToScreen();
 
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){     
    }
    delay(longdelay);
    
    
    // The bitmap (called smiley) is defined in the
    // Graphics.c file.   
    // myScreen.drawBitmap(x, y, name, w, length);
    // (x,y) is the co-ordinate at the top-left of the bitmap,
    // w is the width of the bitmap in pixels,
    // and length is the total number of bytes in the bitmap
    // (length should be an exact multiple of w)
    myScreen.clear();
    myScreen.text(0,0,"bitmap");
    myScreen.text(0,9,"draw");
    myScreen.drawRoundRectangle(38,0, 83, 47);
    myScreen.copyToScreen();
    delay(middelay);
    myScreen.drawBitmap(41, 4, smiley, 40, 200);
    myScreen.copyToScreen();
    delay(2*longdelay);
    myScreen.clearFilledRectangle(0, 9, 25, 19 );
    myScreen.text(0,9,"clear");
    myScreen.drawFilledRoundRectangle(38,0, 83, 47);
    myScreen.copyToScreen();
    delay(shortdelay);
    myScreen.clearBitmap(41, 4, smiley, 40, 200);
    myScreen.copyToScreen();
   
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){     
    }
    delay(longdelay);
    
    
    
    // To see the examples again, press the
    // Reset button on the Launchpad.
    // ... or just wait a few seconds!
    myScreen.clear();
    myScreen.setFont(1);
    myScreen.text(0,9,"The End");
    myScreen.copyToScreen();
    delay(longdelay);
    myScreen.setFont(2);
    myScreen.text(20,32,"PRESS RESET");
    myScreen.text(18,39,"TO SEE AGAIN");
    myScreen.copyToScreen();
    delay(40*longdelay);
   
    
    
}


