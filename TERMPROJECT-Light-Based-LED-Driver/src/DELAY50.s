;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
D_4_CYCLE	EQU 		120000			; 16000000
;***************************************************************
; Routines section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		routine, READONLY, CODE
            THUMB
            EXPORT 		DELAY50
			
DELAY50		PROC
			PUSH		{LR,R0}			; push registers to the stack
			
			MOV32		R0, #D_4_CYCLE	; 
d_loop		SUBS		R0, #1			; 1 Cycle
			BNE			d_loop			; 3 Cycles
			
			POP			{LR,R0}			; pop registers from the stack
			BX			LR				;
			ENDP
			
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
