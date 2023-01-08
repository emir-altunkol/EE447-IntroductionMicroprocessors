# 1 "lux.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 386 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "lux.c" 2
# 143 "lux.c"
unsigned int CalculateLux(unsigned int iGain, unsigned int tInt, unsigned int ch0,
unsigned int ch1, int iType)
{




unsigned long chScale;
unsigned long channel1;
unsigned long channel0;
switch (tInt)
{
case 0:
chScale = 0x7517;
break;
case 1:
chScale = 0x0fe7;
break;
default:
chScale = (1 << 10);

break;
}

if (!iGain) chScale = chScale << 4;

channel0 = (ch0 * chScale) >> 10;
channel1 = (ch1 * chScale) >> 10;



unsigned long ratio1 = 0;
if (channel0 != 0) ratio1 = (channel1 << (9 +1)) / channel0;

unsigned long ratio = (ratio1 + 1) >> 1;

unsigned int b, m;
switch (iType)
{
case 0:
if ((ratio >= 0) && (ratio <= 0x0040))
{b=0x01f2; m=0x01be;}
else if (ratio <= 0x0080)
{b=0x0214; m=0x02d1;}
else if (ratio <= 0x00c0)
{b=0x023f; m=0x037b;}
else if (ratio <= 0x0100)
{b=0x0270; m=0x03fe;}
else if (ratio <= 0x0138)
{b=0x016f; m=0x01fc;}
else if (ratio <= 0x019a)
{b=0x00d2; m=0x00fb;}
else if (ratio <= 0x029a)
{b=0x0018; m=0x0012;}
else if (ratio > 0x029a)
{b=0x0000; m=0x0000;}
break;
case 1:
if ((ratio >= 0) && (ratio <= 0x0043))
{b=0x0204; m=0x01ad;}
else if (ratio <= 0x0085)
{b=0x0228; m=0x02c1;}
else if (ratio <= 0x00c8)
{b=0x0253; m=0x0363;}
else if (ratio <= 0x010a)
{b=0x0282; m=0x03df;}
else if (ratio <= 0x014d)
{b=0x0177; m=0x01dd;}
else if (ratio <= 0x019a)
{b=0x0101; m=0x0127;}
else if (ratio <= 0x029a)
{b=0x0037; m=0x002b;}
else if (ratio > 0x029a)
{b=0x0000; m=0x0000;}
break;
}
unsigned long temp;
temp = ((channel0 * b) - (channel1 * m));

if (temp < 0) temp = 0;

temp += (1 << (14 -1));

unsigned long lux = temp >> 14;
return(lux);
}
