; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
STR_ADDR	EQU			0x20000000
;***************************************************************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        sdata, DATA, READONLY
            THUMB
;***************************************************************
; Program section                         
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        main, READONLY, CODE
            THUMB
            EXTERN      InChar      ; Reference external subroutine 
			EXTERN      CONVRT      ; Reference external subroutine 
;			EXTERN      UPBND       ; Reference external subroutine 
            EXPORT      __main      ; Make available

__main
start       MOV         R0,#0
			BL			InChar
			SUB			R2, R5, #0x30
			BL			InChar
			MOV 		R3, #10
			SUB			R5, R5, #0x30
			MUL			R2, R2, R3
			ADD         R2, R2, R5	; R2 = n
			
			; From now on, R3 is the lower boundary,
			; R5 is the upper boundary, and R2 will 
			; be n-1
			
			SUB			R2, R2, #1
			MOV			R3, #0			; Initialize the boundaries
			MOV			R5, #1
			LSL			R5, R2
			SUB			R5, R5, #1		; The value cannot be 2^n
			
guess		ADD			R4, R3, R5		; Guess value is stored in R4 = (upper+lower+1)/2
			ADD			R4, #1
			LSR			R4, #1
			PUSH		{R5}			; Upper boundary is stored in stack
			BL			CONVRT			; Changes R5 as the address of the new decimal digit sequence representing R4
			MOV			R0, R5
			POP			{R5}			; Retrieve the upper boundary value from stack
			BL			OutStr			; Prints the value stored in adress R0
			BL			InChar			; Takes a single byte input from the user, stores it in R0
			CMP			R0, #0x43		; If input is 'C', terminate the program
			BEQ			idle
			BL			UPBND			; Changes lower boundary R3 and upper boundary R5 according to the input stored in R0
			
; ---------------------------------------------------

UPBND		CMP			R0, #0x44		; If the input is 'D', update upper boundary
			BNE			not_D
			SUB			R5, R4, #1		; upper = guess - 1
			BL			guess			; Guess again
not_D		CMP			R0, #0x55		; If the input is 'U', update lower boundary
			BNE			idle			; If the input is neither of them, there is an erroneaus input, terminate the program
			MOV			R3, R4			; lower = guess
			BL 			guess			; Guess again

; ---------------------------------------------------

idle		B			idle			; Idle loop
			
			

;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
            ALIGN
            END