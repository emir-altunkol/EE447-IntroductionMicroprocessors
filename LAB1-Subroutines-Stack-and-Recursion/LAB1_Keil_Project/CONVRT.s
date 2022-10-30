;***************************************************************
;MODULUS
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
			EXPORT		CONVRT
CONVRT		PROC
			MOV			R2,	#10
			MOV			R6,	R4			; store R4 at R6 to be processed
loop1		UDIV		R7,	R6, R2		; divide the number by ten
			SUBS		R7,	R7, #0		; just subtract 0 to check zero(Z) flag
			BEQ			exit			; if the digit is the last one the divison result in zero, loop2
			MUL			R7,	R7, R2		; again mutliply by 10 to restore the right amount of digits
			SUB			R8, R6, R7		; store the last digit at R7
			ADD			R9, R8,	#0x30	; add this to convert single decimal number in ASCII representaiton
			STR			R9,	[R5]		; store the ASCII at location pointed by [R5]
			ADD			R5,	R5,	#1		; increase the address pointer
			UDIV		R6,	R7,	R2		; move to the next digit
			BL			loop1			; loop1

exit		ADD			R9, R6,	#0x30	; add this to convert single decimal number in ASCII representaiton
			STR			R9,	[R5]		; store the ASCII at location pointed by [R5]
			ADD			R5,	R5,	#1		; increase the address pointer


			
			BX		LR			
			ENDP	
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
