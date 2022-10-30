;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        sdata, DATA, READONLY
            THUMB
				
;***************************************************************
; Program section                         
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        main, READONLY, CODE
            THUMB
            EXTERN      OutChar      ; Reference external subroutine
			EXTERN      InChar				
            EXPORT      __main      ; Make available
__main	
start		BL			InChar		
			CMP			R0,#0x20
			BEQ			done
			BL			OutChar
			B			start
done		B			done

;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
            ALIGN
            END