


					AREA			char_write_to_array2,CODE,READONLY
					THUMB
					EXPORT			char_write_to_array
					ALIGN

char_write_to_array		PROC
						PUSH{R0-R12,LR} ;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
						MUL R2,R5
						ADD R2, R2,R1	
						ADD R0,R4
						MOV R4,#0
						
loop						
						CMP R4 ,R5
						BEQ fin
						LDRB R3,[R2],#1
						STRB R3,[R0],#1
		
						ADD R4,#1
						B loop
fin
						POP{R0-R12,LR}
						BX				LR
						ENDP
						END