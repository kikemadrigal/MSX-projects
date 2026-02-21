		 output e-coord.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
entity_type_enemy1 equ	2 
entity_type_enemy2 equ	4 
INICIO: 
    ;level 0
    ; Enemy1 [x,y,type], enemy2 [x,y,type], enemy3 [x,y,type]
    db 14*8, 3*8, entity_type_enemy1,4*8, 9*8, entity_type_enemy1, 6*8, 15*8, entity_type_enemy1
    ;level 1
    db 3*8, 5*8, entity_type_enemy1, 15*8, 1*8, entity_type_enemy1, 15*8, 10*8, entity_type_enemy1
    ;level 2
    db  23*8,2*8, entity_type_enemy1, 28*8,6*8,entity_type_enemy1,23*8, 16*8, entity_type_enemy1
    ;level 3
    db  23*8,2*8, entity_type_enemy1,10*8, 6*8, entity_type_enemy1, 10*8, 15*8, entity_type_enemy1
    ;level 4
    db  6*8,2*8, entity_type_enemy1,15*8, 7*8, entity_type_enemy1, 7*8, 14*8, entity_type_enemy1
    ;level 5
    db  10*8,2*8, entity_type_enemy1,15*8, 16*8, entity_type_enemy1, 6*8, 13*8, entity_type_enemy1
    ;level 6
    db  20*8,2*8, entity_type_enemy1,15*8, 6*8, entity_type_enemy1, 20*8, 15*8, entity_type_enemy1
    ;level 7 (aqui se debe de poner un menos de la pantalla que sale en el MSX)
    db  4*8,4*8, entity_type_enemy1,4*8, 9*8, entity_type_enemy1, 23*8, 15*8, entity_type_enemy1
    ;level 8
    db  5*8,2*8, entity_type_enemy1,15*8, 11*8, entity_type_enemy1, 28*8, 16*8, entity_type_enemy1
    ;level 9
    db  15*8,3*8, entity_type_enemy1,15*8, 11*8, entity_type_enemy1, 20*8, 20*8, entity_type_enemy1
    ;level 10
    db  22*8,5*8, entity_type_enemy1,15*8, 8*8, entity_type_enemy1, 20*8, 16*8, entity_type_enemy1
    ;level 11
    db  22*8,5*8, entity_type_enemy1,15*8, 8*8, entity_type_enemy1, 20*8, 16*8, entity_type_enemy1
FINAL: 
