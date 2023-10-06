    NAME main
    PUBLIC main
    SECTION .text: CODE (2)
    THUMB



main

          LDR R1, =Vector
          LDR R6, [R1]
          LDR R7, [R1]
        
        
MAINLOOP

          LDR R4,[R1], #4
          CMP R4, #99
          BGT STOP
          CMP R4, R6
          BLT SetMinValueToR6
        
          CMP R4, R7
          BGT SetMaxValueToR7
          B   MAINLOOP

SetMaxValueToR7

          MOV R7, R4
          B   MAINLOOP
        
SetMinValueToR6

          MOV R6, R4
          B MAINLOOP
        
STOP      B STOP
        
        ALIGNROM 2
        DATA

Vector

        DC32 14, 25, 2, 27, 3
        DC32 22, 13, 4,24 , 6
        DC32 26, 18, 8, 15, 9
        DC32 28, 10, 7, 17, 5
        
        END