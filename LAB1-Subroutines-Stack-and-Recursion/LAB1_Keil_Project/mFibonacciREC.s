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
			LDR			R7, =0x20000000
			LDR			R3, = 5
			LDR			R5,	=NUM		; used in the convrt as pointer
			LDR			R6, = 0
			MOV 		R8, R3
;---------------------------------------------------------------------
			PUSH		{R0,R8, R9}		; store R8, R9 to be used later
			MOV			R0, #0			; clear R0			
			BL			InChar			; wait for first input
			SUB			R8, R0, #0x30	; convert ASCII to decimal
			BL			InChar			; save second input
			MOV			R9,	#10			; set R9 to 10
			SUB			R0, R0, #0x30	; convert ASCII to decimal
			MUL			R8,	R8,	R9		; multiply by 10 to create tens digit
			ADD			R8,	R8,	R0		; add it to ones digit
			CMP			R8, #0
			SUBNE		R8, #1
			BEQ			done
			MOV			R3,	R8			; set it to R0, which is the input
			POP			{R0, R8, R9}		; restore R8, R9
;---------------------------------------------------------------------	
		
			BL		    mFibonacci
			

done		B			done
			
mFibonacci 	
			CMP			R3, #0
			MOV			R0, #1
			BEQ			exit
			PUSH		{LR}
			CMP			R3, #1
			BNE			step
			MOV			R0, #1
			MOV			R1, #0
			PUSH		{R0, R1}
			
step		CMP			R3, #2
			BNE			step2
			MOV			R0, #1
			MOV			R1, #1
			PUSH		{R0, R1}

step2       SUB		    R3, #1
			BL			mFibonacci

			PUSH		{R0}			; store R0 to use later
			LDR			R0, =0x2C		; the hex value for ASCII comma
			BL			OutChar			; print comma
			POP			{R0}			; bring back R0	

			POP			{R1, R2}
			POP			{LR}
			ADD			R0, R2, R2
			ADD			R0, R0, R1
			ADD			R6, #1
			CMP 		R6, #2
			BMI			case
			PUSH		{R0, R1}
case
			
exit		STR			R0, [R7]
			MOV			R4, R0			; set the output for convrt
			ADD			R7, #4
			
			PUSH		{LR}
			BL 			CONVRT			; convrt subroutine

			
			POP			{LR}
			BX			LR

			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
