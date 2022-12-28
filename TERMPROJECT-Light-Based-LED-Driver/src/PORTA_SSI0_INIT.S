;*************************************************************** 
; PORTA_SSI0_INIT.s   
; Modified in 2018/01/18
; Hereby this subroutine initialize SSI ports of GPIO port A
; For any questions please do not hesitate to contact via e-mail
; ugurcan.cakal@gmail.com
; @author: ugurc
;*************************************************************** 

;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL		     	DIRECTIVE	VALUE		COMMENT		
	
;System Registers
SYSCTL_RCGCGPIO 	EQU 		0x400FE608 		; GPIO Gate Control
SYSCTL_PRGPIO 		EQU 		0x400FEA08 		; GPIO Peripheral Ready Control
SYSCTL_RCGCSSI		EQU 		0x400FE61C 		; SSI Gate Control
SYSCTL_PRSSI		EQU 		0x400FEA1C 		; SSI Peripheral Ready Control
	
;GPIO Registers
GPIO_PORTA_DIR 		EQU 		0x40004400 		; Port Direction
GPIO_PORTA_AFSEL	EQU 		0x40004420 		; Alt Function enable
GPIO_PORTA_DEN 		EQU 		0x4000451C 		; Digital Enable
GPIO_PORTA_PCTL 	EQU 		0x4000452C 		; Alternate Functions
GPIO_PORTA_AMSEL 	EQU 		0x40004528 		; Analog enable
GPIO_PORTA_DR4R		EQU			0x40004504 		; 4-mA Drive Select
GPIO_PORTA_PUR		EQU			0x40004510 		; Pull up registers
GPIO_PORTA_PDR		EQU			0x40004514 		; Pull down registers

	
;SSI Registers
SSI0_CR1 			EQU 		0x40008004 		; Control 1 to enable
SSI0_CR0 			EQU 		0x40008000 		; Control 0 to set
SSI0_CC 			EQU 		0x40008FC8 		; Clock configuration
SSI0_CPSR 			EQU 		0x40008010 		; Clock prescale
	
;***************************************************************

;*************************************************************** 	
;Routines Section
;***************************************************************
;LABEL		DIRECTIVE	VALUE		COMMENT
			AREA        routine, CODE, READONLY
			THUMB
			EXPORT		PORTA_SSI0_INIT
;***************************************************************			
PORTA_SSI0_INIT PROC
				PUSH		{LR,R0,R1}  	; Save the registers to be used
			
			; activate the SSI clock
			LDR			R1,=SYSCTL_RCGCSSI	
			LDR			R0, [R1]				;
			ORR			R0, #0x01				; turn on clock for SSI0
			STR			R0, [R1]				; least significant bit corresponds to SSI0
	
SSI0_READY  LDR			R1,=SYSCTL_PRSSI	
			LDR			R0, [R1]				;
			ANDS		R0, #0x01				; check if SSI0 has enabled
			BEQ			SSI0_READY				; branch to SSI0_READY if no
			
			; activate the GPIO clock
			LDR			R1,=SYSCTL_RCGCGPIO	
			LDR			R0, [R1]				;
			ORR			R0, #0x01				; turn on clock for port A
			STR			R0, [R1]				; least significant bit corresponds to PORTA
			
GPIO_READY  LDR			R1,=SYSCTL_PRGPIO	
			LDR			R0, [R1]				;
			ANDS		R0, #0x01				; check if port A has enabled
			BEQ			GPIO_READY				; branch to GPIO_READY if no
			
			; set direction registers
			LDR 		R1, =GPIO_PORTA_DIR
			LDR 		R0, [R1]
			ORR 		R0, #0xD0 				; make PA4, PA6 and PA7 output
			STR 		R0, [R1]
			
			; alternate port function
			LDR 		R1, =GPIO_PORTA_AFSEL
			LDR 		R0, [R1]
			ORR 		R0, #0x2C				; alternate PA5 PA3 PA2 function
			STR 		R0, [R1]
			
			; alternate port function
			LDR 		R1, =GPIO_PORTA_PCTL
			LDR 		R0, =0x00202200			; choose ssi related ones (tx, rx(NO), fss, clk)
			STR 		R0, [R1]
			
			; enable digital port
			LDR 		R1, =GPIO_PORTA_DEN 
			LDR 		R0, [R1]
			ORR 		R0, #0xFC				; enable digital I/O on PA[5-2] ssi0, (NO RX)
			STR 		R0, [R1]				; PA6 for D/C, PA7 for RESET, PA4 for BL
			
			; 4-mA Drive Select 
			LDR 		R1, =GPIO_PORTA_DR4R 
			LDR 		R0, [R1]
			ORR 		R0, #0xFC				; 4 mA drain current
			STR 		R0, [R1]				; 
			
			; pull-up resistors on switch pins
			LDR 		R1, =GPIO_PORTA_PUR
			LDR 		R0, [R1]
			ORR 		R0, #0xFC 				; pull up
			STR 		R0, [R1]
			
			; disable ssi during setup
			LDR 		R1, =SSI0_CR1
			LDR 		R0, =0x00000000			; disable SSI0
			STR			R0, [R1]
			
			; configure SSI clock source 
			LDR 		R1, =SSI0_CC
			LDR 		R0, [R1]
			AND			R0, #0x00				; use system clk based on clock source and divisor factor
			STR			R0, [R1]
			
			; Set the clock prescale value of the SPI Clock
			LDR 		R1, =SSI0_CPSR
			MOV			R0, #0x06				; set psr to 24 = 16MHz/6 = 2.66 MHz
			STR			R0, [R1]
			
			; Set the clock rate of the SPI Clock
			LDR 		R1, =SSI0_CR0
			MOV 		R0, #0x0007				; SCR = 0, 8-bit, freescale, 		
			STR			R0, [R1]				; clock is high in steady state
			
			; done with setup, enable ssi with master mode
			LDR 		R1, =SSI0_CR1
			LDR 		R0, [R1]
			ORR			R0, #0x02				; enable SSI0 
			STR			R0, [R1]
			
			POP			{LR,R0,R1}
			BX 			LR
			
			ENDP
			ALIGN
			END
				