;*************************************************************** 
; SCREEN_MAP.s   
; Created on 2018/01/19
; Hereby this subroutine places NUMBERS FROM 20 - 0 on the PREDEFINED x y coordinates
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory

;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
SSI0_DR 			EQU 		0x40008008 		; SSI FIFO
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
				
			EXTERN		FIFO_FULL
			EXTERN		CAL_MEMORY
			EXTERN		SET_XY
			EXTERN		DELAY50
				
			EXPORT		SCREEN_MAP
				
;***************************************************************		
SCREEN_MAP	PROC		
			PUSH		{LR,R0,R1,R2,R3,R5,R6,R7,R8}
			
			LDR			R8, =SSI0_DR
			
			; loop R3 times, start from address R0, use R5 as xBox and R6 as yBox
			
			BL			CAL_MEMORY
			; R7 has memory location address (R5 and R6 is used)
			
			BL			DELAY50
			; R5 has the xBox, R6 has yBox
			BL			SET_XY		
			
CYCLE		CMP			R3, #0x00
			BEQ			FIN
			LDRB		R1,	[R0], #1			; load the byte
			
			; R1 has the value to be exored, R7 has the memory location to be checked
			LDRB		R2,	[R7]				; load the value stored in R7
			ORR			R2, R1					; orr with R1
			BL			FIFO_FULL				; check if SSI is full
			STRB		R2, [R8]				; load it to the transmit fifo
			SUB			R3, #1
			B			CYCLE
			
FIN			POP			{LR,R0,R1,R2,R3,R5,R6,R7,R8}
			BX			LR
			ENDP
			END