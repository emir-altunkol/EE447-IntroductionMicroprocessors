;*************************************************************** 
; WRITE_CHAR.s   
; Created on 2018/01/18
; Hereby this subroutine write the character R1 to the memory location R0,
; and repeat it R2 times
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
			EXPORT		WRITE_CHAR
				
;***************************************************************		
WRITE_CHAR	PROC		
			PUSH		{LR}	
			
SET			CMP			R2, #0x00		; first 5 characters = 0x00
			BEQ 		NEXT			;
			STRB		R1,	[R0], #1	; 
			SUB			R2, #1			;
			B			SET
			
NEXT		POP			{LR}
			BX			LR
			ENDP
			END