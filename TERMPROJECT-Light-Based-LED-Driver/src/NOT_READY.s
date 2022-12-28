;*************************************************************** 
; NOT_READY.s   
; Created on 2018/01/17
; Hereby this subroutine checks the status register if its not ready
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
SSI0_SR				EQU 		0x4000800C 		; SSI status register
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXPORT		NOT_READY
				
;***************************************************************		
NOT_READY	PROC		
			PUSH		{LR,R0,R1}	
			
			LDR			R1, =SSI0_SR
check		LDR			R0, [R1]				; check if SSI is currently transmitting and/or receiving a frame,
			ANDS		R0, #0x10				; or the transmit FIFO is not empty.
			BNE			check					; branch to NOT_READY if no
			
			POP			{LR,R0,R1}
			BX			LR
			ENDP
			END