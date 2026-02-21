		 output sprcol.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
INICIO: 

sprites_colors: 
;Data colors sprite 0, name: Sprite-0
	db 0,0,0,0,0,0,5,5,9,5,9,9,5,5,5,5
;Data colors sprite 1, name: Sprite-1
	db 0,0,0,0,0,0,0,10,10,10,10,10,10,10,10,10
;Data colors sprite 2, name: Sprite-2
	db 0,9,9,9,9,9,5,5,8,5,9,9,9,9,9,9
;Data colors sprite 3, name: Sprite-2
	db 0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 4, name: Sprite-2
	db 0,0,0,0,9,10,10,10,10,10,10,10,9,9,9,9
;Data colors sprite 5, name: Sprite-2
	db 0,0,0,0,0,0,0,5,8,5,5,5,5,5,5,5
;Data colors sprite 6, name: Sprite-6
	db 0,0,0,0,0,0,0,7,7,7,7,7,7,7,7,7
;Data colors sprite 7, name: Sprite-6
	db 0,0,0,0,7,7,7,7,7,7,7,7,7,7,7,7
;Data colors sprite 8, name: Sprite-6
	db 0,0,7,7,7,7,7,7,7,7,7,7,7,7,7,7
;Data colors sprite 9, name: Sprite-6
	db 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7
;Data colors sprite 10, name: Sprite-30
	db 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 11, name: Sprite-30
	db 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 12, name: Sprite-30
	db 0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 13, name: Sprite-30
	db 0,0,0,0,0,0,0,10,10,10,10,10,10,10,10,10
;Data colors sprite 14, name: Sprite-26
	db 10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 15, name: Sprite-26
	db 0,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 16, name: Sprite-26
	db 0,0,0,0,0,0,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 17, name: Sprite-26
	db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;Data colors sprite 18, name: Sprite-7
	db 0,0,0,0,0,0,0,8,5,5,5,5,5,5,9,9
;Data colors sprite 19, name: Sprite-14
	db 8,8,4,4,4,4,4,4,4,4,4,9,9,9,9,8
;Data colors sprite 20, name: Sprite-22
	db 13,13,14,14,14,14,14,14,14,14,14,14,14,14,6,8
;Data colors sprite 21, name: Sprite-23
	db 0,0,14,14,14,14,14,14,4,4,4,6,6,6,6,6
;Data colors sprite 22, name: Sprite-24
	db 0,12,12,12,12,12,12,6,6,6,6,6,12,12,12,12
;Data colors sprite 23, name: Sprite-25
	db 0,0,0,0,0,0,14,14,14,14,14,12,12,12,12,12
;Data colors sprite 24, name: Sprite-34
	db 6,6,6,6,6,6,6,6,4,4,4,4,4,4,4,4
;Data colors sprite 25, name: Sprite-35
	db 9,9,9,9,9,10,10,10,10,10,10,10,8,8,8,8
;Data colors sprite 26, name: Sprite-37
	db 13,13,13,13,13,13,13,13,13,13,13,6,6,6,10,10
;Data colors sprite 27, name: Sprite-36
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
;Data colors sprite 28, name: Sprite-38
	db 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6
;Data colors sprite 29, name: Sprite-39
	db 6,6,6,6,6,6,8,8,8,13,13,13,13,13,13,13
;Data colors sprite 30, name: Sprite-8
	db 0,0,9,8,9,9,9,7,9,9,9,8,9,9,9,9
;Data colors sprite 31, name: No_name9
	db 0,13,13,13,13,13,10,5,5,10,13,13,13,13,13,13
;Data colors sprite 32, name: Sprite_name10
	db 6,6,6,6,6,6,8,7,7,8,6,6,6,6,6,6
;Data colors sprite 33, name: Sprite-11
	db 5,5,5,5,5,5,5,13,13,5,5,5,5,5,5,5
;Data colors sprite 34, name: Sprite-12
	db 13,13,13,13,13,2,12,12,12,12,2,13,13,13,13,13
;Data colors sprite 35, name: Sprite-13
	db 9,9,10,10,10,10,10,9,9,9,10,10,10,10,9,9
;Data colors sprite 36, name: Sprite-14
	db 4,4,4,8,8,4,4,5,5,5,4,4,8,8,4,4
;Data colors sprite 37, name: Sprite-15
	db 13,13,13,13,8,8,9,9,9,8,8,8,13,13,13,13
;Data colors sprite 38, name: Sprite-16
	db 8,8,8,9,7,7,4,4,4,7,7,9,8,8,8,8
;Data colors sprite 39, name: Sprite-17
	db 12,12,12,12,12,12,6,8,6,12,12,12,12,12,12,12

FINAL: 
