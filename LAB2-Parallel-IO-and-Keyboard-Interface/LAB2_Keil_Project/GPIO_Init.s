;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL				DIRECTIVE	VALUE			COMMENT
GPIO_PORTB_DATA		EQU			0x400053FC		; data address to all pins
GPIO_PORTB_DIR		EQU			0x40005400
GPIO_PORTB_AFSEL	EQU			0x40005420
GPIO_PORTB_DEN		EQU			0x4000551C
GPIO_PORTB_PUR		EQU			0x40005510
GPIO_PORTB_PDR		EQU			0x40005514
IOB					EQU			0x0F			; first 4 pins are outputs, the others are inputs
PDB					EQU			0xF0
SYSCTL_RCGCGPIO		EQU			0x400FE608		; Initialize clock for GPIOs	
;***************************************************************
; Program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
            AREA 		main, READONLY, CODE
            THUMB
            EXPORT 		GPIO_Init
			
GPIO_Init	PROC
			PUSH		{R0,R1}
			LDR			R1, =SYSCTL_RCGCGPIO
			LDR			R0, [R1]
			ORR			R0, R0, #0x02			; Only GPIOB is active
			STR			R0, [R1]
			NOP
			NOP
			NOP									; Let GPIO clock stabilize
			
			LDR			R1, =GPIO_PORTB_DIR		; configure port B
			LDR			R0, [R1]
			BIC			R0, #0xFF				; Bitwise and with not(0xFF)
			ORR			R0, #IOB
			STR			R0, [R1]
			LDR			R1, =GPIO_PORTB_AFSEL	
			LDR			R0, [R1]
			BIC			R0, #0xFF				; it should be cleared in our case
			STR			R0, [R1]
			LDR			R1, =GPIO_PORTB_DEN		 
			LDR			R0, [R1]
			ORR			R0, #0xFF				; digital mode enabled
			STR			R0, [R1]
			LDR			R1, =GPIO_PORTB_PDR		
			LDR			R0, [R1]
			BIC			R0, #0xFF				; it should be cleared in our case
			ORR			R0, #PDB
			STR			R0, [R1]
			
			POP			{R0,R1}
			BX			LR
			ENDP
			
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END