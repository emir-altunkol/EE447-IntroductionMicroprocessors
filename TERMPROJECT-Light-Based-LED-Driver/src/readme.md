**PIN CONNECTIONS**


 for TM4C123GH6PM to NOKIA 5110 using SPI0 
```
TM4C123 -  LCD 5110        Comment
==================================
3.3V    -  Vcc             5110 supports 3v to 5v
PA4     -  BL              GPIO    / Backlight
GND     -  GND
PA_7    -  RST             GPIO    / Reset 
PA_2    -  Clk             SSI0Clk / SCK(0) to Clock
PA_5    -  Din             SSI0Tx  / MOSI(0) to Serial data in
PA_3    -  CE              SSI0Fss / Chip Select
PA_6    -  DC              GPIO    / Select between data or command



TM4C123 -  Pot             Comment
==================================

```