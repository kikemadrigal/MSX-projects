		 output o-coord.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
entity_type_object_money equ	#16 
entity_type_object_divan1 equ	#32
entity_type_object_divan2 equ	#80
INICIO: 
    ; level 0
    ;---------------------------
    ; coordinate_object 0
    db 1*8
    db 3*8
    db entity_type_object_money

    ; coordinate_object 1
    db 14*8
    db 3*8
    db entity_type_object_money
    
    ; coordinate_object 2
    db 1*8
    db 9*8
    db entity_type_object_money

    ;coordinate_object 3
    db 14*8
    db 15*8
    db entity_type_object_divan1
    
    ;coordinate_object 4
    db 8*8
    db 3*8
    db entity_type_object_divan2
    
    














    ; level 1
    ;---------------------------
     ; coordinate_object 0
    db 28*8
    db 1*8
    db entity_type_object_money
    
    ; coordinate_object 1
    db 15*8
    db 5*8
    db entity_type_object_money
    
    ; coordinate_object 2
    db 2*8
    db 10*8
    db entity_type_object_money
    
    ; coordinate_object 3
    db 18*8
    db 5*8
    db entity_type_object_divan1
      
    ; coordinate__object 4
    db 1*8
    db 26*8
    db entity_type_object_divan2



















    ; level 2
    ;---------------------------

   ;coordinate_object 0
    db 26*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 7*8
    db 12*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 21*8
    db 6*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db  15*8
    db  2*8
    db  entity_type_object_divan1
      
    ;coordinate_object 4
    db 3*8
    db 28*8
    db entity_type_object_divan2

















    ; level 3
    ;---------------------------
    
    ;coordinate_object 0
    db 10*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 3*8
    db 6*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 28*8
    db 15*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 2*8
    db 28*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 14*8
    db 11*8
    db entity_type_object_divan2













    ; level 4
    ;---------------------------
    
    ;coordinate_object 0
    db 28*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 29*8
    db 11*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 3*8
    db 14*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 15*8
    db 2*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 8*8
    db 26*8
    db entity_type_object_divan2














    ; level 5
    ;---------------------------
    
    ;coordinate_object 0
    db 1*8
    db 5*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 29*8
    db 5*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 29*8
    db 20*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 0*8
    db 26*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 0*8
    db 26*8
    db entity_type_object_divan2









    ; level 6
    ;---------------------------
    
    ;coordinate_object 0
    db 2*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 29*8
    db 10*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 2*8
    db 15*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 0*8
    db 26*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 0*8
    db 26*8
    db entity_type_object_divan2
    








    ; level 7
    ;---------------------------
    
    ;coordinate_object 0
    db 1*8
    db 4*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 14*8
    db 3*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 2*8
    db 15*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 6*8
    db 9*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 25*8
    db 15*8
    db entity_type_object_divan2











    ; level 8
    ;---------------------------
    
    ;coordinate_object 0
    db 2*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 20*8
    db 6*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 29*8
    db 16*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 13*8
    db 11*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 10*8
    db 2*8
    db entity_type_object_divan2







    ; level 9
    ;---------------------------
    
    ;coordinate_object 0
    db 2*8
    db 7*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 26*8
    db 7*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 2*8
    db 16*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 4*8
    db 20*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 0*8
    db 28*8
    db entity_type_object_divan2








    ; level 10
    ;---------------------------
    
    ;coordinate_object 0
    db 4*8
    db 9*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 26*8
    db 9*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 21*8
    db 16*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 15*8
    db 12*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 18*8
    db 16*8
    db entity_type_object_divan2











    ; level 11
    ;---------------------------
    
    ;coordinate_object 0
    db 2*8
    db 2*8
    db entity_type_object_money
    
    ;coordinate_object 1
    db 29*8
    db 10*8
    db entity_type_object_money
    
     ;coordinate_object 2
    db 2*8
    db 15*8
    db entity_type_object_money
    
    ;coordinate_object 3
    db 0*8
    db 27*8
    db entity_type_object_divan1

    ;coordinate_object 4
    db 0*8
    db 27*8
    db entity_type_object_divan2
    
FINAL: 

