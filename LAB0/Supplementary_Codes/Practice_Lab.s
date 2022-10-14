;***************************************************************
; Program PracticeLab.s
; Clear memory locations 0x2000.0400 - 0x2000.041F,
; then load these locations with consecutive numbers starting
; with 00.
; 'CONST' is the number of locations operated on.
; 'FIRST' is the address of first memory address.
;***************************************************************

;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
FIRST 		EQU 		0x20000400
CONST 		EQU 		0x20
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		__main
__main 		PROC
			LDR 		R1,=FIRST 		; Initialize registers
            MOV 		R0,#0x00 		;
            LDR 		R2,=CONST 		;
loop1 		STRB 		R0,[R1] 		; Clear memory
            ADD 		R1,R1,#1 		; Increment address
            SUBS 		R2,R2,#1 		; Decrement contant
            BNE 		loop1
            LDR 		R1,=FIRST 		; Reset address
            LDR 		R2,=CONST 		; Reset constant
loop2 		STRB 		R0,[R1] 		; Store value in memory
            ADD 		R0,R0,#1 		; Increment value
            ADD 		R1,R1,#1 		; Increment address
            SUBS 		R2,R2,#1 		; Decrement contant
            BNE 		loop2
			
done 		WFI 					    ; Infinite loop to
            B 			done 		    ; end program
			
			ENDP
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END
