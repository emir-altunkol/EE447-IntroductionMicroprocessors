;*************************************************************** 
; CAL_MEMORY.s   
; Created on 2018/01/19
; Hereby this subroutine calculates memory addres using xBox and yBox
; R5 = xBox
; R6 = yBox
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
IDLE_BASE 			EQU			0x20000500		; memory location to hold idle screen
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXPORT		CAL_MEMORY
				
;***************************************************************		
CAL_MEMORY	PROC		
			PUSH		{LR,R5,R6,R8}	
			
			MOV			R8, #84					; multiplicand value
			MLA			R7, R6, R8, R5			; memory location offset address
			LDR			R8, =IDLE_BASE
			ADD			R7, R8					; memory location address	
			
			POP			{LR,R5,R6,R8}
			BX			LR
			ENDP
			END