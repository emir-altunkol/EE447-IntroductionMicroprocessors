;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT

;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
			EXTERN		OutChar
			EXTERN		DELAY150
			EXTERN		GPIO_Init
            EXPORT 		__main
			
__main		PROC
			BL			GPIO_Init
			
			
			
			ENDP
			
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END