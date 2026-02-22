        output "main.bin"
    db   0FEh               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO             ; dirección de inicio
    dw   FINAL - 1          ; dirección final
    dw   MAIN               ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)
    
    
 
    org 33280               ; org se utiliza para decirle al z80 en que posición de memoria empieza nuestro programa (es la 33280 en decimal), en hezadecimal sería #8200
            
INICIO:

MAIN:
    call ERAFNK         ; Borramos las teclas
    call BCLS           ; Rutinas de consola, borra la pantalla
    call TOTEXT         ; ponemos el screen en screen mode
    ld  hl,mensaje      ; Almacena en los registro hl del z80 la dirección donde está la variable con el texto.
    call Print          ; llama a la rutina o método.
    call sumar_uno
    call sumar_uno
    call sumar_uno
    call ver_resultado_suma
    jr $                ;bucle infinito
    
sumar_uno:
    ld a,(direccion_memoria_sumar)
    add a,1
    ld (direccion_memoria_sumar),a
    ret
ver_resultado_suma:
    ld a,(direccion_memoria_sumar)
    add a,48; el 48 es donde empiezan los números en la tabla ASCII
    call CHPUT
    ret
    
;método print
Print:
    ld  a,(hl)          ; Lee el 1 byte de la dirección de la memoria indicada y lo almacena en el registro a del z80.
    and a               ; Actualiza la bandera z del registro F del z80 y la pone en 0 si no hay valor, and a también actualiza el flag c, p, v y s.
    ret z               ; Devuelve el cotrol al Main si la bandera z del registro F del z80 es 0
    call CHPUT          ; Llama a la subrutina 0042h de la Bios la cual imprime el caracter almacenado en el registro a del z80
    inc hl              ; incrementa el puntero de los registros hl para que señale al siguiente byte
    jr Print            ; Llama al métdo print para que lo vuelva a ejecutar
 


direccion_memoria_sumar db 0
mensaje: db "Hola MSX Murcia!!! ",0	; Crea una dirección en la memoria con la etiqueta mensaje, el cero indica el fin del texto
	  
    include "vars_msxBios.asm"

    
    
    
    
    
 
FINAL: