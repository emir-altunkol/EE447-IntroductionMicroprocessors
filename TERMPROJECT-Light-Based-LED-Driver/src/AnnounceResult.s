;LABEL				DIRECTIVE		VALUE				COMMENT

LOSER_ADD			EQU				0x20002020		; counter address
font_adress 		EQU			    0x2000229C		; font location
sayilar_adress		EQU				0x20002218		; sayilar
					AREA   data, DATA, READONLY
					THUMB
					PRESERVE8

					AREA			announceresult,CODE,READONLY
					THUMB
					EXTERN			SCREEN_MAP
					EXTERN			char_write_to_array
					EXTERN          line_generator
					EXPORT			AnnounceResult
					ALIGN
					ENTRY

AnnounceResult		PROC
					PUSH{R0-R12,LR}
					
					LDR R0,=LOSER_ADD

					LDR R1,=font_adress
					MOV R2,#44
					MOV R4,#0
					MOV R5,#7
					BL char_write_to_array    			;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
					MOV R2,#53
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#45
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#41
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#46
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#26
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#0
					ADD R4,#8
					BL char_write_to_array		


					BL char_write_to_array    			;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
					MOV R2,#40
					ADD R4,#36
					BL char_write_to_array
					MOV R2,#41
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#39
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#40
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#26
					ADD R4,#8
					BL char_write_to_array
;					MOV R2,#0
;					ADD R4,#8
;					BL char_write_to_array
;					MOV R2,#59
;					ADD R4,#36
;					BL char_write_to_array					
					
					
					BL char_write_to_array    			;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
					MOV R2,#44
					ADD R4,#52
					BL char_write_to_array
					MOV R2,#47
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#55
					ADD R4,#8
					BL char_write_to_array
					MOV R2,#26
					ADD R4,#8
					BL char_write_to_array
;					MOV R2,#0
;					ADD R4,#16
;					BL char_write_to_array
;					MOV R2,#0
;					ADD R4,#36
;					BL char_write_to_array					
					
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
					BL line_generator
					add r4,#1
					b generate_bar
end_bar				
					
					LDR				R0, =LOSER_ADD		; starting address
					;MOV				R3, #504
					
					
					BL				SCREEN_MAP
					B				ENDANNOUNCE

					
ENDANNOUNCE			POP{R0-R12,LR}
					BX				LR
					ENDP
					END