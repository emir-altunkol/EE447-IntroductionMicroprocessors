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
__main 		PROC
			LDR			R0,	=2			; input (0-16)
			LDR			R1,	=0			; F_{n-2}
			LDR			R2,	=0			; F_{n-1}
			LDR			R3,	=0			; F_{n}
			LDR			R4, =0			; used in the convrt
			LDR			R5,	=NUM		; used in the convrt as pointer
			LDR			R6, =MLT		; R4 to store the multiplication value, for flexibility
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
