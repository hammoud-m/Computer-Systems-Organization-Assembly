        NAME    main
        PUBLIC  main
        SECTION .text : CODE (2)
        THUMB
        
parcheckreg 
        MOV R2, #0              ;start value = even
        MOV R8, #8              ;counter
                
LOOP    AND R9, R4, #1          ;masking forward LSB
        EOR R2, R2, R9          ;maybe adjust the return value
        LSR R4, R4, #1          ;shift right one step
        SUB R8, R8, #1          ;reduce the counter with 1
        CMP R8, R0 
        BNE LOOP                ;doing this 8 rounds in total 
        BX LR                   ;return value ni R2   
     
main    
        MOV R0, #0
        LDR R4, =0xc
        BL parcheckreg
        
STOP    B STOP
        END