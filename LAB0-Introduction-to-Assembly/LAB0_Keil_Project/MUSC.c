/*************************************************************** 
* Program_Directives.c  
* Copies the table from one location
* to another memory location.
***************************************************************/


extern char InChar(void);
extern void OutChar(char); 

int main(void){
	char input;
	char end = 0x20;
	
	while(1){
		input = InChar() ;
		if (input == end){
		break;
		}
		else{
		OutChar(input);
		}
	}
}

