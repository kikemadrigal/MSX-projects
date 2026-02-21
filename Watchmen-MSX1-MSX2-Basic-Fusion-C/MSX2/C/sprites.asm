		 output sprites.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
INICIO: 
; Setup video mode
	ld a,5
	call #005F ; CHGMOD equ #005F, change mode video to screen 5
; Setup sprite size
; Sprites no ampliados de 16x16
	ld b,#e2
	ld c,1
	call #0047;WRTVDP equ #0047, b data to write, c number register, escribe en los registros del VDP
	ld hl, sprites_definition
	ld de, 30720 ;&h7800, base(29) en sc5
	ld bc, 32*30
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_colors
	ld de, 29696 ;&h7400, en sc5
	ld bc, 16*30
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_atributes
	ld de, 30208 ;&h7600, base(28) en sc5
	ld bc, 4*30
	call  #005C; #005C=LDIRVM 
.bucle: 
	jr .bucle
sprites_definition:
;Definition sprite 0, name: diban-rojo
	db 224,176,216,191,219,190,219,190
	db 219,190,219,190,219,126,59,31
	db 7,11,29,251,189,251,189,251
	db 189,251,189,251,189,250,188,248
;Definition sprite 1, name: diban-azul
	db 128,192,224,176,216,172,215,171
	db 213,171,213,107,53,27,13,7
	db 1,3,7,13,27,53,235,213
	db 171,213,171,214,172,216,176,224
;Definition sprite 2, name: fire
	db 0,254,255,254,0,0,0,0
	db 0,0,0,0,0,0,0,0
	db 3,7,255,7,3,0,0,0
	db 0,0,0,0,0,0,0,0
;Definition sprite 3, name: player-left-1
	db 3,7,2,7,3,1,3,3
	db 3,3,3,7,4,4,4,12
	db 128,128,128,128,128,128,128,192
	db 192,192,128,128,128,128,128,128
;Definition sprite 4, name: player-left-2
	db 3,7,2,7,3,1,3,2
	db 1,3,3,3,1,2,2,6
	db 128,128,128,128,128,128,128,128
	db 128,128,128,128,128,192,64,64
;Definition sprite 5, name: player-right-1
	db 1,1,1,1,1,1,1,3
	db 3,3,1,1,1,1,1,1
	db 192,224,64,224,192,128,192,192
	db 192,192,192,224,32,32,32,48
;Definition sprite 6, name: player-right-2
	db 1,1,1,1,1,1,1,1
	db 1,1,1,1,1,1,3,2
	db 192,224,64,224,192,128,192,64
	db 128,192,192,192,128,64,64,96
;Definition sprite 7, name: player-up-1
	db 1,3,1,3,3,5,3,3
	db 1,1,3,3,2,2,2,2
	db 128,192,128,192,192,160,192,192
	db 128,128,192,192,64,64,64,64
;Definition sprite 8, name: player-up-2
	db 1,3,1,3,3,1,3,3
	db 5,1,3,3,2,2,2,6
	db 128,192,128,192,192,128,192,192
	db 160,128,192,192,64,64,64,96
;Definition sprite 9, name: player-left-2
	db 28,60,20,60,28,7,3,5
	db 8,0,0,0,0,0,0,0
	db 0,0,0,0,0,128,224,240
	db 60,20,0,0,0,0,0,0
;Definition sprite 10, name: player-left-2
	db 0,0,0,0,0,1,7,15
	db 60,40,0,0,0,0,0,0
	db 56,60,40,60,56,224,192,160
	db 16,0,0,0,0,0,0,0
;Definition sprite 11, name: Enemy-right-1
	db 1,1,1,3,7,7,7,7
	db 3,3,3,3,3,4,8,12
	db 192,160,224,224,192,96,96,96
	db 32,224,224,224,224,20,8,0
;Definition sprite 12, name: Enemy-right-2
	db 1,1,1,3,7,7,7,7
	db 3,3,3,3,3,2,2,1
	db 192,160,224,224,192,224,240,232
	db 224,224,224,224,224,32,64,96
;Definition sprite 13, name: Enemy-left-1
	db 3,5,7,7,3,6,6,6
	db 4,7,7,7,7,40,16,0
	db 128,128,128,192,224,224,224,224
	db 192,192,192,192,192,32,16,48
;Definition sprite 14, name: Enemy-left-2
	db 3,5,7,7,3,7,15,23
	db 7,7,7,7,7,4,2,6
	db 128,128,128,192,224,224,224,224
	db 192,192,192,192,192,64,64,128
;Definition sprite 15, name: Enemy-2-right-1
	db 0,0,0,0,0,0,1,1
	db 1,1,1,1,1,1,1,2
	db 0,224,240,160,224,224,128,224
	db 224,112,32,224,224,224,32,64
;Definition sprite 16, name: Enemy-2-right-1
	db 0,1,1,1,1,1,0,0
	db 1,1,0,1,1,1,0,1
	db 0,192,224,64,192,192,192,224
	db 224,96,224,224,224,224,160,32
;Definition sprite 17, name: Enemy-2-right-1
	db 0,7,15,5,7,7,1,7
	db 7,14,4,7,7,7,4,2
	db 0,0,0,0,0,0,128,128
	db 128,128,128,128,128,128,128,64
;Definition sprite 18, name: Enemy-2-right-1
	db 0,3,7,2,3,3,3,7
	db 7,6,7,7,7,7,5,4
	db 0,128,128,128,128,128,0,0
	db 128,128,0,128,128,128,0,128
;Definition sprite 19, name: Enemy-2-up-1
	db 0,0,3,3,3,3,9,5
	db 3,7,7,7,3,3,2,2
	db 0,0,192,192,192,192,144,160
	db 192,224,224,224,192,192,64,64
;Definition sprite 20, name: Enemy-2-up-1
	db 0,0,0,3,3,3,3,1
	db 3,7,11,3,3,3,2,2
	db 0,0,0,192,192,192,192,128
	db 192,224,208,192,192,192,64,64
;Definition sprite 21, name: Enemy-3-right-1
	db 1,1,1,1,0,1,3,3
	db 7,7,7,7,7,6,1,2
	db 224,160,224,224,192,192,224,224
	db 240,224,224,224,224,160,160,64
;Definition sprite 22, name: Enemy-3-right-2
	db 3,3,3,3,1,1,3,3
	db 7,6,7,7,7,6,0,1
	db 192,64,192,192,128,192,224,160
	db 96,224,224,224,224,160,160,32
;Definition sprite 23, name: Enemy-3-left-1
	db 7,5,7,7,3,3,7,7
	db 15,7,7,7,7,5,5,2
	db 128,128,128,128,0,128,192,192
	db 224,224,224,224,224,96,128,64
;Definition sprite 24, name: Enemy-3-left-2
	db 3,2,3,3,1,3,7,5
	db 6,7,7,7,7,5,5,4
	db 192,192,192,192,128,128,192,192
	db 224,96,224,224,224,96,0,128
;Definition sprite 25, name: Enemy-3-up-1
	db 3,3,3,3,1,9,5,3
	db 3,7,15,15,15,8,2,2
	db 192,192,192,192,128,144,160,192
	db 192,224,240,240,240,208,64,64
;Definition sprite 26, name: Enemy-3-up-2
	db 3,3,3,3,1,1,1,7
	db 11,23,15,13,13,9,2,4
	db 192,192,192,192,128,128,128,224
	db 208,232,240,240,176,144,64,32
;Definition sprite 27, name: object-1-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
;Definition sprite 28, name: object-2-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
;Definition sprite 29, name: object-3-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
sprites_colors: 
;Data colors sprite 0, name: diban-rojo
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
;Data colors sprite 1, name: diban-azul
	db 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
;Data colors sprite 2, name: fire
	db 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
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
sprites_atributes: 
;Data atributes sprite (y,x,patron,color) 0, name: diban-rojo
	db 0,0,0, " "
;Data atributes sprite (y,x,patron,color) 1, name: diban-azul
	db 0,33,4, " "
;Data atributes sprite (y,x,patron,color) 2, name: fire
	db 0,66,8, " "
;Data atributes sprite (y,x,patron,color) 3, name: player-left-1
	db 0,99,12, " "
;Data atributes sprite (y,x,patron,color) 4, name: player-left-2
	db 0,132,16, " "
;Data atributes sprite (y,x,patron,color) 5, name: player-right-1
	db 0,165,20, " "
;Data atributes sprite (y,x,patron,color) 6, name: player-right-2
	db 0,198,24, " "
;Data atributes sprite (y,x,patron,color) 7, name: player-up-1
	db 0,231,28, " "
;Data atributes sprite (y,x,patron,color) 8, name: player-up-2
	db 33,0,32, " "
;Data atributes sprite (y,x,patron,color) 9, name: player-left-2
	db 33,33,36, " "
;Data atributes sprite (y,x,patron,color) 10, name: player-left-2
	db 33,66,40, " "
;Data atributes sprite (y,x,patron,color) 11, name: Enemy-right-1
	db 33,99,44, " "
;Data atributes sprite (y,x,patron,color) 12, name: Enemy-right-2
	db 33,132,48, " "
;Data atributes sprite (y,x,patron,color) 13, name: Enemy-left-1
	db 33,165,52, " "
;Data atributes sprite (y,x,patron,color) 14, name: Enemy-left-2
	db 33,198,56, " "
;Data atributes sprite (y,x,patron,color) 15, name: Enemy-2-right-1
	db 33,231,60, " "
;Data atributes sprite (y,x,patron,color) 16, name: Enemy-2-right-1
	db 66,0,64, " "
;Data atributes sprite (y,x,patron,color) 17, name: Enemy-2-right-1
	db 66,33,68, " "
;Data atributes sprite (y,x,patron,color) 18, name: Enemy-2-right-1
	db 66,66,72, " "
;Data atributes sprite (y,x,patron,color) 19, name: Enemy-2-up-1
	db 66,99,76, " "
;Data atributes sprite (y,x,patron,color) 20, name: Enemy-2-up-1
	db 66,132,80, " "
;Data atributes sprite (y,x,patron,color) 21, name: Enemy-3-right-1
	db 66,165,84, " "
;Data atributes sprite (y,x,patron,color) 22, name: Enemy-3-right-2
	db 66,198,88, " "
;Data atributes sprite (y,x,patron,color) 23, name: Enemy-3-left-1
	db 66,231,92, " "
;Data atributes sprite (y,x,patron,color) 24, name: Enemy-3-left-2
	db 99,0,96, " "
;Data atributes sprite (y,x,patron,color) 25, name: Enemy-3-up-1
	db 99,33,100, " "
;Data atributes sprite (y,x,patron,color) 26, name: Enemy-3-up-2
	db 99,66,104, " "
;Data atributes sprite (y,x,patron,color) 27, name: object-1-money
	db 99,99,108, " "
;Data atributes sprite (y,x,patron,color) 28, name: object-2-money
	db 99,132,112, " "
;Data atributes sprite (y,x,patron,color) 29, name: object-3-money
	db 99,165,116, " "
FINAL: 
