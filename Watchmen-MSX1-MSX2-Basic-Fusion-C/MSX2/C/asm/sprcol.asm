		 output sprcol.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
 
INICIO: 
sprites_colors: 
;Data colors sprite 0, name: diban-rojo
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
;Data colors sprite 1, name: diban-azul
	db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
;Data colors sprite 2, name: fire
	db 10,10,8,8,8,8,8,8,8,8,8,8,8,8,8,8
;Data colors sprite 3, name: player-left-1
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 4, name: player-left-2
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 5, name: player-right-1
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 6, name: player-right-2
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 7, name: player-up-1
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 8, name: player-up-2
	db 6,6,9,9,9,4,4,4,5,5,6,6,6,6,6,12
;Data colors sprite 9, name: player-left-2
	db 6,6,9,9,9,4,4,4,5,5,5,5,5,5,5,5
;Data colors sprite 10, name: player-left-2
	db 6,6,9,9,9,4,4,4,5,5,5,5,5,5,5,5
;Data colors sprite 11, name: Enemy-right-1
	db 6,6,6,12,12,12,12,12,12,12,12,13,13,6,6,6
;Data colors sprite 12, name: Enemy-right-2
	db 6,6,6,6,12,12,12,12,12,12,12,12,12,13,13,13
;Data colors sprite 13, name: Enemy-left-1
	db 6,6,6,12,12,12,12,12,12,12,12,13,13,6,6,6
;Data colors sprite 14, name: Enemy-left-2
	db 6,6,6,6,12,12,12,12,12,12,12,12,12,13,13,13
;Data colors sprite 15, name: Enemy-2-right-1
	db 0,6,6,9,9,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 16, name: Enemy-2-right-1
	db 0,6,6,9,9,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 17, name: Enemy-2-right-1
	db 0,6,6,9,9,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 18, name: Enemy-2-right-1
	db 0,6,6,9,9,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 19, name: Enemy-2-up-1
	db 0,0,6,6,9,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 20, name: Enemy-2-up-1
	db 0,0,0,6,6,9,4,4,4,4,4,4,4,4,14,14
;Data colors sprite 21, name: Enemy-3-right-1
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 22, name: Enemy-3-right-2
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 23, name: Enemy-3-left-1
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 24, name: Enemy-3-left-2
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 25, name: Enemy-3-up-1
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 26, name: Enemy-3-up-2
	db 9,9,9,9,6,8,8,8,8,8,8,8,8,8,14,14
;Data colors sprite 27, name: object-1-money
	db 0,0,10,10,10,10,10,10,10,10,14,14,14,14,14,14
;Data colors sprite 28, name: object-2-money
	db 0,0,10,10,10,10,10,10,10,10,14,14,14,14,14,14
;Data colors sprite 29, name: object-3-money
	db 0,0,10,10,10,10,10,10,10,10,14,14,14,14,14,14
FINAL: 
