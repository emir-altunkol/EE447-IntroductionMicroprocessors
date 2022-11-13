;***************************************************************
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;SYMBOL		DIRECTIVE	VALUE			COMMENT
PB_OUT		EQU			0x4000503C		; choose the [2:5] bits for writing
PB_IN		EQU			0x400053C0		; choose the [2:5] bits for reading
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
			MOV			R1,#0x01	; R1 register determines the pin to apply high voltage
loopRows	LDR			R5,=PB_OUT
			CMP			R1,#0x10	; Return back to the first if all the pins are traversed
			LSLNE		R1,#1		; If it is not finished, then it will move to the next pin
			MOVEQ		R1,#0x1		; If it is finished, then it will go back to the first pin
readP		STR			R1,[R5]		; Apply necessary voltage settings
			LDR			R5,=PB_IN	
			LDR			R2,[R5]		; Read data from the keys
			BL			DELAY150	; Debounce (wait for 150ms)
			LDR			R3,[R5]		; Read another data from the keys
			CMP			R3,R2		
			BNE			readP		; Read again if not equal
				
			;If a key is preseed, R2 will be either 0x10,0x20,0x40, or 0x80.
			CMP			R2,#0x10
			BEQ			Column1
			CMP			R2,#0x20
			BEQ			Column2
			CMP			R2,#0x40
			BEQ			Column3
			CMP			R2,#0x80
			BEQ			Column4
			;If a key is not pressed in this row, move to the next row
			B			loopRows
				
;A key in the first column is pressed
Column1		LDR			R4,[R5]		;Take input data
			CMP			R2,R4		;Is it released?
			BEQ			Column1		;If released, print; if not, wait
			
			;This part will determine which key is pressed by checking which pin is high voltage
			CMP			R1,#0x01	;First row (column 1)
			MOVEQ		R0,#0x30
			CMP			R1,#0x02	;Second row (column 1)
			MOVEQ		R0,#0x34
			CMP			R1,#0x04	;Third row (column 1)
			MOVEQ		R0,#0x38
			CMP			R1,#0x08	;Fourth row (column 1)
			MOVEQ		R0,#0x43
			BL			OutChar		;Print the assigned value
			B			loopRows	;Go into the next iteration
				
;A key in the second column is pressed
Column2		LDR			R4,[R5]		;Take input data
			CMP			R2,R4		;Is it released?
			BEQ			Column2		;If released, print; if not, wait
			
			;This part will determine which key is pressed by checking which pin is high voltage
			CMP			R1,#0x01	;First row (column 2)
			MOVEQ		R0,#0x31
			CMP			R1,#0x02	;Second row (column 2)
			MOVEQ		R0,#0x35
			CMP			R1,#0x04	;Third row (column 2)
			MOVEQ		R0,#0x39
			CMP			R1,#0x08	;Fourth row (column 2)
			MOVEQ		R0,#0x44
			BL			OutChar		;Print the assigned value
			B			loopRows		;Go to next iteration

;A key in the third column is pressed
Column3		LDR			R4,[R5]		;Take input data
			CMP			R2,R4		;Is it released?
			BEQ			Column3		;If released, print; if not, wait
			
			;This part will determine which key is pressed by checking which pin is high voltage
			CMP			R1,#0x01	;First row (column 3)
			MOVEQ		R0,#0x32
			CMP			R1,#0x02	;Second row (column 3)
			MOVEQ		R0,#0x36
			CMP			R1,#0x04	;Third row (column 3)
			MOVEQ		R0,#0x41
			CMP			R1,#0x08	;Fourth row (column 3)
			MOVEQ		R0,#0x45
			BL			OutChar		;Print the assigned value
			B			loopRows	;Go to next iteration

;A key in the fourth column is pressed
Column4		LDR			R4,[R5]		;Take input data
			CMP			R2,R4		;Is it released?
			BEQ			Column4		;If released, print; if not, wait
			
			;This part will determine which key is pressed by checking which pin is high voltage
			CMP			R1,#0x01	;First row (column 4)
			MOVEQ		R0,#0x33
			CMP			R1,#0x02	;Second row (column 4)
			MOVEQ		R0,#0x37
			CMP			R1,#0x04	;Third row (column 4)
			MOVEQ		R0,#0x42
			CMP			R1,#0x08	;Fourth row (column 4)
			MOVEQ		R0,#0x46
			BL			OutChar		;Print the assigned value
			B			loopRows	;Go to next iteration

			ENDP			
			
;***************************************************************
; End of the program section
;***************************************************************
;LABEL		DIRECTIVE	VALUE			COMMENT
			ALIGN
            END