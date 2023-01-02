; *************************************************************** 
; main.c
; This program is aimed to control the brightness of a LED using
; feedback from  a light sensor and the output is displayed on 
; Nokia 5110 LCD display.
; @author: ozgurgulsuna
; Created on 27/12/2022
;*************************************************************** 
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE		COMMENT		
SSI0_DR 			EQU 		0x40008008 		; SSI FIFO
SSI0_SR				EQU 		0x4000800C 		; SSI status register
DC_OUT 			 	EQU 		0x40004100		; PA6 data location
RES_OUT  			EQU 		0x40004200		; PA7 data location
BL_OUT			 	EQU 		0x40004040		; PA4 data location	

;***************************************************************

;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN 		DELAY50
			EXTERN		NOT_READY
			EXPORT		N5110_INIT
;***************************************************************	
				
N5110_INIT 	PROC
			PUSH		{LR,R0,R1,R2}			; Save the registers to be used
			
			LDR			R2, =SSI0_DR			; hold transmit fifo address in R2
			
RESET5110	LDR			R1, =RES_OUT			;
			LDR			R0, [R1]				;
			BIC 		R0, #0x80				; disable RES pin
			STR			R0, [R1]
			
			BL			DELAY50					; wait 10 msec
			
			LDR			R1, =RES_OUT			;
			LDR			R0, [R1]				;
			ORR 		R0, #0x80				; enable RES pin (active low)
			STR			R0, [R1]		

			LDR			R1, =DC_OUT				;
			LDR			R0, [R1]				;
			BIC 		R0, #0x40				; disable DC to send commands
			STR			R0, [R1]		
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x21				; for selecting the Command Set in addition mode (H = 1)
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0xC0				; To send Command Set Voltage VOP for contrast (VOP = 5V)
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x07				; To send Command for setting value of Temp Control
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x13				; To send Command to set value of Voltage Bias System (n=4, 1:48)
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x20				; To send Command 20H for selecting the Command Set in basic mode (H = 0)
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x0C				; To send Command 0CH (D=1, E=0) for setting LCD to display results in Normal Mode
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x80				; x = 0
			STRB		R1, [R2]				; 
			
			BL			NOT_READY				; check if SSI is busy
			MOV			R1, #0x40				; y = 0
			STRB		R1, [R2]				; 
			BL			NOT_READY				; check if SSI is busy
			
			POP			{LR,R0,R1,R2}
			BX 			LR
			
			ENDP
			ALIGN
			END