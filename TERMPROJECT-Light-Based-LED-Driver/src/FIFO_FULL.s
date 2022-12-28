;*************************************************************** 
; FIFO_FULL.s   
; Created on 2018/01/18
; Hereby this subroutine checks the status register if its not full
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
			EXPORT		FIFO_FULL
				
;***************************************************************		
FIFO_FULL	PROC		
			PUSH		{LR,R0,R1}	
			
			LDR			R1, =SSI0_SR
check		LDR			R0, [R1]				; check if SSI is currently is FULL,
			ANDS		R0, #0x02				; 
			BEQ			check					; branch to check if yes
			
			POP			{LR,R0,R1}
			BX			LR
			ENDP
			END