;***************************************************************

;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		__main
			EXTERN		CONVRT
__main 		PROC
			LDR			R4,	=4294967295
			LDR			R5,	=0x20000000
			BL 			CONVRT
			
done		B			done
			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
