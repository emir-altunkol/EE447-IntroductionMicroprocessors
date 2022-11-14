;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
PB_OUT		EQU			0x4000503C		; choose the [2:5] bits for writing
PB_IN		EQU			0x400053C0		; choose the [6:9] bits for reading
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
			EXTERN		OutChar
			EXTERN		DELAY150
			EXTERN		GPIO_Init_LED
            EXPORT 		__main
			
__main		PROC
			BL			GPIO_Init_LED		; GPIO initialize
			
			
loop		LDR			R5, =PB_IN		; set input adress to read the pins from
			LDR			R2, [R5]		; read at R2
			MVN			R2, R2			; Reverse
			AND			R1, R2, #0xF0	;
			LSR			R1, R1, #4		; Shift
			MVN			R1,	R1			; Reverse for leds
			LDR			R5,=PB_OUT	; set the adress for output
			STR			R1,[R5]		; Apply necessary voltage settings
			
delay		BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			BL			DELAY150	;
			B			loop		;
			
			ENDP
			ALIGN
			END
