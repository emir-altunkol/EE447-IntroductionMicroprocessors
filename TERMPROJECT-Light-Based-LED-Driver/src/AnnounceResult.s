;LABEL				DIRECTIVE		VALUE				COMMENT

LOSER_ADD			EQU				0x20002020		; counter address
IDLE_BASE 			EQU			    0x20000500		; memory location to hold idle screen	
font_adress 		EQU			    0x2000221A		; font location

					AREA			announceresult,CODE,READONLY
					THUMB
					EXTERN			SCREEN_MAP
					EXTERN			char_write_to_array
					EXTERN			RESTORE_SCREEN
					EXPORT			AnnounceResult
					ALIGN
					ENTRY

AnnounceResult		PROC
					PUSH{R0-R12,LR}

					LDR R0,=LOSER_ADD

					LDR R1,=font_adress
					MOV R2,#1
					MOV R4,#5
					MOV R5,#8
					BL char_write_to_array    			;R0 array adress,R1 font adress,R2 font index,R4 array start index, R5 font size 8 for fontWide
					MOV R2,#23
					MOV R4,#15
					BL char_write_to_array
					MOV R2,#5
					MOV R4,#38
					BL char_write_to_array
					MOV R2,#40
					MOV R4,#29
					BL char_write_to_array
					MOV R2,#17
					MOV R4,#84
					BL char_write_to_array
					LDR				R0, =LOSER_ADD		; starting address
					MOV				R3, #504
					MOV				R5, #0x00
					MOV				R6, #0x00
;					LDR				R7, =LOSER_ADD		; ins çalisir
					
					BL				RESTORE_SCREEN
					BL				SCREEN_MAP
					B				ENDANNOUNCE

					
ENDANNOUNCE			POP{R0-R12,LR}
					BX				LR
					ENDP
					END