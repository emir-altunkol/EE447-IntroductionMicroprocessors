
// PACMAN game by R.B.Owen (2016)
// to illustrate some of the commands in the graphics library
// added to the file LCD_5110_SPI.cpp

// By Clarence Ho (2015)
// TM4C123 connected to Nokia 5110 LCD display
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

LCD_5110_SPI myScreen(PA_7,    // Chip Select
                      PA_2,    // Data/Command
                      PB_5,    // Reset
                      PA_6,    // Backlight - not used in my program
                      PUSH2);  // Push Button 2 - not used in my program


uint8_t* bm;

int xm=6;
int ym=7;
int xpac;
int ypac;

// variables initial values
volatile int direct = 3; // Up =0, Right = 1, Down = 2, Left = 3
int pm_speed_int = 400;
int drawFlag =0;
int reDraw = 0;
int scoreDraw = 1;
int score = 100;
int fruitNumber = 0;
int level = 0;
long tme = 0;
long prevTme = 0;
long initTme = millis();
int endLevel = 0;
long endLevelTme = 0;

long debounceTime1 = 0;
long debounceTime2 = 0;
long debounceDelay = 50;

extern uint8_t pc0[];
extern uint8_t pcr[];
extern uint8_t pcl[];
extern uint8_t pcd[];
extern uint8_t pcu[];
extern int verticals[][45];
extern int horizontals[][36];
extern int fruit[][45];

volatile long count = 0;

String s;

int longdelay=2000;
int middelay=1000;
int shortdelay=600;

int set=0;
long pressedTime = millis();
int deleteAhead = 0;
char* lets[] = {"A","B","C","D","E","F","G","H","I","J"};


    

// Add setup code
void setup() {
    SPI.setModule(2);      // using the third SPI port
    SPI.begin();
    SPI.setClockDivider(SPI_CLOCK_DIV128); // for LM4F120H5QR DIV2 = 4 MHz !
    
    myScreen.begin();
    // myScreen.setContrast(0x28);
    myScreen.setContrast(0x48);
    
    
    // pinMode(PUSH2, INPUT_PULLDOWN);
    pinMode(PUSH1, INPUT_PULLUP);
    pinMode(PUSH2, INPUT_PULLUP);
    
    myScreen.clear();
    
    Serial.begin(115200);
    
    
    while(digitalRead(PUSH2)==HIGH){
      myScreen.setFont(1);
      myScreen.text(6, 0, "PACMAN");
      myScreen.setFont(2);
      myScreen.text(6,20,"FOR INSTRUCTIONS");
      myScreen.text(6,26,"PRESS SWITCH 2");
      myScreen.text(6,34,"SKIP INSTRUCTIONS");
      myScreen.text(6,40,"PRESS SWITCH 1");
      myScreen.copyToScreen();
   
      if(digitalRead(PUSH1)==LOW){
        goto skipInstructions;
      }
    }
    
    delay(500);
    myScreen.clear();
    
    
    
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(9, 0, "You have to");
      myScreen.text(6, 9, "steer Pacman");
      myScreen.text(0, 18, "to pick up all");
      myScreen.text(15, 27, "the dots.");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
      
    // SWITCH 1 and SWITCH 2 CAN BE SEEN ON THE LAUNCHPAD
    // TM4C123 BOARD.
      
    // TURNING LEFT OR RIGHT CAN ONLY HAPPEN WHEN PACMAN
    // IS IN A COLUMN OR ROW. THIS IS EASY IF PACMAN HAS
    // BEEN STOPPED BY A BARRIER, BUT NOT SO EASY WHEN
    // YOU HAVE TO GET HIM TO TURN WITH NO BARRIER TO
    // GUIDE YOU. 
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(0, 0, "Press Switch 1");
      myScreen.text(0, 9, "to turn left.");
      myScreen.text(0, 18, "Press Switch 2");
      myScreen.text(0, 27, "to turn right.");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(9, 0, "Each dot is");
      myScreen.text(4, 9, "worth 10 pts.");
      myScreen.text(4, 18, "Lose 10*Level");
      myScreen.text(4, 27, "every 10 sec.");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(0, 0, "If you need to");
      myScreen.text(9, 8, "get through");
      myScreen.text(0, 16, "walls, you can");
      myScreen.text(0, 24, "stay still for");
      myScreen.text(0, 32, "5 seconds, ...");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(6, 0, "and the wall");
      myScreen.text(9, 9, "in front of");
      myScreen.text(9, 18, "Pacman will");
      myScreen.text(12, 27, "disappear!");
    
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(3, 0, "The game ends");
      myScreen.text(0, 9, "when the score");
      myScreen.text(0, 18, "is less than 0");
      myScreen.text(6, 27, "at level end");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(9, 0, "What is the");
      myScreen.text(3, 9, "highest level");
      myScreen.text(21, 18, "you can");
      myScreen.text(24, 27, "reach?");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    skipInstructions:
    delay(500);
    myScreen.clear();
    
    while(digitalRead(PUSH2)==HIGH & digitalRead(PUSH1)==HIGH){
      myScreen.setFont(0);
      myScreen.text(3, 0, "There are TEN");
      myScreen.text(9, 8, "games (A-J)");
      myScreen.text(6, 16, "Press SW1 to");
      myScreen.text(6, 24, "select game.");
      myScreen.text(0, 32, "SW2 to confirm");
      myScreen.setFont(2);
      // myScreen.text(10,36,"PRESS SWITCH 2");
      myScreen.text(48,42,"SW2 ->");
      myScreen.copyToScreen();
    }
    delay(500);
    myScreen.clear();
    
    
    
    
    
    while(digitalRead(PUSH2)==HIGH){
        myScreen.setFont(0);
        myScreen.text(9, 0, "SW1 to select");
        myScreen.text(24, 12, "Set: ");
        if(digitalRead(PUSH1)==LOW){
           myScreen.clearFilledRectangle(54,12,61,21);
           set+=1;
           if(set>9){
             set=0;
           }
           delay(10);
        }
        myScreen.text(54,12, lets[set]);
        myScreen.text(0, 27, "SW2 to confirm");
        
        myScreen.setFont(2); 
        myScreen.text(48,42,"SW2 ->");
        myScreen.copyToScreen();
  
    }
    delay(500);
    myScreen.clear();
    
    
    
    
    
    attachInterrupt(PUSH2, turnRight, FALLING); // Interrupt is fired whenever button is pressed
    attachInterrupt(PUSH1, turnLeft, FALLING);   
}






// Add loop code
void loop() {
  
   if(count==0){
     setUpGame(); 
     printScore(score);
     xpac = xm+1;
     ypac = ym+1;
     myScreen.drawBitmap(xpac, ypac, pcl, 7, 7);  
     initTme = millis();
     tme = int((millis() - initTme)/1000);
     prevTme = -1;
     printTime(tme);
     myScreen.copyToScreen();
   }
   else{     
     if(count%pm_speed_int==0){
       
       if(direct==0){
         if(myScreen.readPixel(xpac,ypac-1)==0){
           ypac-=1;
           drawFlag = 1;
           bm=pcu;
           myScreen.clearLine(xpac, ypac+6, xpac+6, ypac+6);
         }
         if(myScreen.readPixel(xpac+3,ypac)==1){
           if(myScreen.readPixel(xpac+3,ypac-2)==1){
             score+=10;
             scoreDraw = 1;
             fruitNumber-=1;
           }
         }
         if(myScreen.readPixel(xpac+1,ypac-1)==1){
           if(deleteAhead == 1){
             if(ypac>ym+1){
               myScreen.clearHLine(xpac,ypac-1,7); 
               deleteAhead = 0;
             }
           }
         }
       }
       
       if(direct==1){
         if(myScreen.readPixel(xpac+7,ypac)==0){
           xpac+=1;
           drawFlag = 1;
           bm=pcr;
           myScreen.clearLine(xpac, ypac, xpac, ypac+6);
         }
         if(myScreen.readPixel(xpac+4,ypac+3)==1){
           if(myScreen.readPixel(xpac+6,ypac+3)==1){
             score+=10;
             scoreDraw = 1;
             fruitNumber-=1;
           }
         } 
         if(myScreen.readPixel(xpac+7,ypac)==1){
           if(deleteAhead == 1){
             if(xpac<xm+63){
               myScreen.clearVLine(xpac+7,ypac,7); 
               deleteAhead = 0;
             }
           }
         } 
       }
       
       if(direct==2){
         if(myScreen.readPixel(xpac,ypac+7)==0){
           ypac+=1;
           drawFlag = 1;
           bm=pcd;
           myScreen.clearLine(xpac, ypac, xpac+6, ypac);
         }
         if(myScreen.readPixel(xpac+3,ypac+4)==1){
           if(myScreen.readPixel(xpac+3,ypac+6)==1){
             score+=10;
             scoreDraw = 1;
             fruitNumber-=1;
           }
         }
         if(myScreen.readPixel(xpac+1,ypac+7)==1){
           if(deleteAhead == 1){
             if(ypac<ym+31){
               myScreen.clearHLine(xpac,ypac+7,7); 
               deleteAhead = 0;
             }
           }
         }  
       }
       
       if(direct==3){
         if(myScreen.readPixel(xpac-1,ypac)==0){
           xpac-=1;
           drawFlag = 1;
           bm=pcl;
           myScreen.clearLine(xpac+6, ypac, xpac+6, ypac+6);
         }
         if(myScreen.readPixel(xpac,ypac+3)==1){
           if(myScreen.readPixel(xpac-2,ypac+3)==1){
             score+=10;
             scoreDraw = 1;
             fruitNumber-=1;
           }
         }
         if(myScreen.readPixel(xpac-1,ypac)==1){
           if(deleteAhead == 1){
             if(xpac>xm+2){
               myScreen.clearVLine(xpac-1,ypac,7); 
               deleteAhead = 0;
             }
           }
         }      
       }    
     }    
   }
   
   
   if(millis()-pressedTime>=5000){
     pressedTime = millis();
     deleteAhead = 1;
     Serial.println(String(millis()-pressedTime));
     Serial.println(String(deleteAhead));
     Serial.println(" ");
   }
   
   
   tme = int((millis() - initTme)/1000);
   if(tme>prevTme){
      Serial.println(String(millis()-pressedTime));
      Serial.println(String(deleteAhead));
      printTime(tme);
      prevTme = tme;
      // every 10 seconds, subtract 10*level+10 from score
      if(tme%10==0 & tme>0){
        score-=(level*10 + 10);
        printScore(score);
      }
      myScreen.copyToScreen();
   }
   
   count++;
   
  
     
   if(drawFlag==1){
     if(scoreDraw==1){
       if(score<=50){
         myScreen.clearFilledRectangle(43,0,80,5);
         myScreen.copyToScreen();
       }
       printScore(score);
       scoreDraw=0;  
       Serial.println(String(fruitNumber)); 
     }
     if(reDraw==1){
       myScreen.clearBitmap(xpac,ypac, pc0, 7, 7);
       reDraw=0;
     }
     myScreen.drawBitmap(xpac, ypac, bm, 7, 7);  
     myScreen.copyToScreen();
     // myScreen.clearLine(xpac, ypac+5, xpac+6, ypac+5);
     // myScreen.clearBitmap(xpac,ypac, bm, 7, 7);
     drawFlag = 0;
   }
   
   
   // End of Level
   /*
   if(fruitNumber==0 & endLevel==0){ 
     endLevelTme = millis()+600;
     endLevel=1;
   }
   */
   if(endLevel==0){
     if(fruitNumber==0 || score<0){
       endLevelTme = millis()+600;
       endLevel=1;
     } 
   }
     
     
     
   if(endLevel==1 & millis()>endLevelTme){
     endLevel = 0;  
     delay(1000);
     myScreen.clear();
     level+=1;
     if(score>0){
       count=0;
       /*if(level<10){
         myScreen.setFont(1);
         String combLevel = String("Level");
         combLevel=String(combLevel+(String(level+1)));
         myScreen.text(6,0,combLevel);
       }
       else{
       */
         myScreen.setFont(0);
         String combLevel = String("Level");
         combLevel=String(combLevel+(String(level+1)));
         myScreen.text(21,0,combLevel);
       
         String combSet = String("Games");
         combSet = String(combSet+(String(lets[set])));
         myScreen.text(22,16,combSet);  
       // }
       myScreen.setFont(0);
       String combScore = String("Score:"+(String(score)));
       myScreen.text(15,32,combScore);
       myScreen.copyToScreen(); 
       delay(2000);
       myScreen.clear();
     }
     else{
       delay(1000);
       myScreen.setFont(1);
       myScreen.text(0,0,"The End");
       myScreen.setFont(0);
       String combLevel = String("Level "+(String(level)));
       myScreen.text(9,17,"You reached");
       myScreen.text(18,26,combLevel);
       myScreen.setFont(2);
       myScreen.text(4,36,"RESET TO PLAY AGAIN");
       myScreen.copyToScreen(); 
       delay(1000000);
     }
   }    
     
  
}




void setUpGame(){
// draw grid  
drawGrid();
}



void turnRight(){
  
 pressedTime = millis();
 deleteAhead = 0;
  
 debounceTime1 = millis();
 if(debounceTime1-debounceTime2<debounceDelay){
   goto bailoutR; 
 }
  
 if(direct==0){
   if((ypac-ym)%8==1){
     direct=1;
     bm=pcr;
     drawFlag=1;
     reDraw = 1;
   }  
 }
 else if(direct==2){
   if((ypac-ym)%8==1){
     direct=3;
     bm=pcl;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
 else if(direct==1){
   if((xpac-xm)%8==1){
     direct=2;
     bm=pcd;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
  else if(direct==3){
   if((xpac-xm)%8==1){
     direct=0;
     bm=pcu;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
 
bailoutR:
debounceTime2 = millis();
}



void turnLeft(){
  
  pressedTime = millis();
  deleteAhead = 0;
  
  debounceTime1 = millis();
  if(debounceTime1-debounceTime2<debounceDelay){
    goto bailoutL; 
  }  
  
  if(direct==0){
   if((ypac-ym)%8==1){
     direct=3;
     bm=pcl;
     drawFlag=1;
     reDraw = 1;
   }  
 }
 else if(direct==2){
   if((ypac-ym)%8==1){
     direct=1;
     bm=pcr;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
 else if(direct==1){
   if((xpac-xm)%8==1){
     direct=0;
     bm=pcu;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
  else if(direct==3){
   if((xpac-xm)%8==1){
     direct=2;
     bm=pcd;
     drawFlag=1;
     reDraw = 1;
   }  
 } 
 
bailoutL:
debounceTime2 = millis(); 
 
}


void drawGrid(){
myScreen.drawRectangle(xm, ym, xm+72, ym+40);

for(int i=0; i<9; i++){
  for(int j=0; j<5; j++){
    int xp=xm+i*8;
    int yp=ym+j*8;
    int sqb = j*9+i;
     
    if(set>=1)int r1 = random(0,35);
    if(set>=2)int r1 = random(0,45);
    if(set>=3)int r1 = random(0,55);
    if(set>=4)int r1 = random(0,65);
    if(set>=5)int r1 = random(0,75);
    if(set>=6)int r1 = random(0,85);
    if(set>=7)int r1 = random(0,95);
    if(set>=8)int r1 = random(0,105);
    if(set>=9)int r1 = random(0,115);
    
    
    int rc = random(0,45);    
    if(rc<=12){
      myScreen.drawHLine(xp,yp+8,8);
    }    
    if(rc>12 & rc<=24){
      myScreen.drawVLine(xp+8,yp,8);
    } 
    if(rc>24){
      if(i<8){
        if(i>0 & j>0){
        fruitNumber+=1;
        myScreen.drawFilledRectangle(xp+3,yp+3,xp+6,yp+6);
        Serial.print(String(i));
        Serial.print(",");
        Serial.println(String(j));
        }
      }
    } 
  }
  myScreen.copyToScreen();    
}
  
}


void printEnd(){
myScreen.clearFilledRectangle(6,0,60,5);
myScreen.setFont(2);
myScreen.text(6,0,"End");
}


void printTime(int tmeNumber){
myScreen.clearFilledRectangle(6,0,38,5);
myScreen.setFont(2);
myScreen.text(6,0,"TIME:"+(String)tmeNumber);
// myScreen.copyToScreen();
}

void printScore(int scoreNumber){
myScreen.clearFilledRectangle(43,0,80,5);
myScreen.setFont(2);
myScreen.text(43,0,"SCORE:"+(String)scoreNumber);
// myScreen.copyToScreen();
}


/*
void drawPac(int square, int thisdirect, int d ){
// draw pacman in square, facing direct, with displacement d
int xp=xm+(8*int(square%9))-7;
int yp=ym+(8*int(square/9))+1;
    
if(thisdirect==0){
  bm=pcu;
  yp-=d;
}
if(thisdirect==1){
  bm=pcr;
  xp+=d;
}
if(thisdirect==2){
  bm=pcd;
  yp+=d;
}
if(thisdirect==3){
  bm=pcl;
  xp-=d;
}
     
myScreen.drawBitmap(xp, yp, bm, 7, 7);  
myScreen.copyToScreen();
myScreen.clearBitmap(xp,yp, bm, 7, 7);
    
}
*/

