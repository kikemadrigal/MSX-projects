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
	ld bc, 32*25
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_colors
	ld de, 29696 ;&h7400, en sc5
	ld bc, 16*25
	call  #005C; #005C=LDIRVM 
	ld hl, sprites_atributes
	ld de, 30208 ;&h7600, base(28) en sc5
	ld bc, 4*25
	call  #005C; #005C=LDIRVM 
.bucle: 
	jr .bucle
sprites_definition:
;Definition sprite 0, name: fire
	db 255,255,255,0,0,0,0,0
	db 0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0
	db 0,0,0,0,0,0,0,0
;Definition sprite 1, name: player-left-1
	db 3,7,2,7,3,1,3,3
	db 3,3,3,7,4,4,4,12
	db 128,128,128,128,128,128,128,192
	db 192,192,128,128,128,128,128,128
;Definition sprite 2, name: player-left-2
	db 3,7,2,7,3,1,3,2
	db 1,3,3,3,1,2,2,6
	db 128,128,128,128,128,128,128,128
	db 128,128,128,128,128,192,64,64
;Definition sprite 3, name: player-right-1
	db 1,1,1,1,1,1,1,3
	db 3,3,1,1,1,1,1,1
	db 192,224,64,224,192,128,192,192
	db 192,192,192,224,32,32,32,48
;Definition sprite 4, name: player-right-2
	db 1,1,1,1,1,1,1,1
	db 1,1,1,1,1,1,3,2
	db 192,224,64,224,192,128,192,64
	db 128,192,192,192,128,64,64,96
;Definition sprite 5, name: player-up-1
	db 1,3,1,3,3,5,3,3
	db 1,1,3,3,2,2,2,2
	db 128,192,128,192,192,160,192,192
	db 128,128,192,192,64,64,64,64
;Definition sprite 6, name: player-up-2
	db 1,3,1,3,3,1,3,3
	db 5,1,3,3,2,2,2,6
	db 128,192,128,192,192,128,192,192
	db 160,128,192,192,64,64,64,96
;Definition sprite 7, name: player-left-2
	db 28,60,20,60,28,7,3,5
	db 8,0,0,0,0,0,0,0
	db 0,0,0,0,0,128,224,240
	db 60,20,0,0,0,0,0,0
;Definition sprite 8, name: player-left-2
	db 0,0,0,0,0,1,7,15
	db 60,40,0,0,0,0,0,0
	db 56,60,40,60,56,224,192,160
	db 16,0,0,0,0,0,0,0
;Definition sprite 9, name: Enemy-right-1
	db 1,1,1,3,7,7,7,7
	db 3,3,3,3,3,4,8,12
	db 192,160,224,224,192,96,96,96
	db 32,224,224,224,224,20,8,0
;Definition sprite 10, name: Enemy-right-2
	db 1,1,1,3,7,7,7,7
	db 3,3,3,3,3,2,2,1
	db 192,160,224,224,192,224,240,232
	db 224,224,224,224,224,32,64,96
;Definition sprite 11, name: Enemy-left-1
	db 3,5,7,7,3,6,6,6
	db 4,7,7,7,7,40,16,0
	db 128,128,128,192,224,224,224,224
	db 192,192,192,192,192,32,16,48
;Definition sprite 12, name: Enemy-left-2
	db 3,5,7,7,3,7,15,23
	db 7,7,7,7,7,4,2,6
	db 128,128,128,192,224,224,224,224
	db 192,192,192,192,192,64,64,128
;Definition sprite 13, name: Enemy-2-right-1
	db 1,1,1,1,0,1,3,3
	db 7,7,7,7,7,6,1,2
	db 224,160,224,224,192,192,224,224
	db 240,224,224,224,224,160,160,64
;Definition sprite 14, name: Enemy-2-right-2
	db 3,3,3,3,1,1,3,3
	db 7,6,7,7,7,6,0,1
	db 192,64,192,192,128,192,224,160
	db 96,224,224,224,224,160,160,32
;Definition sprite 15, name: Enemy-2-left-1
	db 7,5,7,7,3,3,7,7
	db 15,7,7,7,7,5,5,2
	db 128,128,128,128,0,128,192,192
	db 224,224,224,224,224,96,128,64
;Definition sprite 16, name: Enemy-2-left-2
	db 3,2,3,3,1,3,7,5
	db 6,7,7,7,7,5,5,4
	db 192,192,192,192,128,128,192,192
	db 224,96,224,224,224,96,0,128
;Definition sprite 17, name: Enemy-2-up-1
	db 3,3,3,3,1,9,5,3
	db 3,7,15,15,15,8,2,2
	db 192,192,192,192,128,144,160,192
	db 192,224,240,240,240,208,64,64
;Definition sprite 18, name: Enemy-2-up-2
	db 3,3,3,3,1,1,1,7
	db 11,23,15,13,13,9,2,4
	db 192,192,192,192,128,128,128,224
	db 208,232,240,240,176,144,64,32
;Definition sprite 19, name: object-1-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
;Definition sprite 20, name: object-2-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
;Definition sprite 21, name: object-3-money
	db 0,0,3,7,12,29,60,127
	db 124,47,23,24,31,11,12,7
	db 0,0,192,224,48,248,60,190
	db 62,244,236,24,248,232,16,240
;Definition sprite 22, name: diban-rojo
	db 224,176,216,191,219,190,219,190
	db 219,190,219,190,219,126,59,31
	db 7,11,29,251,189,251,189,251
	db 189,251,189,251,189,250,188,248
;Definition sprite 23, name: diban-azul
	db 128,192,224,176,216,172,215,171
	db 213,171,213,107,53,27,13,7
	db 1,3,7,13,27,53,235,213
	db 171,213,171,214,172,216,176,224
FINAL: 
