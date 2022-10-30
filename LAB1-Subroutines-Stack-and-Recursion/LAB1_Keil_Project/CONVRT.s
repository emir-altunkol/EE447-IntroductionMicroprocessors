;***************************************************************
;MODULUS
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
EOL			EQU			0x04
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
			EXPORT		CONVRT
			EXTERN		OutStr

CONVRT		PROC
			PUSH		{R0-R9}			; store current register conditions
			PUSH		{LR}			; store current LR 
			MOV			R2,	#10			; constant for division by 10
			MOV			R1,	#0			; R1 init, stores digit number
			MOV			R6,	R4			; store R4 at R6 to be processed
			
digit		UDIV		R7,	R6, R2		; divide the number by ten
			ADD			R1, #1			; increment digit counter
			SUBS		R7,	R7, #0		; just subtract 0 to check zero(Z) flag
			BEQ			pre				; if the digit is the last one the divison result in zero, prepare for next
			MOV			R6, R7			; continue with one less digit	
			B			digit			;
			
pre			MOV			R6,	R4			; store R4 at R6 to be processed
			LDR			R10, =EOL		; End Of Line EOL number load
			STRB		R10, [R5, R1]	; store the ASCII at location pointed by [R5] and shifter by digit count
			BFC			R10, #0, #32	; Clear R10 to be safe	
			B			loop1			; loop1

loop1		UDIV		R7,	R6, R2		; divide the number by ten
			SUBS		R7,	R7, #0		; just subtract 0 to check zero(Z) flag
			BEQ			last			; if the digit is the last one the divison result in zero, loop2
			MUL			R7,	R7, R2		; again mutliply by 10 to restore the right amount of digits
			SUB			R8, R6, R7		; store the last digit at R7
			ADD			R9, R8,	#0x30	; add this to convert single decimal number in ASCII representaiton
			SUB			R5,	R5,	#1		; decrease the address pointer
			STRB		R9,	[R5, R1]	; store the ASCII at location pointed by [R5]
			UDIV		R6,	R7,	R2		; move to the next digit
			B 			loop1			; loop1

last		ADD			R9, R6,	#0x30	; add this to convert single decimal number in ASCII representaiton
			SUB			R5,	R5,	#1		; increase the address pointer
			STRB		R9,	[R5, R1]	; store the ASCII at location pointed by [R5] and shifter by digit count
			B 			print			;
			
print		ADD			R5, R5, R1		; Shift R5 back to start to set it to starting adress for OutStr
			MOV			R0,	R5			; load register 
			BL			OutStr			; Print 
			B 			exit			;
			
exit		POP			{LR}			; pop the link register	
			POP			{R0-R9}			; pop registers back	
			BX			LR			
			
			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
