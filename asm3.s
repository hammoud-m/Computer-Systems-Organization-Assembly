
        NAME    main
        PUBLIC  main
        SECTION .text : CODE (2)
        THUMB
SYSTICK_CTRL EQU 0xE000E010
SYSTICK_VAL EQU 0xE000E018
SYSTICK_LOAD EQU 0xE000E014

main   
      LDR R0, = SYSTICK_CTRL; Control and Status Register
      MOV R1, #0 ; all bits clear
      STR R1, [R0] ; => stop counter, prevent interrupts
      LDR R0, = SYSTICK_VAL; Current Value Register
      STR R1, [R0] ; => clear current value
      LDR R0, = SYSTICK_LOAD; Reload Value Register
      LDR R1, =59999 ; trigger every 59999 cycles
                  
      STR R1, [R0] ; => set reload value
      LDR R0, =SYSTICK_CTRL ; Control and Status Register
      MOV R1, #0x07 ; ENABLE, TICKINT and CLKSOURCE set
      STR R1, [R0] ; => start counter
STOP  B STOP




 END