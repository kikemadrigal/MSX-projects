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
	ld bc, 32*7
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_colors
	ld de, 29696 ;&h7400, en sc5
	ld bc, 16*7
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_atributes
	ld de, 30208 ;&h7600, base(28) en sc5
	ld bc, 4*7
	call  #005C; #005C=LDIRVM 
.bucle: 
	jr .bucle
sprites_definition:
;Definition sprite 0, name: Sprite-0
	db 0,0,240,240,240,240,240,240
	db 240,240,240,240,240,255,255,255
	db 0,0,0,0,0,0,0,0
	db 0,0,0,0,0,240,240,240
;Definition sprite 1, name: Sprite-1
	db 0,0,0,0,0,0,0,0 
	db 0,0,0,0,0,7,7,7
	db 0,0,7,7,7,7,7,7
	db 7,7,7,7,7,255,255,255
;Definition sprite 2, name: Sprite-2
	db 0,0,31,31,31,0,0,0
	db 0,1,3,7,31,63,63,63
	db 0,0,252,252,252,60,60,120
	db 240,224,192,128,0,248,248,248
;Definition sprite 3, name: Sprite-2
	db 0,0,63,63,63,56,56,56
	db 56,63,31,0,0,0,31,31
	db 0,0,248,248,248,0,0,0
	db 0,252,252,28,28,28,252,252
;Definition sprite 4, name: Sprite-4
	db 0,0,31,31,31,31,1,1
	db 1,1,1,1,1,1,1,1
	db 0,0,252,252,252,252,192,192
	db 192,192,192,192,192,192,192,192
;Definition sprite 5, name: Sprite-4
	db 0,0,63,63,63,56,56,56
	db 56,56,56,56,56,63,63,63
	db 0,0,252,252,252,28,28,28
	db 28,28,28,28,28,252,252,252
;Definition sprite 6, name: Sprite-4
	db 0,0,3,3,3,3,3,3
	db 3,3,3,3,3,3,3,3
	db 0,0,192,192,192,192,192,192
	db 192,192,192,192,192,192,192,192
sprites_colors: 
;Data colors sprite 0, name: Sprite-0
	db 0,0,9,9,9,9,9,9,9,9,9,9,9,9,9,9
;Data colors sprite 1, name: Sprite-1
	db 0,0,7,7,7,7,7,7,7,7,7,7,7,7,7,7
;Data colors sprite 2, name: Sprite-2
	db 0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8
;Data colors sprite 3, name: Sprite-2
	db 0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3
;Data colors sprite 4, name: Sprite-4
	db 0,0,13,13,13,13,13,13,13,13,13,13,13,13,13,13
;Data colors sprite 5, name: Sprite-4
	db 0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10
;Data colors sprite 6, name: Sprite-4
	db 0,0,5,5,5,5,5,5,5,5,5,5,5,5,5,5
sprites_atributes: 
;Data atributes sprite (y,x,patron,color) 0, name: Sprite-0
	db 0,0,0, " "
;Data atributes sprite (y,x,patron,color) 1, name: Sprite-1
	db 0,33,4, " "
;Data atributes sprite (y,x,patron,color) 2, name: Sprite-2
	db 0,66,8, " "
;Data atributes sprite (y,x,patron,color) 3, name: Sprite-2
	db 0,99,12, " "
;Data atributes sprite (y,x,patron,color) 4, name: Sprite-4
	db 0,132,16, " "
;Data atributes sprite (y,x,patron,color) 5, name: Sprite-4
	db 0,165,20, " "
;Data atributes sprite (y,x,patron,color) 6, name: Sprite-4
	db 0,198,24, " "
FINAL: 
