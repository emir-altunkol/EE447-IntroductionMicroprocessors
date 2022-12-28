;LABEL				DIRECTIVE		VALUE				COMMENT

LOSER_ADD			EQU				0x20002020		; counter address
IDLE_BASE 			EQU			    0x20000500		; memory location to hold idle screen	
	
					AREA			announceresult,CODE,READONLY
					THUMB
					EXTERN			SCREEN_MAP
					EXPORT			AnnounceResult
					ALIGN
					ENTRY

AnnounceResult		PROC
					PUSH{R0-R12,LR}

					
					LDR				R0, =LOSER_ADD		; starting address
					MOV				R3, #504
					MOV				R5, #0x00
					MOV				R6, #0x00
;					LDR				R7, =LOSER_ADD		; ins çalisir
					
					BL				SCREEN_MAP
					B				ENDANNOUNCE

					
ENDANNOUNCE			POP{R0-R12,LR}
					BX				LR
					ENDP
					END