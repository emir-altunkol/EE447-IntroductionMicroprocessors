;***************************************************************

;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
NUM			EQU			0x20000000
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		__main
			EXTERN		CONVRT
			EXTERN		InChar
		
__main 		PROC
			LDR 		R5, =NUM
			LDR			R4, =447	
goto		BL			InChar			; wait for first input
			CMP			R0, #0x0a	
			BEQ			goto
			BL 			CONVRT
			
done		B			done
			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
