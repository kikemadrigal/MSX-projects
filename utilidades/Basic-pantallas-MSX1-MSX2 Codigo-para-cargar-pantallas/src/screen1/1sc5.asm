        output "1sc5.bin"

    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO            ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org #8500   ; org se utiliza para decirle al z80 en que posición de memoria empieza nuestro programa (es la 33280 en decimal), en hezadecimal sería #8200

CHGMOD equ #005F   ; Cambia el modo de screen pero previamente necesita que se le asigne el modo en el registro a
VDP_DATA 	equ 	#98

INICIO:
	
    ld  a,5    ; La rutina CHGMOD nos obliga a poner en el registro a el modo de pantalla que queremos 
    call CHGMOD ; Mira arriba, pone la explicación, pone screen 2 y sprite de 16 sin apliar

    ;establecemos la paleta
    ld		hl,palette
    call	SetPalette

	xor		a
	ld		hl,#0000			;AHL establecido
	call	SetVdp_Write

			
	;mandamos los datos
	ld		hl,dibujo					;el bitmap empieza aquí
	ld		de,palette-dibujo			;esto es sólo el tamaño del bitmpa (número de bytes)
    call	myldirvm

SetPalette:
    xor a           ; set p#pointer to zero.
    di
    out (#99),a
    ld a,16+128
    ei
    out (#99),a
    ld bc,#209A     ; out 32x to port #9A
    otir
    ret
SetVdp_Write: 
    rlc     h
    rla
    rlc     h
    rla
    srl     h
    srl     h
    out     (#99),a       ;pone bits 15-17
    ld      a,14+128
    out     (#99),a
    ld      a,l           ;pone bits 0-7
    nop
    out     (#99),a
    ld      a,h           ;pone bits 8-14
    or      64            ; + para escritura
    out     (#99),a       
    ret
myldirvm:
    ld      c,VDP_DATA
.myldirvm_lp:
    ld		a,(hl)
    out		(c),a
    inc		hl
    dec		de
    ld		a,d
    or		e
    jp		nz,.myldirvm_lp

    ret	

;Para conseguir este dibujo hemos utilizado 3 herramietas:
; gimp para transformarla en 256px x 212px 16 colores,
; bmptraw para extraer los datos del bmp, ordenarlos y quitarle la cabecera, develve un fichero raw y la paleta
; HxD para dejar solo 22000 bytes o 55F0 ya que basic no nos deja más espacio 
; recortada a 5550
dibujo:
   incbin  "./src/screen1/1.raw"
palette:
	incbin	"./src/screen1/1.pal"
	


FINAL:











