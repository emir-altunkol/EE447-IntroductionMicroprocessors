;***************************************************************

;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
NUM			EQU			0x20000000		; start adress
MLT			EQU			2				; multiply by	
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		__main
			EXTERN		CONVRT
			EXTERN		OutChar
            EXTERN      InChar     		; Reference external
				
__main 		PROC
			LDR			R0,	=2			; input (0-16)
			LDR			R1,	=0			; F_{n-2}
			LDR			R2,	=0			; F_{n-1}
			LDR			R3,	=0			; F_{n}
			LDR			R4, =0			; used in the convrt
			LDR			R5,	=NUM		; used in the convrt as pointer
			LDR			R6, =MLT		; R4 to store the multiplication value, for flexibility
;---------------------------------------------------------------------
			PUSH		{R8, R9}		; store R8, R9 to be used later
			MOV			R0, #0			; clear R0			
			BL			InChar			; wait for first input
			SUB			R8, R0, #0x30	; convert ASCII to decimal
			BL			InChar			; save second input
			MOV			R9,	#10			; set R9 to 10
			SUB			R0, R0, #0x30	; convert ASCII to decimal
			MUL			R8,	R8,	R9		; multiply by 10 to create tens digit
			ADD			R8,	R8,	R0		; add it to ones digit
			MOV			R0,	R8			; set it to R0, which is the input
			POP			{R8, R9}		; restore R8, R9
;---------------------------------------------------------------------			
			MOV			R7,	R0			; handle n<= case

			
			
			
recursion	MUL			R1,	R6			; 2*F_{n-2}
			ADD			R3, R2, R1		; F_{n} = F_{n-1} + 2*F_{n-2}
			CMP			R0,	R7			; compare if its the first number
			BEQ			once
			
cont		MOV			R4, R3			; set the output for convrt
			BL 			CONVRT			; convrt subroutine
			MOV			R1, R2			; recurse move
			MOV			R2, R3			; recurse move
			SUBS		R0, R0, #1		; decrement the counter
			BEQ			done			;
			PUSH		{R0}			; store R0 to use later
			LDR			R0, =0x2C		; the hex value for ASCII comma
			BL			OutChar			; print comma
			POP			{R0}			; bring back R0
			B			recursion
						
once		LDR			R3, =1			; set output to 1 for n=1;
			B			cont
			
done		B			done
			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
