;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _srand
	.globl _rand
	.globl _puts
	.globl _printf
	.globl _GetTime
	.globl _StrLen
	.globl _WaitKey
	.globl _Cls
	.globl _Locate
	.globl _PrintChar
	.globl _palabra_seleccionada
	.globl _arrayPalabras
	.globl _vidas
	.globl _letras_acertadas
	.globl _palabra_sin_resolver
	.globl _numero_letras_palabra_seleccionada
	.globl _inicializar_variables_juego
	.globl _loop_principal
	.globl _comprobar_tecla_resuelta
	.globl _obtener_segundos
	.globl _seleccionar_palabra_del_array
	.globl _obtener_tamanio_string
	.globl _obtener_tecla_del_teclado
	.globl _pausar_hasta_que_se_pulsa_una_tecla
	.globl _convertir_letra_a_mayuscula
	.globl _chequear_vidas
	.globl _comprobar_ganador
	.globl _comprobar_que_la_letra_esta_en_la_palabra
	.globl _mostrar_palabra_sin_resolver
	.globl _posicionar_cursor_en_pantalla
	.globl _mostrar_ahorcado_con_las_vidas
	.globl _mostrar_palabra_seleccionada
	.globl _borrar_pantalla
	.globl _imprimirCharacter
	.globl _terminar_programa
	.globl _menu
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_numero_letras_palabra_seleccionada::
	.ds 2
_palabra_sin_resolver::
	.ds 15
_letras_acertadas::
	.ds 2
_vidas::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_arrayPalabras::
	.ds 1500
_palabra_seleccionada::
	.ds 1
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
;main.c:74: int main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:77: menu();
	call	_menu
;main.c:78: pausar_hasta_que_se_pulsa_una_tecla();
	call	_pausar_hasta_que_se_pulsa_una_tecla
;main.c:79: inicializar_variables_juego();
	call	_inicializar_variables_juego
;main.c:80: loop_principal();
	call	_loop_principal
;main.c:81: return 0;
	ld	hl, #0x0000
;main.c:82: }
	ret
_Done_Version:
	.ascii "Made with FUSION-C 1.2 (ebsoft)"
	.db 0x00
;main.c:86: void inicializar_variables_juego(){
;	---------------------------------
; Function inicializar_variables_juego
; ---------------------------------
_inicializar_variables_juego::
;main.c:87: numero_letras_palabra_seleccionada=0;
	ld	hl, #0x0000
	ld	(_numero_letras_palabra_seleccionada), hl
;main.c:88: letras_acertadas=0;
	ld	l, #0x00
	ld	(_letras_acertadas), hl
;main.c:89: vidas=7;
	ld	l, #0x07
	ld	(_vidas), hl
;main.c:90: seleccionar_palabra_del_array();
;main.c:91: }
	jp  _seleccionar_palabra_del_array
;main.c:97: void loop_principal(){
;	---------------------------------
; Function loop_principal
; ---------------------------------
_loop_principal::
	call	___sdcc_enter_ix
	dec	sp
;main.c:101: char tecla_covertida_en_mayuscula='@';
	ld	b, #0x40
;main.c:102: char tecla_ultima_vez=' ';
	ld	-1 (ix), #0x20
;main.c:107: while(vidas>0){
00107$:
	xor	a, a
	ld	iy, #_vidas
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	jp	P, 00110$
;main.c:109: borrar_pantalla();
	push	bc
	call	_borrar_pantalla
	call	_mostrar_ahorcado_con_las_vidas
	call	_mostrar_palabra_sin_resolver
	pop	bc
;main.c:116: if(tecla_covertida_en_mayuscula!='@'){
	ld	a, b
	sub	a, #0x40
	jr	Z,00102$
;main.c:117: printf("\n\rTecla pulsada: %c",tecla_covertida_en_mayuscula);
	ld	c, b
	ld	b, #0x00
	push	bc
	ld	hl, #___str_1
	push	hl
	call	_printf
	pop	af
	pop	af
00102$:
;main.c:122: printf("\n\rEsperando que pulse una letra...\n");
	ld	hl, #___str_3
	push	hl
	call	_puts
	pop	af
;main.c:124: letra_obtenida_del_teclado=obtener_tecla_del_teclado();
	call	_obtener_tecla_del_teclado
	ld	a, l
;main.c:126: tecla_covertida_en_mayuscula=convertir_letra_a_mayuscula(letra_obtenida_del_teclado);
	push	af
	inc	sp
	call	_convertir_letra_a_mayuscula
	inc	sp
	ld	b, l
;main.c:128: if(tecla_covertida_en_mayuscula!=tecla_ultima_vez){
	ld	a, b
	sub	a, -1 (ix)
	jr	Z,00106$
;main.c:130: if (comprobar_tecla_resuelta(tecla_covertida_en_mayuscula)==0){
	push	bc
	push	bc
	inc	sp
	call	_comprobar_tecla_resuelta
	inc	sp
	ld	a, l
	pop	bc
	or	a, a
	jr	NZ,00106$
;main.c:132: comprobar_que_la_letra_esta_en_la_palabra(tecla_covertida_en_mayuscula);  
	push	bc
	push	bc
	inc	sp
	call	_comprobar_que_la_letra_esta_en_la_palabra
	inc	sp
	call	_chequear_vidas
	call	_comprobar_ganador
	pop	bc
00106$:
;main.c:140: tecla_ultima_vez=tecla_covertida_en_mayuscula;
	ld	-1 (ix), b
	jr	00107$
00110$:
;main.c:142: }
	inc	sp
	pop	ix
	ret
___str_1:
	.db 0x0a
	.db 0x0d
	.ascii "Tecla pulsada: %c"
	.db 0x00
___str_3:
	.db 0x0a
	.db 0x0d
	.ascii "Esperando que pulse una letra..."
	.db 0x00
;main.c:145: char comprobar_tecla_resuelta(char tecla_covertida_en_mayuscula){
;	---------------------------------
; Function comprobar_tecla_resuelta
; ---------------------------------
_comprobar_tecla_resuelta::
	call	___sdcc_enter_ix
;main.c:146: char encontrada=0;
	ld	c, #0x00
;main.c:153: for (int i=0;i<obtener_tamanio_string(palabra_sin_resolver);i++)
	ld	de, #0x0000
00105$:
	push	bc
	push	de
	ld	hl, #_palabra_sin_resolver
	push	hl
	call	_obtener_tamanio_string
	pop	af
	pop	de
	pop	bc
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P, 00103$
;main.c:156: if(palabra_sin_resolver[i]==tecla_covertida_en_mayuscula){
	ld	hl, #_palabra_sin_resolver
	add	hl, de
	ld	b, (hl)
	ld	a, 4 (ix)
	sub	a, b
	jr	NZ,00106$
;main.c:157: encontrada=1;
	ld	c, #0x01
00106$:
;main.c:153: for (int i=0;i<obtener_tamanio_string(palabra_sin_resolver);i++)
	inc	de
	jr	00105$
00103$:
;main.c:160: return encontrada;
	ld	l, c
;main.c:161: }
	pop	ix
	ret
;main.c:166: int obtener_segundos(){
;	---------------------------------
; Function obtener_segundos
; ---------------------------------
_obtener_segundos::
	push	af
	push	af
	push	af
;main.c:170: GetTime(&time);
	ld	hl, #0
	add	hl, sp
	push	hl
	push	hl
	call	_GetTime
	pop	af
	pop	hl
;main.c:171: sec= time.sec;
	ld	de, #0x0004
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;main.c:177: return sec;
	ld	l, c
;main.c:178: }
	pop	af
	pop	af
	pop	af
	ret
;main.c:196: void seleccionar_palabra_del_array(){
;	---------------------------------
; Function seleccionar_palabra_del_array
; ---------------------------------
_seleccionar_palabra_del_array::
;main.c:199: srand(obtener_segundos());
	call	_obtener_segundos
	push	hl
	call	_srand
	pop	af
;main.c:203: strcpy(palabra_seleccionada,arrayPalabras[rand()%NUM_PALABRAS_A_DESCIFRAR]);
	call	_rand
	ld	bc, #0x001e
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_arrayPalabras
	add	hl, de
	ld	de, #_palabra_seleccionada
	xor	a, a
00118$:
	cp	a, (hl)
	ldi
	jr	NZ, 00118$
;main.c:204: numero_letras_palabra_seleccionada=obtener_tamanio_string(palabra_seleccionada);
	ld	hl, #_palabra_seleccionada
	push	hl
	call	_obtener_tamanio_string
	pop	af
	ld	(_numero_letras_palabra_seleccionada), hl
;main.c:207: for(i=0;i<numero_letras_palabra_seleccionada;i++){
	ld	bc, #0x0000
00103$:
	ld	hl, #_numero_letras_palabra_seleccionada
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00119$
	xor	a, #0x80
00119$:
	ret	P
;main.c:208: palabra_sin_resolver[i]=' ';    
	ld	hl, #_palabra_sin_resolver
	add	hl, bc
	ld	(hl), #0x20
;main.c:207: for(i=0;i<numero_letras_palabra_seleccionada;i++){
	inc	bc
;main.c:210: }
	jr	00103$
;main.c:215: int obtener_tamanio_string(char string[]){
;	---------------------------------
; Function obtener_tamanio_string
; ---------------------------------
_obtener_tamanio_string::
;main.c:217: return StrLen(string);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_StrLen
	pop	af
;main.c:222: }
	ret
;main.c:232: char obtener_tecla_del_teclado(){
;	---------------------------------
; Function obtener_tecla_del_teclado
; ---------------------------------
_obtener_tecla_del_teclado::
;main.c:234: return WaitKey();
;main.c:239: }
	jp  _WaitKey
;main.c:240: void pausar_hasta_que_se_pulsa_una_tecla(){
;	---------------------------------
; Function pausar_hasta_que_se_pulsa_una_tecla
; ---------------------------------
_pausar_hasta_que_se_pulsa_una_tecla::
;main.c:242: WaitKey();
;main.c:247: }
	jp  _WaitKey
;main.c:264: char convertir_letra_a_mayuscula(char tecla){
;	---------------------------------
; Function convertir_letra_a_mayuscula
; ---------------------------------
_convertir_letra_a_mayuscula::
;main.c:269: if(tecla>96){
	ld	a, #0x60
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	jr	NC,00102$
;main.c:270: tecla_obtenida=tecla-32;
	ld	a, 0 (iy)
	add	a, #0xe0
	jr	00103$
00102$:
;main.c:272: tecla_obtenida=tecla;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
00103$:
;main.c:274: return tecla_obtenida;
	ld	l, a
;main.c:275: }
	ret
;main.c:277: void chequear_vidas(){
;	---------------------------------
; Function chequear_vidas
; ---------------------------------
_chequear_vidas::
;main.c:278: if(vidas==0){
	ld	iy, #_vidas
	ld	a, 1 (iy)
	or	a, 0 (iy)
	ret	NZ
;main.c:279: borrar_pantalla();
	call	_borrar_pantalla
;main.c:280: printf("\r\nHas perdido. Otra partida? ");
	ld	hl, #___str_4
	push	hl
	call	_printf
	pop	af
;main.c:281: mostrar_ahorcado_con_las_vidas();
	call	_mostrar_ahorcado_con_las_vidas
;main.c:282: char otra_partida=obtener_tecla_del_teclado();
	call	_obtener_tecla_del_teclado
	ld	a, l
;main.c:283: if(otra_partida=='s'){
	cp	a, #0x73
	jr	NZ,00104$
;main.c:284: borrar_pantalla();
	call	_borrar_pantalla
;main.c:285: inicializar_variables_juego();
	jp  _inicializar_variables_juego
00104$:
;main.c:286: }else if(otra_partida=='n'){
	sub	a, #0x6e
	ret	NZ
;main.c:287: borrar_pantalla();
	call	_borrar_pantalla
;main.c:288: terminar_programa();
;main.c:291: }
	jp  _terminar_programa
___str_4:
	.db 0x0d
	.db 0x0a
	.ascii "Has perdido. Otra partida? "
	.db 0x00
;main.c:295: void comprobar_ganador(){
;	---------------------------------
; Function comprobar_ganador
; ---------------------------------
_comprobar_ganador::
;main.c:296: if (obtener_tamanio_string(palabra_seleccionada)-letras_acertadas==0){
	ld	hl, #_palabra_seleccionada
	push	hl
	call	_obtener_tamanio_string
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_letras_acertadas
	ld	a, c
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	or	a, c
	ret	NZ
;main.c:297: borrar_pantalla();
	call	_borrar_pantalla
;main.c:298: posicionar_cursor_en_pantalla(10,8);
	ld	hl, #0x0008
	push	hl
	ld	l, #0x0a
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:299: printf("\r\nFelicidades!!!! \n\rhas ganado!!\n\rLa palabra era \n\r%s. \n\rOtra partida? s/n",palabra_seleccionada);
	ld	hl, #_palabra_seleccionada
	ex	(sp),hl
	ld	hl, #___str_5
	push	hl
	call	_printf
	pop	af
	pop	af
;main.c:300: mostrar_ahorcado_con_las_vidas();
	call	_mostrar_ahorcado_con_las_vidas
;main.c:301: char otra_partida=obtener_tecla_del_teclado();
	call	_obtener_tecla_del_teclado
	ld	a, l
;main.c:302: if(otra_partida=='s'){
	cp	a, #0x73
	jr	NZ,00104$
;main.c:303: borrar_pantalla();
	call	_borrar_pantalla
;main.c:304: inicializar_variables_juego();
	jp  _inicializar_variables_juego
00104$:
;main.c:305: }else if(otra_partida=='n'){
	sub	a, #0x6e
	ret	NZ
;main.c:306: borrar_pantalla();
	call	_borrar_pantalla
;main.c:307: printf("\r\n\n\n\nAdios.");
	ld	hl, #___str_6
	push	hl
	call	_printf
	pop	af
;main.c:308: terminar_programa();
;main.c:311: }
	jp  _terminar_programa
___str_5:
	.db 0x0d
	.db 0x0a
	.ascii "Felicidades!!!! "
	.db 0x0a
	.db 0x0d
	.ascii "has ganado!!"
	.db 0x0a
	.db 0x0d
	.ascii "La palabra era "
	.db 0x0a
	.db 0x0d
	.ascii "%s. "
	.db 0x0a
	.db 0x0d
	.ascii "Otra partida? s/n"
	.db 0x00
___str_6:
	.db 0x0d
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.db 0x0a
	.ascii "Adios."
	.db 0x00
;main.c:321: void comprobar_que_la_letra_esta_en_la_palabra(char letra){
;	---------------------------------
; Function comprobar_que_la_letra_esta_en_la_palabra
; ---------------------------------
_comprobar_que_la_letra_esta_en_la_palabra::
	call	___sdcc_enter_ix
;main.c:322: char encontrada=0;
	ld	c, #0x00
;main.c:324: for (int i=0;i<obtener_tamanio_string(palabra_seleccionada);i++)
	ld	de, #0x0000
00107$:
	push	bc
	push	de
	ld	hl, #_palabra_seleccionada
	push	hl
	call	_obtener_tamanio_string
	pop	af
	pop	de
	pop	bc
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	P, 00103$
;main.c:327: if(palabra_seleccionada[i]==letra){
	ld	hl, #_palabra_seleccionada
	add	hl, de
	ld	b, (hl)
	ld	a, 4 (ix)
	sub	a, b
	jr	NZ,00108$
;main.c:328: letras_acertadas++;
	ld	hl, (_letras_acertadas)
	inc	hl
	ld	(_letras_acertadas), hl
;main.c:329: palabra_sin_resolver[i]=letra;
	ld	hl, #_palabra_sin_resolver
	add	hl, de
	ld	a, 4 (ix)
	ld	(hl), a
;main.c:330: encontrada=1;
	ld	c, #0x01
00108$:
;main.c:324: for (int i=0;i<obtener_tamanio_string(palabra_seleccionada);i++)
	inc	de
	jr	00107$
00103$:
;main.c:333: if(encontrada==0){
	ld	a, c
	or	a, a
	jr	NZ,00109$
;main.c:334: vidas -=1;
	ld	hl, (_vidas)
	dec	hl
	ld	(_vidas), hl
00109$:
;main.c:336: }
	pop	ix
	ret
;main.c:343: void mostrar_palabra_sin_resolver(){
;	---------------------------------
; Function mostrar_palabra_sin_resolver
; ---------------------------------
_mostrar_palabra_sin_resolver::
	call	___sdcc_enter_ix
	push	af
;main.c:345: for (int i=0;i<numero_letras_palabra_seleccionada;i++){
	ld	bc, #_palabra_sin_resolver+0
	ld	de, #0x0002
	ld	hl, #0x0000
	ex	(sp), hl
00103$:
	ld	hl, #_numero_letras_palabra_seleccionada
	ld	a, -2 (ix)
	sub	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	jp	P, 00101$
;main.c:346: posicionar_cursor_en_pantalla(posicionX,12);
	push	bc
	push	de
	ld	hl, #0x000c
	push	hl
	push	de
	call	_posicionar_cursor_en_pantalla
	pop	af
	pop	af
	pop	de
	pop	bc
;main.c:347: printf("%c ", palabra_sin_resolver[i]);
	pop	hl
	push	hl
	add	hl, bc
	ld	l, (hl)
	ld	h, #0x00
	push	bc
	push	de
	push	hl
	ld	hl, #___str_7
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	de
	push	de
	ld	hl, #0x000d
	push	hl
	push	de
	call	_posicionar_cursor_en_pantalla
	pop	af
	ld	hl, #___str_8
	ex	(sp),hl
	call	_printf
	pop	af
	pop	de
	pop	bc
;main.c:350: posicionX+=2;
	inc	de
	inc	de
;main.c:345: for (int i=0;i<numero_letras_palabra_seleccionada;i++){
	inc	-2 (ix)
	jr	NZ,00103$
	inc	-1 (ix)
	jr	00103$
00101$:
;main.c:352: posicionar_cursor_en_pantalla(0,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
	pop	af
;main.c:353: }
	pop	af
	pop	ix
	ret
___str_7:
	.ascii "%c "
	.db 0x00
___str_8:
	.ascii "_ "
	.db 0x00
;main.c:363: void posicionar_cursor_en_pantalla(int x, int y){
;	---------------------------------
; Function posicionar_cursor_en_pantalla
; ---------------------------------
_posicionar_cursor_en_pantalla::
;main.c:365: Locate(x,y);
	ld	hl, #4+0
	add	hl, sp
	ld	b, (hl)
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_Locate
	pop	af
;main.c:380: }
	ret
;main.c:397: void mostrar_ahorcado_con_las_vidas(){
;	---------------------------------
; Function mostrar_ahorcado_con_las_vidas
; ---------------------------------
_mostrar_ahorcado_con_las_vidas::
;main.c:402: posicionar_cursor_en_pantalla(23,5);
	ld	hl, #0x0005
	push	hl
	ld	l, #0x17
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
	pop	af
;main.c:403: printf("Vidas: %i",vidas);
	ld	hl, (_vidas)
	push	hl
	ld	hl, #___str_9
	push	hl
	call	_printf
	pop	af
	pop	af
;main.c:406: posicionar_cursor_en_pantalla(12,16);
	ld	hl, #0x0010
	push	hl
	ld	l, #0x0c
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:407: printf("Acertadas: %i, quedan: %i",letras_acertadas, obtener_tamanio_string(palabra_seleccionada)-letras_acertadas);
	ld	hl, #_palabra_seleccionada
	ex	(sp),hl
	call	_obtener_tamanio_string
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_letras_acertadas
	ld	a, c
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	b, a
	push	bc
	ld	hl, (_letras_acertadas)
	push	hl
	ld	hl, #___str_10
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	af
;main.c:410: posicionar_cursor_en_pantalla(27,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x1b
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:411: imprimirCharacter(223);
	ld	h,#0xdf
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:412: posicionar_cursor_en_pantalla(28,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x1c
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:413: imprimirCharacter(223);
	ld	h,#0xdf
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:414: posicionar_cursor_en_pantalla(29,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x1d
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:415: imprimirCharacter(223);
	ld	h,#0xdf
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:416: posicionar_cursor_en_pantalla(30,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x1e
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:417: imprimirCharacter(223);
	ld	h,#0xdf
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:418: posicionar_cursor_en_pantalla(31,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x1f
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:419: imprimirCharacter(223);
	ld	h,#0xdf
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:423: for (posicionPoste; posicionPoste>7;posicionPoste--){
	ld	bc, #0x000e
00116$:
	ld	a, #0x07
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00175$
	xor	a, #0x80
00175$:
	jp	P, 00126$
;main.c:424: posicionar_cursor_en_pantalla(29,posicionPoste);
	push	bc
	push	bc
	ld	hl, #0x001d
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
	ld	h,#0xdd
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
	pop	bc
;main.c:423: for (posicionPoste; posicionPoste>7;posicionPoste--){
	dec	bc
	jr	00116$
;main.c:428: for (posicionPosteArriba;posicionPosteArriba>23;posicionPosteArriba--){
00126$:
	ld	bc, #0x001d
00119$:
	ld	a, #0x17
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00176$
	xor	a, #0x80
00176$:
	jp	P, 00102$
;main.c:429: posicionar_cursor_en_pantalla(posicionPosteArriba,7);
	push	bc
	ld	hl, #0x0007
	push	hl
	push	bc
	call	_posicionar_cursor_en_pantalla
	pop	af
	ld	h,#0xdd
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
	pop	bc
;main.c:428: for (posicionPosteArriba;posicionPosteArriba>23;posicionPosteArriba--){
	dec	bc
	jr	00119$
00102$:
;main.c:433: posicionar_cursor_en_pantalla(25,7);
	ld	hl, #0x0007
	push	hl
	ld	l, #0x19
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:434: imprimirCharacter(221);
	ld	h,#0xdd
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:435: posicionar_cursor_en_pantalla(25,8);
	ld	hl, #0x0008
	push	hl
	ld	l, #0x19
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:436: imprimirCharacter(221);
	ld	h,#0xdd
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:437: if(vidas<6){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x06
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:439: posicionar_cursor_en_pantalla(25,9);
	ld	hl, #0x0009
	push	hl
	ld	l, #0x19
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:440: imprimirCharacter(0x99);
	ld	h,#0x99
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:441: if(vidas<5){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x05
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:443: posicionar_cursor_en_pantalla(25,10);
	ld	hl, #0x000a
	push	hl
	ld	l, #0x19
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:444: imprimirCharacter(0xdb);
	ld	h,#0xdb
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:445: if(vidas<4){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x04
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:447: posicionar_cursor_en_pantalla(24,10);
	ld	hl, #0x000a
	push	hl
	ld	l, #0x18
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:448: imprimirCharacter(0xa9);
	ld	h,#0xa9
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:449: if(vidas<3){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x03
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:451: posicionar_cursor_en_pantalla(26,10);
	ld	hl, #0x000a
	push	hl
	ld	l, #0x1a
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:452: imprimirCharacter(0xaa);
	ld	h,#0xaa
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:453: if(vidas<2){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x02
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:455: posicionar_cursor_en_pantalla(25,11);
	ld	hl, #0x000b
	push	hl
	ld	l, #0x19
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:456: imprimirCharacter(0xc6);
	ld	h,#0xc6
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:458: if(vidas<1){
	ld	iy, #_vidas
	ld	a, 0 (iy)
	sub	a, #0x01
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
;main.c:459: posicionar_cursor_en_pantalla(26,11);
	ld	hl, #0x000b
	push	hl
	ld	l, #0x1a
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:460: imprimirCharacter(0xc6);
	ld	h,#0xc6
	ex	(sp),hl
	inc	sp
	call	_imprimirCharacter
	inc	sp
;main.c:469: }
	ret
___str_9:
	.ascii "Vidas: %i"
	.db 0x00
___str_10:
	.ascii "Acertadas: %i, quedan: %i"
	.db 0x00
;main.c:473: void mostrar_palabra_seleccionada(){
;	---------------------------------
; Function mostrar_palabra_seleccionada
; ---------------------------------
_mostrar_palabra_seleccionada::
;main.c:474: posicionar_cursor_en_pantalla(10,20);
	ld	hl, #0x0014
	push	hl
	ld	l, #0x0a
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
;main.c:475: printf("Palabra: %s",palabra_seleccionada);
	ld	hl, #_palabra_seleccionada
	ex	(sp),hl
	ld	hl, #___str_11
	push	hl
	call	_printf
	pop	af
	pop	af
;main.c:476: posicionar_cursor_en_pantalla(0,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	call	_posicionar_cursor_en_pantalla
	pop	af
	pop	af
;main.c:477: }
	ret
___str_11:
	.ascii "Palabra: %s"
	.db 0x00
;main.c:485: void borrar_pantalla(){
;	---------------------------------
; Function borrar_pantalla
; ---------------------------------
_borrar_pantalla::
;main.c:487: Cls();
;main.c:497: }
	jp  _Cls
;main.c:498: void imprimirCharacter(char caracter){
;	---------------------------------
; Function imprimirCharacter
; ---------------------------------
_imprimirCharacter::
;main.c:501: PrintChar(caracter);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_PrintChar
	inc	sp
;main.c:507: }
	ret
;main.c:511: void terminar_programa(){
;	---------------------------------
; Function terminar_programa
; ---------------------------------
_terminar_programa::
;main.c:516: __endasm; 
	ld	c,#0x0
	call	#0x0005
;main.c:521: }
	ret
;main.c:523: void menu(){
;	---------------------------------
; Function menu
; ---------------------------------
_menu::
;main.c:524: printf("Bienvenido a ahorcado hecho en C para MSX");
	ld	hl, #___str_12
	push	hl
	call	_printf
;main.c:525: printf("\nPulse una tecla para jugar.\n");
	ld	hl, #___str_14
	ex	(sp),hl
	call	_puts
	pop	af
;main.c:556: }
	ret
___str_12:
	.ascii "Bienvenido a ahorcado hecho en C para MSX"
	.db 0x00
___str_14:
	.db 0x0a
	.ascii "Pulse una tecla para jugar."
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__arrayPalabras:
	.ascii "TORPEDO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "GOOGLE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "SANGUIJUELA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "ONOMATOPELLA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "POETISA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "OMOPLATO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "CINTURON"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "BOCADILLO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "JARABE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "COCHE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "CENTRIFUGADO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "SUBMARINO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "DIALOGUE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "ELECTROENCEFALOGRAFISTA "
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "ADULTERIO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "NEUMATICO "
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "AUDITORES"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "PIJO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "CLARO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "MSX"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "DESOXIRRIBONUCLEICO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "CALEIDOSCOPIO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "SONRISA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "EXTRATERRESTRE"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "GALAXIA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "UMBRELLA"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "MOUNTAIN"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "STEPDAUGHTER"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "COCODRILO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.ascii "SOMBRERO"
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__palabra_seleccionada:
	.db 0x00
	.area _CABS (ABS)
