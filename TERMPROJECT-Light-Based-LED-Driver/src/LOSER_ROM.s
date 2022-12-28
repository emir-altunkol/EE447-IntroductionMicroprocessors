;*************************************************************** 
; LOSER_ROM.s 
; Implemented in 2018/01/19
; Hereby this subroutine fills the memory with the necessary content
; to be transmitted to the LCD screen for 20 sec counter
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE		COMMENT		
LOSER_ADD		EQU			0x20002020		; counter address
;***************************************************************

;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN 		WRITE_CHAR
			EXPORT		LOSER_ROM
				
;***************************************************************			
LOSER_ROM	PROC
			PUSH		{LR,R0,R1,R2,R3} ; Save the registers to be used		
			
			LDR 		R0, =LOSER_ADD	; Hold initialization location pointer in R0	
			
			MOV			R2, #0xC1		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xF8		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x06		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xE0		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x18		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x02		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x18		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xE0		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x70		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xC8		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x03		; 
			MOV			R1, #0x88		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x10		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xF8		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x05		; 
			MOV			R1, #0x88		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0xF8		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x04		; 
			MOV			R1, #0x88		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x70		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x32		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x0F		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x05		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x03		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x0C		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x02		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x0C		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x03		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x04		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x04		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x07		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x0F		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x05		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x0F		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x03		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x01		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x06		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; 
			MOV			R1, #0x08		; 
			BL			WRITE_CHAR
			
			MOV			R2, #0xC0		; 
			MOV			R1, #0x00		; 
			BL			WRITE_CHAR
			
			
			
			POP			{LR,R0,R1,R2,R3}
			BX 			LR
			
			ENDP
			ALIGN
			END