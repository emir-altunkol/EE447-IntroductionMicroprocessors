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
			MOV			R0, R3
			BL		    fib
			

done		B			done
			
fib
        push    {r3, r4, r5, lr}
        subs    r3, r0, #1
        cmp     r3, #1
        it      ls
        MOVLS   r0, #1
        bls     L1
        mov     r4, r0
        mov     r0, r3
        bl      fib
        mov     r5, r0
        subs    r0, r4, #2
        bl      fib
        add     r0, r0, r5
L1
        pop     {r3, r4, r5, pc}
		ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
