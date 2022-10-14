;*************************************************************** 
; Program_Directives.s  
; Copies the table from one location
; to another memory location.           
; Directives and Addressing modes are   
; explained with this program.   
;***************************************************************    
;*************************************************************** 
; EQU Directives
; These directives do not allocate memory
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
OFFSET      EQU         0x10
FIRST       EQU         0x20000400  
;***************************************************************
; Directives - This Data Section is part of the code
; It is in the read only section  so values cannot be changed.
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        sdata, DATA, READONLY
            THUMB
CTR1        DCB         0x10
MSG         DCB         "Copying table..."
            DCB         0x0D
            DCB         0x04
;***************************************************************
; Program section                         
;***************************************************************
;LABEL      DIRECTIVE   VALUE       COMMENT
            AREA        main, READONLY, CODE
            THUMB
            EXTERN      OutStr      ; Reference external subroutine 
            EXPORT      __main      ; Make available

__main
start       MOV         R0,#0
            LDR         R1,=FIRST
            LDR         R2,=CTR1
            LDRB        R2,[R2]
loop1       STRB        R0,[R1]
            ADD         R0,R0,#1
            ADD         R1,R1,#1    ; Store table
            SUBS        R2,R2,#1
            BNE         loop1
            LDR         R0,=MSG
            BL          OutStr      ; Copy message
            LDR         R1,=FIRST
            MOV         R2,#0x10
loop2       LDRB        R0,[R1]
            STRB        R0,[R1,#OFFSET]
            ADD         R1,R1,#1    ; Copy table
            SUBS        R2,R2,#1
            BNE         loop2
            B           start
;***************************************************************
; End of the program  section
;***************************************************************
;LABEL      DIRECTIVE       VALUE                           COMMENT
            ALIGN
            END
