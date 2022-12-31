					AREA			bar_generator1,CODE,READONLY
					THUMB
					EXPORT			bar_generator
					ALIGN

bar_generator		PROC
						PUSH{R0-R12,LR} ;bar x r0,bar 3 blok uzunlukta,r2 data,r3 array location
						mov r1,#84
						sub r0,r1,r0    ;soldan saga endexli 84 den çikar
						add r0,#252     ;84*3 3. bar bitince basla
						add r0,r3
						
						
						mov r5,#1
						mov r1,0x0;bar lenght
						mov r4,#240;data per bar pixel
						cmp r2,r4
						bhs decrement
						mov r1,#1
						
loop						
						cmp r4,#1;max data 42*24
						blo fin
						cmp r2,r4
						bhs decrement
						lsl r1,#1
						add r1,#1
decrement
						sub r4,#10
						b loop
						
fin						


						mov32 r2,#0x1000000
						sub r2,r1
						lsr r2, 1
						
						add r2, #0x800000 ;özgür fix
						;sub	r2, #0x000001 ;özgür fix
						cmp r6, #1
						beq	vert

		
						mov32 r5, #0x555555
						and r2, r5
						b	horz
vert
						mov32 r5, #0xAAAAAA
						and r2, r5						
horz
						strb r2,[r0],#84
						lsr r2,#8
						strb r2,[r0],#84
						lsr r2,#8
						strb r2,[r0],#84
						
					
						POP{R0-R12,LR}
						BX				LR
						ENDP
						END