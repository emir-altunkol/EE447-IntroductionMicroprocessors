;*************************************************************** 
; SCREEN_ROM.s   
; Implemented in 2018/01/18
; Hereby this subroutine fills the memory with the necessary content
; to be transmitted to the LCD screen in the idle state
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE		COMMENT		
IDLE_BASE 			EQU			0x20000500		; memory location to hold idle screen
;***************************************************************

;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN 		WRITE_CHAR
			EXPORT		SCREEN_ROM
;***************************************************************			
SCREEN_ROM	PROC
			PUSH		{LR,R0,R1,R2,R3} ; Save the registers to be used
			
			LDR 		R0, =IDLE_BASE	; Hold initialization location pointer in R0
			
			MOV			R2, #0x05		; first set will be repeated for 5 times
			MOV			R1, #0x00		; first 5 characters = 0x00
			BL			WRITE_CHAR
			
			MOV			R2, #0x42		; second set will be repeated for 66 times
			MOV			R1, #0x80		; second 66 characters = 0x80
			BL			WRITE_CHAR
			
			MOV			R3, #0x04		; R3 will hold internal loop
			
LOOP		CMP			R3, #0x00		; repeat loop for 4 times
			BEQ			NEXT
			
			MOV			R2, #0x12		; third set will be repeated for 18 times
			MOV			R1, #0x00		; third 18 characters = 0x00
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; fourth set will be repeated for 1 time
			MOV			R1, #0xFF		; fourth character = 0xFF
			BL			WRITE_CHAR
			
			MOV			R2, #0x40		; fifth set will be repeated for 64 times
			MOV			R1, #0x00		; fifth 64 characters = 0x00
			BL			WRITE_CHAR
			
			MOV			R2, #0x01		; sixth set will be repeated for 1 time
			MOV			R1, #0xFF		; sixth character = 0xFF
			BL			WRITE_CHAR
			
			SUB			R3, #1			; decrement loop counter
			B			LOOP
			
NEXT		MOV			R2, #0x12		; seventh set will be repeated for 18 times
			MOV			R1, #0x00		; seventh 18 characters = 0x00
			BL			WRITE_CHAR
			
			MOV			R2, #0x42		; eighth set will be repeated for 66 times
			MOV			R1, #0x01		; eighth 66 characters = 0x01
			BL			WRITE_CHAR
			
			MOV			R2, #0x0D		; nineth set will be repeated for 13 times
			MOV			R1, #0x00		; nineth 13 characters = 0x00
			BL			WRITE_CHAR
			
			POP			{LR,R0,R1,R2,R3}
			BX 			LR
			
			ENDP
			ALIGN
			END