/*************************************************************** 
* Program_Directives.c  
* Copies the table from one location
* to another memory location.
***************************************************************/

#define		OFFSET		0x10
#define		LENGTH		0x10

/* Message for OutStr. Note the 0x04 = \4 termination character. */
char msg[] = "Copying table...\r\4";

/* Reference external subroutine with full signature */
/* OutStr takes a pointer (address) as an  */
/* argument and does not return any value  */
extern void OutStr(char*); 

int main(void){
	/* allocate memory for data                            */
	/* C compiler places the array in a suitable location. */
	char array[2*LENGTH];
	char counter;

	while(1){
		for(counter=0; counter<LENGTH; ++counter){
			array[counter] = counter;
		}
		
		OutStr(msg);
		
		for(counter=0; counter<LENGTH; ++counter){
			array[counter+OFFSET] = array[counter];
		}
	}
}

