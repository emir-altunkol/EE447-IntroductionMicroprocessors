;*************************************************************** 
; SET_XY.s   
; Created on 2018/01/18
; Hereby this subroutine sets x y cursors and restore DC
; R5 = xCommand
; R6 = yCommand
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
DC_OUT 			 	EQU 		0x40004100		; PA6 data location
SSI0_DR 			EQU 		0x40008008 		; SSI FIFO
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN		NOT_READY
			EXPORT		SET_XY
				
;***************************************************************		
SET_XY		PROC		
			PUSH		{LR,R0,R1,R2,R5,R6}	
			
			LDR			R2, =SSI0_DR			; hold transmit fifo address in R2
			
			LDR			R1, =DC_OUT				;
			LDR			R0, [R1]				;
			BIC 		R0, #0x40				; disable DC to send commands
			STR			R0, [R1]
			
			MOV			R5, #0x80				; x data -> command
			MOV			R6, #0x40				; y data -> command
			
			BL			NOT_READY				; check if SSI is busy	
			STRB		R5, [R2]				; xCommand 
			
			BL			NOT_READY				; check if SSI is busy
			STRB		R6, [R2]				; yCommand
			
			BL			NOT_READY				; check if SSI is busy
			
			LDR			R1, =DC_OUT				;
			LDR			R0, [R1]				;
			ORR 		R0, #0x40				; enable DC to send data
			STR			R0, [R1]
			
			POP			{LR,R0,R1,R2,R5,R6}
			BX			LR
			ENDP
			END