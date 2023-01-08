#include "TM4C123GH6PM.h"

// 

// Function prototypes initialize, tranmit and rea functions 
void I2C3_Init ( void );  
char I2C3_Write_Multiple(int slave_address, char command_code, int bytes_count, char* data);
char I2C3_read_Multiple(int slave_address, char command_code, int bytes_count, char* data);