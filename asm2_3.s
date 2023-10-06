        NAME    main
        PUBLIC  main
        SECTION .text : CODE (2)
        THUMB
        


sum	PUSH {LR}               ;Push the adress to the stack
	CMP R0, #1              
        BEQ Exit                
        ADD R2, R2, R0          
	SUB R0, #1              
	BL sum                  
Exit    
        POP {LR}                ;pop the stack till the end and get the fist added adress
        BX LR                   ;exit the subrutine
main 
	MOV R0, #5              ;input
        MOV R2, #1              ;result
      	BL sum                             
        
        
STOP    B STOP
        END