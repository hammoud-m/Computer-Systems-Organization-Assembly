        NAME    main
        PUBLIC  main
        SECTION .text : CODE (2)
        THUMB
        
main
        MOV R0, # 0             ; (R0) <0
        MOV R1, # 0             ; (R1) <0
LOOP    CMP R0, # 9             ; compare (R0) to 9
        BNE ADD0                ; different> jump to ADD0
        B ADD1                  ; jump to ADD1
ADD0    ADD R0, R0, #1          ; (R0) <(R0) + 1
        ADD R1, R1, #1          ; add 1 to R1
        CMP R0, # 0x99          ; Compare R0 with finishing value
        BEQ STOP                ; Branch to end if R0 is 0x99     
ADD1    CMP R1, #9              ; compare R1 with 9
        BEQ M                   ; jump to M if R1 is 9
        BNE LOOP                ; different> jump to LOOP, repeat
M       ADD R0, #7              ; Add 7 to avoid letters
        MOV R1, #0              ; Reset R0
        B LOOP                  ; Jumping back to LOOP
STOP B  STOP                    ; infinite walk
   END