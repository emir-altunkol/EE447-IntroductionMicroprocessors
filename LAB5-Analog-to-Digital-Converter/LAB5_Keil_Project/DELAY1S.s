;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
D_4_CYCLE	EQU 		1600000			; 16000000
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		DELAY1S

DELAY1S	PROC
			PUSH		{R0}			;
			MOV32		R0, #D_4_CYCLE	;
d_loop		SUBS		R0, #1			; 1 Cycle
			BNE			d_loop			; 3 Cycles
			POP			{R0}			;
			BX			LR				;
			ENDP

;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
