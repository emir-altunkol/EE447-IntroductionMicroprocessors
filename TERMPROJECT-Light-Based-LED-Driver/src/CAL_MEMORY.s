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
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE	COMMENT	
;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			AREA        routines, CODE, READONLY
			THUMB
			EXTERN		AnnounceResult
			EXPORT		CAL_MEMORY
				
;***************************************************************		
CAL_MEMORY	PROC		
			PUSH		{LR,R5,R6,R8,R9}	
			
			MOV			R8, #84					; multiplicand value
			MLA			R7, R6, R8, R5			; memory location offset address
			MOV			R8, R0
			ADD			R7, R8					; memory location address	
			
			POP			{LR,R5,R6,R8,R9}
			BX			LR
			ENDP
			END