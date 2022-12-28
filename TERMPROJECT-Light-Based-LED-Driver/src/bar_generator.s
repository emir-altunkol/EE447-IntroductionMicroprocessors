					AREA			bar_generator1,CODE,READONLY
					THUMB
					EXPORT			bar_generator
					ALIGN

bar_generator		PROC
						PUSH{R0-R12,LR} ;bar x r0,bar 3 blok uzunlukta,r2 data,r3 array location
						mov r1,#84
						sub r0,r1,r0;soldan saga endexli 84 den çikar
						add r0,#252 ;84*3 3. bar bitince basla
						add r0,r3
						
						mov r1,0xffffff;bar lenght
						mov r4,#10;data per bar pixel
						
loop						
						cmp r4,#240;max data 42*24
						bhs fin
						cmp r2,r4
						blo increment
						;lsl r1,#1
						;add r1,#1
						lsr r1,#1
						
increment
						add r4,#10
						b loop
						
fin							
						mov r2,#0x800000
						sub r2,r1
						strb r2,[r0],#84
						lsr r2,#8
						strb r2,[r0],#84
						lsr r2,#8
						strb r2,[r0],#84
						
					
						POP{R0-R12,LR}
						BX				LR
						ENDP
						END