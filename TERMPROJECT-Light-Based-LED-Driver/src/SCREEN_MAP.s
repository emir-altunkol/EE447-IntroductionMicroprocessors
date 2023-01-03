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
LOSER_ADD			EQU			0x20002020
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
				
			EXTERN		FIFO_FULL
			EXTERN		SET_XY
			EXTERN		DELAY50
				
			EXPORT		SCREEN_MAP
				
;***************************************************************		
SCREEN_MAP	PROC		
			PUSH		{LR,R0,R1,R2,R3,R5,R6,R7,R8}
			
			LDR			R8, =SSI0_DR
			BL			SET_XY
			BL			FIFO_FULL				; check if SSI is full
			
			MOV			R2, #0
			LDR			R0, =LOSER_ADD
a			
			CMP			R2, #504
			BEQ			FIN
			LDRB		R1,	[R0]
			ADD			R0,	#1

			BL			FIFO_FULL				; check if SSI is full
			STRB		R1, [R8]				; load it to the transmit fifo
			ADD			R2, #1
			b a
			
FIN			POP			{LR,R0,R1,R2,R3,R5,R6,R7,R8}
			BX			LR
			ENDP
			END