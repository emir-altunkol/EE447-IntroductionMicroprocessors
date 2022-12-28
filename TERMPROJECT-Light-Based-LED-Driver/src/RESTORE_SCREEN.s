;*************************************************************** 
; RESTORE_SCREEN.s   
; Created on 2018/01/19
; Hereby this subroutine updates the given screen location
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
;*************************************************************** 	
SSI0_DR 			EQU 		0x40008008 		; SSI FIFO
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN		FIFO_FULL
			EXPORT		RESTORE_SCREEN
				
;***************************************************************		
RESTORE_SCREEN	PROC		
			PUSH		{LR,R0,R1,R2}	
			
			LDR			R2, =SSI0_DR
			LDRB		R1,	[R7], #1			; hold idle value in R1
			BL			FIFO_FULL				; check if SSI is full			
			STRB		R1, [R2]				; load it to the transmit fifo
			
			POP			{LR,R0,R1,R2}
			BX			LR
			ENDP
			END