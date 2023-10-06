        NAME    main
        PUBLIC  main SysTick_Handler
        SECTION .text : CODE (2)
        THUMB
        
SysTick_Handler
                MOV R0, #0xffffff01
L1              ADD R0, R0, #0x01
                SUBS R6, R0, R4
                BLT L1
                Bx LR
                
main
      MOV R0, #0x0
      MOV R6, #0x0
      MOV R4, #0xFF
      MOV R3, #0x7FFFFFFF
LOOP
      ADD R0, #0x1
      CPSID I       
      SUB R6, R0, R3
      CMP R6, #0x0
      CPSIE I
      BLT LOOP
      CPSID I       
WAIT  NOP
      B WAIT
 END