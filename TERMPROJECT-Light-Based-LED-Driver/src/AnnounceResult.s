;LABEL				DIRECTIVE		VALUE				COMMENT

LOSER_ADD			EQU				0x20002020		; counter address
IDLE_BASE 			EQU			    0x20000500		; memory location to hold idle screen	
font_adress 		EQU			    0x2000229C		; font location
sayilar_adress		EQU				0x20002218		; sayilar
					AREA   data, DATA, READONLY
					THUMB
					PRESERVE8
;sayilar 			DCB				0xff,0xff,0xdd,0x55,0x88,0x33,0xff,0xff,0xdd,0x55,0x88,0x33,0xff,0xff,0xdd,0x55,0x88,0x33,0xff,0xff,0xdd,0x55,0x88,0x33,0xff,0xff,0xdd

					AREA			announceresult,CODE,READONLY
					THUMB
					EXTERN			SCREEN_MAP
					EXTERN			char_write_to_array
					EXTERN			RESTORE_SCREEN
					EXPORT			AnnounceResult
					EXTERN 			bar_generator
					ALIGN
					ENTRY

AnnounceResult		PROC
					PUSH{R0-R12,LR}
					
					LDR R0,=LOSER_ADD

					LDR R1,=font_adress
					MOV R2,#47
					MOV R4,#0
					MOV R5,#8
					BL char_write_to_array    			;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
					MOV R2,#58
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#39
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#53
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#50
					ADD R4,#8
					BL char_write_to_array
					
					
					mov r4,#0
					ldr r5,=sayilar_adress
generate_bar				
					cmp r4,#84
					beq end_bar
					
					mov r0,r4
					ldrb r2,[r5],#1
					ldr r3,=LOSER_ADD
					
					mov r7, #1
					sub r6,r7,r6  ; toggle to in
					BL bar_generator	;bar x r0,bar 3 blok uzunlukta,r2 data,r3 array location
					add r4,#1
					b generate_bar
end_bar
					LDR				R0, =LOSER_ADD		; starting address
					MOV				R3, #504
					MOV				R5, #0x00
					MOV				R6, #0x00
					
					
					BL				SCREEN_MAP
					B				ENDANNOUNCE

					
ENDANNOUNCE			POP{R0-R12,LR}
					BX				LR
					ENDP
					END