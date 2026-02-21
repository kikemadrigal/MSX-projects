;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _sys_ai_behaviour_enemy
	.globl _rand
	.globl _BoxFill
	.globl _Itoa
	.globl _PutText
	.globl _SetBorderColor
	.globl _SetColors
	.globl _JoystickRead
	.globl _Screen
	.globl _SC5SpriteColors
	.globl _SetSpritePattern
	.globl _PutSprite
	.globl _SpriteReset
	.globl _SpriteSmall
	.globl _Sprite16
	.globl _sys_create_mothership
	.globl _color_sprite_scoreboard
	.globl _color_sprite_playership
	.globl _sprite_scoreboard
	.globl _sprite_playership
	.globl _color_sprite_mothership_right
	.globl _color_sprite_mothership_left
	.globl _sprite_mothership_right
	.globl _sprite_mothership_left
	.globl _array_entities
	.globl _num_entities
	.globl _zero_type_at_the_end
	.globl _array_structs_entities
	.globl _color_sprite_enemy2
	.globl _color_sprite_enemy1
	.globl _sprite_enemy2
	.globl _sprite_enemy1
	.globl _enemy_template
	.globl _mothership_template
	.globl _player_template
	.globl _sys_entity_init
	.globl _sys_create_entity
	.globl _sys_create_player
	.globl _sys_create_enemy
	.globl _sys_entity_get_array_structs_entities
	.globl _sys_entity_get_num_entities
	.globl _sys_entity_get_max_entities
	.globl _man_sprites_init
	.globl _man_sprites_load
	.globl _sys_render_init
	.globl _sys_render_update
	.globl _sys_physics_init
	.globl _sys_physics_update
	.globl _sys_physics_check_keyboard
	.globl _sys_ai_init
	.globl _sys_ai_behaviour_mothership
	.globl _sys_ai_update
	.globl _man_game_init
	.globl _man_game_play
	.globl _scoreboard
	.globl _wait
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_array_structs_entities::
	.ds 110
_zero_type_at_the_end::
	.ds 1
_num_entities::
	.ds 1
_array_entities::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_sprite_mothership_left::
	.ds 32
_sprite_mothership_right::
	.ds 32
_color_sprite_mothership_left::
	.ds 16
_color_sprite_mothership_right::
	.ds 16
_sprite_playership::
	.ds 32
_sprite_scoreboard::
	.ds 32
_color_sprite_playership::
	.ds 16
_color_sprite_scoreboard::
	.ds 16
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;/Users/casa/Desktop/juego/src/man/entity.c:85: void sys_entity_init(){
;	---------------------------------
; Function sys_entity_init
; ---------------------------------
_sys_entity_init::
;/Users/casa/Desktop/juego/src/man/entity.c:88: memset(array_structs_entities,0,sizeof(array_structs_entities) );
	ld	hl, #_array_structs_entities
	ld	b, #0x6e
00103$:
	ld	(hl), #0x00
	inc	hl
	djnz	00103$
;/Users/casa/Desktop/juego/src/man/entity.c:89: num_entities=0;
	ld	hl,#_num_entities + 0
	ld	(hl), #0x00
;/Users/casa/Desktop/juego/src/man/entity.c:90: }
	ret
_player_template:
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x64	; 100	'd'
	.db #0xaa	; 170
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
_mothership_template:
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x03	; 3
_enemy_template:
	.db #0x02	; 2
	.db #0x0b	; 11
	.db #0x64	; 100	'd'
	.db #0x3c	; 60
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
;/Users/casa/Desktop/juego/src/man/entity.c:95: TEntity* sys_create_entity(){
;	---------------------------------
; Function sys_create_entity
; ---------------------------------
_sys_create_entity::
;/Users/casa/Desktop/juego/src/man/entity.c:96: TEntity *entity=&array_structs_entities[num_entities];
	ld	bc, #_array_structs_entities+0
	ld	de, (_num_entities)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	de, hl
;/Users/casa/Desktop/juego/src/man/entity.c:97: ++num_entities;
	ld	hl, #_num_entities+0
	inc	(hl)
;/Users/casa/Desktop/juego/src/man/entity.c:98: return entity;
	ex	de,hl
;/Users/casa/Desktop/juego/src/man/entity.c:99: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:101: void sys_create_player(){
;	---------------------------------
; Function sys_create_player
; ---------------------------------
_sys_create_player::
;/Users/casa/Desktop/juego/src/man/entity.c:102: TEntity* entity=sys_create_entity();
	call	_sys_create_entity
;/Users/casa/Desktop/juego/src/man/entity.c:103: memcpy(entity,&player_template,sizeof(TEntity));
	ld	de, #_player_template+0
	ex	de, hl
	ld	bc, #0x000b
	ldir
;/Users/casa/Desktop/juego/src/man/entity.c:104: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:105: void sys_create_mothership(){
;	---------------------------------
; Function sys_create_mothership
; ---------------------------------
_sys_create_mothership::
;/Users/casa/Desktop/juego/src/man/entity.c:106: TEntity* entity=sys_create_entity();
	call	_sys_create_entity
;/Users/casa/Desktop/juego/src/man/entity.c:107: memcpy(entity,&mothership_template,sizeof(TEntity));
	ld	de, #_mothership_template+0
	ex	de, hl
	ld	bc, #0x000b
	ldir
;/Users/casa/Desktop/juego/src/man/entity.c:108: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:109: void sys_create_enemy(){
;	---------------------------------
; Function sys_create_enemy
; ---------------------------------
_sys_create_enemy::
;/Users/casa/Desktop/juego/src/man/entity.c:110: TEntity* entity=sys_create_entity();
	call	_sys_create_entity
;/Users/casa/Desktop/juego/src/man/entity.c:111: memcpy(entity,&enemy_template,sizeof(TEntity));
	ld	de, #_enemy_template+0
	ex	de, hl
	ld	bc, #0x000b
	ldir
;/Users/casa/Desktop/juego/src/man/entity.c:112: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:114: TEntity* sys_entity_get_array_structs_entities(){
;	---------------------------------
; Function sys_entity_get_array_structs_entities
; ---------------------------------
_sys_entity_get_array_structs_entities::
;/Users/casa/Desktop/juego/src/man/entity.c:115: return array_structs_entities;
	ld	hl, #_array_structs_entities
;/Users/casa/Desktop/juego/src/man/entity.c:116: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:118: char sys_entity_get_num_entities(){
;	---------------------------------
; Function sys_entity_get_num_entities
; ---------------------------------
_sys_entity_get_num_entities::
;/Users/casa/Desktop/juego/src/man/entity.c:119: return num_entities;
	ld	iy, #_num_entities
	ld	l, 0 (iy)
;/Users/casa/Desktop/juego/src/man/entity.c:120: }
	ret
;/Users/casa/Desktop/juego/src/man/entity.c:122: char sys_entity_get_max_entities(){
;	---------------------------------
; Function sys_entity_get_max_entities
; ---------------------------------
_sys_entity_get_max_entities::
;/Users/casa/Desktop/juego/src/man/entity.c:123: return MAX_ENTITIES;
	ld	l, #0x0a
;/Users/casa/Desktop/juego/src/man/entity.c:124: }
	ret
;/Users/casa/Desktop/juego/src/man/sprites.c:24: void man_sprites_init(){
;	---------------------------------
; Function man_sprites_init
; ---------------------------------
_man_sprites_init::
;/Users/casa/Desktop/juego/src/man/sprites.c:26: SpriteReset(); 
	call	_SpriteReset
;/Users/casa/Desktop/juego/src/man/sprites.c:28: Sprite16(); 
	call	_Sprite16
;/Users/casa/Desktop/juego/src/man/sprites.c:30: SpriteSmall(); 
;/Users/casa/Desktop/juego/src/man/sprites.c:31: }
	jp	_SpriteSmall
_sprite_enemy1:
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sprite_enemy2:
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_color_sprite_enemy1:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
_color_sprite_enemy2:
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
;/Users/casa/Desktop/juego/src/man/sprites.c:35: void man_sprites_load(){
;	---------------------------------
; Function man_sprites_load
; ---------------------------------
_man_sprites_load::
;/Users/casa/Desktop/juego/src/man/sprites.c:39: SetSpritePattern( playership_pattern, sprite_playership, 32);
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #_sprite_playership
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:41: SetSpritePattern( mothership_left_pattern, sprite_mothership_left, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_mothership_left
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:43: SetSpritePattern( mothership_right_pattern, sprite_mothership_right, 32);  
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_mothership_right
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:45: SetSpritePattern( enemy1_pattern, sprite_enemy1, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_enemy1
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:47: SetSpritePattern( enemy2_pattern, sprite_enemy2, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_enemy2
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:49: SetSpritePattern( scoreboard_pattern, sprite_scoreboard, 32);
	ld	h,#0x20
	ex	(sp),hl
	inc	sp
	ld	hl, #_sprite_scoreboard
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	call	_SetSpritePattern
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:51: SC5SpriteColors(0, color_sprite_playership);
	ld	hl, #_color_sprite_playership
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	call	_SC5SpriteColors
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:52: SC5SpriteColors(1, color_sprite_mothership_left);
	ld	hl, #_color_sprite_mothership_left
	ex	(sp),hl
	ld	hl, #0x0001
	push	hl
	call	_SC5SpriteColors
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:53: SC5SpriteColors(2, color_sprite_mothership_right);
	ld	hl, #_color_sprite_mothership_right
	ex	(sp),hl
	ld	hl, #0x0002
	push	hl
	call	_SC5SpriteColors
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:54: SC5SpriteColors(3, color_sprite_enemy1);
	ld	hl, #_color_sprite_enemy1
	ex	(sp),hl
	ld	hl, #0x0003
	push	hl
	call	_SC5SpriteColors
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:55: SC5SpriteColors(4, color_sprite_enemy2);
	ld	hl, #_color_sprite_enemy2
	ex	(sp),hl
	ld	hl, #0x0004
	push	hl
	call	_SC5SpriteColors
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:56: SC5SpriteColors(5, color_sprite_scoreboard);
	ld	hl, #_color_sprite_scoreboard
	ex	(sp),hl
	ld	hl, #0x0005
	push	hl
	call	_SC5SpriteColors
	pop	af
	pop	af
;/Users/casa/Desktop/juego/src/man/sprites.c:58: }
	ret
;/Users/casa/Desktop/juego/src/sys/render.c:10: void sys_render_init(){
;	---------------------------------
; Function sys_render_init
; ---------------------------------
_sys_render_init::
;/Users/casa/Desktop/juego/src/sys/render.c:11: SetColors(15,1,1);
	ld	de, #0x0101
	push	de
	ld	a, #0x0f
	push	af
	inc	sp
	call	_SetColors
	pop	af
	inc	sp
;/Users/casa/Desktop/juego/src/sys/render.c:12: SetBorderColor(0x01);
	ld	a, #0x01
	push	af
	inc	sp
	call	_SetBorderColor
	inc	sp
;/Users/casa/Desktop/juego/src/sys/render.c:13: Screen(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_Screen
	inc	sp
;/Users/casa/Desktop/juego/src/sys/render.c:14: }
	ret
_Done_Version:
	.ascii "Made with FUSION-C 1.2 (ebsoft)"
	.db 0x00
;/Users/casa/Desktop/juego/src/sys/render.c:15: void sys_render_update(TEntity *entity){
;	---------------------------------
; Function sys_render_update
; ---------------------------------
_sys_render_update::
	call	___sdcc_enter_ix
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;/Users/casa/Desktop/juego/src/sys/render.c:22: if (entity->type==entity_type_boxFill){
	ld	a, 4 (ix)
	ld	-13 (ix), a
	ld	a, 5 (ix)
	ld	-12 (ix), a
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-11 (ix), a
;/Users/casa/Desktop/juego/src/sys/render.c:23: BoxFill (entity->x,entity->y, entity->x+entity->w, entity->y+entity->h, entity->color, 0 );
	ld	a, -13 (ix)
	add	a, #0x0a
	ld	-10 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -13 (ix)
	add	a, #0x03
	ld	-8 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -13 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;/Users/casa/Desktop/juego/src/sys/render.c:22: if (entity->type==entity_type_boxFill){
	ld	a, -11 (ix)
	sub	a, #0x10
	jp	NZ,00110$
;/Users/casa/Desktop/juego/src/sys/render.c:23: BoxFill (entity->x,entity->y, entity->x+entity->w, entity->y+entity->h, entity->color, 0 );
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-8 (ix), a
	xor	a, a
	ld	-7 (ix), a
	ld	a, -13 (ix)
	ld	-3 (ix), a
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-10 (ix), a
	xor	a, a
	ld	-9 (ix), a
	ld	a, -8 (ix)
	add	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -9 (ix)
	ld	-3 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-6 (ix), a
	xor	a, a
	ld	-5 (ix), a
	ld	a, -13 (ix)
	ld	-10 (ix), a
	ld	a, -12 (ix)
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-10 (ix), a
	xor	a, a
	ld	-9 (ix), a
	ld	a, -6 (ix)
	add	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -5 (ix)
	adc	a, -9 (ix)
	ld	-11 (ix), a
	xor	a, a
	push	af
	inc	sp
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	call	_BoxFill
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	jp	00112$
00110$:
;/Users/casa/Desktop/juego/src/sys/render.c:25: PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
	ld	a, -13 (ix)
	add	a, #0x08
	ld	-4 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -13 (ix)
	add	a, #0x09
	ld	-2 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;/Users/casa/Desktop/juego/src/sys/render.c:24: }else if(entity->type==entity_type_player){
	ld	a, -11 (ix)
	dec	a
	jr	NZ,00107$
;/Users/casa/Desktop/juego/src/sys/render.c:25: PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	d, (hl)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
	jp	00112$
00107$:
;/Users/casa/Desktop/juego/src/sys/render.c:26: }else if(entity->type==entity_type_mothership){
	ld	a, -11 (ix)
	sub	a, #0x04
	jr	NZ,00104$
;/Users/casa/Desktop/juego/src/sys/render.c:27: PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	d, (hl)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
;/Users/casa/Desktop/juego/src/sys/render.c:28: PutSprite(entity->sprite+1, 8, entity->x+16, entity->y, entity->color);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	b, (hl)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	d, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	add	a, #0x10
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	inc	c
	push	bc
	inc	sp
	ld	e, a
	push	de
	ld	b, #0x08
	push	bc
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
	jr	00112$
00104$:
;/Users/casa/Desktop/juego/src/sys/render.c:29: }else if(entity->type==entity_type_enemy){
	ld	a, -11 (ix)
	sub	a, #0x02
	jr	NZ,00112$
;/Users/casa/Desktop/juego/src/sys/render.c:30: PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	d, (hl)
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_PutSprite
	pop	af
	pop	af
	inc	sp
00112$:
;/Users/casa/Desktop/juego/src/sys/render.c:34: }
	ld	sp, ix
	pop	ix
	ret
;/Users/casa/Desktop/juego/src/sys/physics.c:11: void sys_physics_init(){
;	---------------------------------
; Function sys_physics_init
; ---------------------------------
_sys_physics_init::
;/Users/casa/Desktop/juego/src/sys/physics.c:13: }
	ret
;/Users/casa/Desktop/juego/src/sys/physics.c:14: void sys_physics_update(TEntity *entity){
;	---------------------------------
; Function sys_physics_update
; ---------------------------------
_sys_physics_update::
	call	___sdcc_enter_ix
	dec	sp
;/Users/casa/Desktop/juego/src/sys/physics.c:15: if (entity->type==entity_type_player)
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	a, (de)
	dec	a
	jr	NZ,00102$
;/Users/casa/Desktop/juego/src/sys/physics.c:16: sys_physics_check_keyboard(entity);
	push	de
	push	de
	call	_sys_physics_check_keyboard
	pop	af
	pop	de
00102$:
;/Users/casa/Desktop/juego/src/sys/physics.c:17: entity->x+=entity->vx;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-1 (ix), a
	ld	l, e
	ld	h, d
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	a, (hl)
	add	a, -1 (ix)
	ld	(bc), a
;/Users/casa/Desktop/juego/src/sys/physics.c:18: entity->y+=entity->vy;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ex	de,hl
	ld	de, #0x0007
	add	hl, de
	ld	e, (hl)
	add	a, e
	ld	(bc), a
;/Users/casa/Desktop/juego/src/sys/physics.c:19: }
	inc	sp
	pop	ix
	ret
;/Users/casa/Desktop/juego/src/sys/physics.c:22: void sys_physics_check_keyboard(TEntity *entity){
;	---------------------------------
; Function sys_physics_check_keyboard
; ---------------------------------
_sys_physics_check_keyboard::
	call	___sdcc_enter_ix
;/Users/casa/Desktop/juego/src/sys/physics.c:24: entity->vx=0;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;/Users/casa/Desktop/juego/src/sys/physics.c:25: entity->vy=0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;/Users/casa/Desktop/juego/src/sys/physics.c:26: char joy = JoystickRead(0);
	push	hl
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_JoystickRead
	inc	sp
	ld	a, l
	pop	bc
	pop	hl
;/Users/casa/Desktop/juego/src/sys/physics.c:28: if(joy==3) entity->vx=1;
	cp	a, #0x03
	jr	NZ,00110$
	ld	a, #0x01
	ld	(bc), a
	jr	00112$
00110$:
;/Users/casa/Desktop/juego/src/sys/physics.c:29: else if(joy==7) entity->vx=-1; 
	cp	a, #0x07
	jr	NZ,00107$
	ld	a, #0xff
	ld	(bc), a
	jr	00112$
00107$:
;/Users/casa/Desktop/juego/src/sys/physics.c:30: else if(joy==1) entity->vy=-1;
	cp	a, #0x01
	jr	NZ,00104$
	ld	(hl), #0xff
	jr	00112$
00104$:
;/Users/casa/Desktop/juego/src/sys/physics.c:31: else if(joy==5) entity->vy=1;
	sub	a, #0x05
	jr	NZ,00112$
	ld	(hl), #0x01
00112$:
;/Users/casa/Desktop/juego/src/sys/physics.c:33: }
	pop	ix
	ret
;/Users/casa/Desktop/juego/src/sys/ai.c:13: void sys_ai_init(){
;	---------------------------------
; Function sys_ai_init
; ---------------------------------
_sys_ai_init::
;/Users/casa/Desktop/juego/src/sys/ai.c:15: }
	ret
;/Users/casa/Desktop/juego/src/sys/ai.c:17: void sys_ai_behaviour_mothership(TEntity *entity){
;	---------------------------------
; Function sys_ai_behaviour_mothership
; ---------------------------------
_sys_ai_behaviour_mothership::
	call	___sdcc_enter_ix
;/Users/casa/Desktop/juego/src/sys/ai.c:18: if(entity->x<10)
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	l, a
;/Users/casa/Desktop/juego/src/sys/ai.c:19: entity->vx=1;
	ld	a, c
	add	a, #0x06
	ld	c, a
	jr	NC,00123$
	inc	b
00123$:
;/Users/casa/Desktop/juego/src/sys/ai.c:18: if(entity->x<10)
	ld	a, l
	sub	a, #0x0a
	jr	NC,00102$
;/Users/casa/Desktop/juego/src/sys/ai.c:19: entity->vx=1;
	ld	a, #0x01
	ld	(bc), a
00102$:
;/Users/casa/Desktop/juego/src/sys/ai.c:20: if(entity->x>200 && entity->x<255 )
	ld	a, (de)
	ld	e, a
	ld	a, #0xc8
	sub	a, e
	jr	NC,00106$
	ld	a, e
	sub	a, #0xff
	jr	NC,00106$
;/Users/casa/Desktop/juego/src/sys/ai.c:21: entity->vx=-1;
	ld	a, #0xff
	ld	(bc), a
00106$:
;/Users/casa/Desktop/juego/src/sys/ai.c:22: }
	pop	ix
	ret
;/Users/casa/Desktop/juego/src/sys/ai.c:24: void sys_ai_behaviour_enemy(TEntity *entity){
;	---------------------------------
; Function sys_ai_behaviour_enemy
; ---------------------------------
_sys_ai_behaviour_enemy::
	call	___sdcc_enter_ix
	push	af
	push	af
	dec	sp
;/Users/casa/Desktop/juego/src/sys/ai.c:25: if(entity->x<20){
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-5 (ix), a
;/Users/casa/Desktop/juego/src/sys/ai.c:26: entity->vy=1;
	ld	hl, #0x0007
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
;/Users/casa/Desktop/juego/src/sys/ai.c:27: entity->vx=0;
	ld	hl, #0x0006
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
;/Users/casa/Desktop/juego/src/sys/ai.c:25: if(entity->x<20){
	ld	a, -5 (ix)
	sub	a, #0x14
	jr	NC,00102$
;/Users/casa/Desktop/juego/src/sys/ai.c:26: entity->vy=1;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x01
;/Users/casa/Desktop/juego/src/sys/ai.c:27: entity->vx=0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
00102$:
;/Users/casa/Desktop/juego/src/sys/ai.c:30: if(entity->y>190){
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	l, a
	ld	a, #0xbe
	sub	a, l
	jr	NC,00105$
;/Users/casa/Desktop/juego/src/sys/ai.c:31: entity->y=60;
	ld	a, #0x3c
	ld	(de), a
;/Users/casa/Desktop/juego/src/sys/ai.c:32: entity->x=rand()%(200-40)+40;
	push	bc
	call	_rand
	ld	de, #0x00a0
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	add	a, #0x28
	ld	(bc), a
;/Users/casa/Desktop/juego/src/sys/ai.c:33: entity->vy=0;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x00
;/Users/casa/Desktop/juego/src/sys/ai.c:34: entity->vx=1;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
00105$:
;/Users/casa/Desktop/juego/src/sys/ai.c:37: }
	ld	sp, ix
	pop	ix
	ret
;/Users/casa/Desktop/juego/src/sys/ai.c:38: void sys_ai_update(TEntity *entity){
;	---------------------------------
; Function sys_ai_update
; ---------------------------------
_sys_ai_update::
;/Users/casa/Desktop/juego/src/sys/ai.c:39: if(entity->type==entity_type_mothership)
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a, (bc)
	sub	a, #0x04
	jr	NZ,00102$
;/Users/casa/Desktop/juego/src/sys/ai.c:40: sys_ai_behaviour_mothership(entity);
	push	bc
	push	bc
	call	_sys_ai_behaviour_mothership
	pop	af
	pop	bc
00102$:
;/Users/casa/Desktop/juego/src/sys/ai.c:41: if(entity->type==entity_type_enemy)
	ld	a, (bc)
	sub	a, #0x02
	ret	NZ
;/Users/casa/Desktop/juego/src/sys/ai.c:42: sys_ai_behaviour_enemy(entity);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_sys_ai_behaviour_enemy
	pop	af
;/Users/casa/Desktop/juego/src/sys/ai.c:43: }
	ret
;src/man/game.c:19: void man_game_init(){
;	---------------------------------
; Function man_game_init
; ---------------------------------
_man_game_init::
;src/man/game.c:20: sys_render_init();
	call	_sys_render_init
;src/man/game.c:21: sys_entity_init();
	call	_sys_entity_init
;src/man/game.c:22: man_sprites_init();
	call	_man_sprites_init
;src/man/game.c:23: man_sprites_load();
	call	_man_sprites_load
;src/man/game.c:24: sys_create_player();
	call	_sys_create_player
;src/man/game.c:25: sys_create_mothership();
	call	_sys_create_mothership
;src/man/game.c:26: sys_create_enemy();
;src/man/game.c:27: }
	jp	_sys_create_enemy
;src/man/game.c:28: void man_game_play(){
;	---------------------------------
; Function man_game_play
; ---------------------------------
_man_game_play::
;src/man/game.c:29: array_entities=sys_entity_get_array_structs_entities();
	call	_sys_entity_get_array_structs_entities
	ld	(_array_entities), hl
;src/man/game.c:31: for (char i=0;i<sys_entity_get_num_entities();++i){
00112$:
	ld	c, #0x00
00106$:
	push	bc
	call	_sys_entity_get_num_entities
	pop	bc
	ld	a, c
	sub	a, l
	jr	NC,00112$
;src/man/game.c:32: TEntity *entity=&array_entities[i];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, (_array_entities)
	add	hl, de
;src/man/game.c:33: sys_ai_update(entity);
	push	hl
	push	bc
	push	hl
	call	_sys_ai_update
	pop	af
	pop	bc
	pop	hl
;src/man/game.c:34: sys_physics_update(entity);
	push	hl
	push	bc
	push	hl
	call	_sys_physics_update
	pop	af
	pop	bc
	pop	hl
;src/man/game.c:35: sys_render_update(entity);
	push	bc
	push	hl
	call	_sys_render_update
	pop	af
	pop	bc
;src/man/game.c:31: for (char i=0;i<sys_entity_get_num_entities();++i){
	inc	c
;src/man/game.c:40: }
	jr	00106$
;src/man/game.c:42: void scoreboard(){
;	---------------------------------
; Function scoreboard
; ---------------------------------
_scoreboard::
;src/man/game.c:44: TEntity *entity=&array_entities[1];
	ld	iy, #_array_entities
	ld	a, 0 (iy)
	add	a, #0x0b
	ld	l, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	h, a
;src/man/game.c:45: PutText(0,180, Itoa(entity->x,"   ",10),0);
	ld	de, #___str_1+0
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #0x000a
	push	hl
	push	de
	push	bc
	call	_Itoa
	pop	af
	pop	af
	pop	af
	xor	a, a
	push	af
	inc	sp
	push	hl
	ld	hl, #0x00b4
	push	hl
	ld	l, #0x00
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;src/man/game.c:46: PutText(0,100,"               ",0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_2
	push	hl
	ld	hl, #0x0064
	push	hl
	ld	l, #0x00
	push	hl
	call	_PutText
	pop	af
	pop	af
	pop	af
	inc	sp
;src/man/game.c:47: }
	ret
___str_1:
	.ascii "   "
	.db 0x00
___str_2:
	.ascii "               "
	.db 0x00
;src/man/game.c:49: void wait(){
;	---------------------------------
; Function wait
; ---------------------------------
_wait::
;src/man/game.c:53: __endasm;
	halt
	halt
;src/man/game.c:54: }
	ret
;main.c:4: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:5: man_game_init();
	call	_man_game_init
;main.c:6: man_game_play();
;main.c:7: }
	jp	_man_game_play
	.area _CODE
	.area _INITIALIZER
__xinit__sprite_mothership_left:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x7e	; 126
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__sprite_mothership_right:
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x38	; 56	'8'
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__color_sprite_mothership_left:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0f	; 15
__xinit__color_sprite_mothership_right:
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0f	; 15
__xinit__sprite_playership:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0xf8	; 248
__xinit__sprite_scoreboard:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0xf8	; 248
__xinit__color_sprite_playership:
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
__xinit__color_sprite_scoreboard:
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0e	; 14
	.area _CABS (ABS)
