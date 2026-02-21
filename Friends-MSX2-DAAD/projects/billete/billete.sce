; Base de datos para DAAD V2.40 - 2.42 generada por Triz2DAAD.
;
; Secci¢n de definiciones.
;
; Establece el s¡mbolo ROWS para representar 32 filas (de ventana de texto) en el caso del PCW
; y 25 en todos los dem s.
; 
#IF PCW
 #define ROWS 32
#ELSE
 #define ROWS 25
#ENDIF
;
; Define valores por defecto para la posici¢n de la ventana de texto.
#define textrow1 14 ; Posici¢n de la ventana de texto en localidades con gr fico.
#define textrow2 0 ; Posici¢n de la ventana de texto en localidades sin gr fico.
;
; Define valores por defecto para papel y tinta tanto de la ventana de texto como de la barra de estado
;
; Valores para PC.
;
#IF PC
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 15     ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para ZX SPECTRUM
;
#IF SPE
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 1      ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para COMMODORE 64
;
#IF CBM64
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 1      ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para AMSTRAD CPC
;
#IF CPC
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 1      ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para MSX
;
#IF MSX
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 1      ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para ATARI ST
;
#IF ST
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 15     ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para AMIGA
;
#IF AMIGA
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 15     ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
; Valores para PCW
;
#IF PCW
 #define bg_colour 0      ; Color de fondo (papel) de la ventana principal de texto.
 #define fg_colour 1      ; Color del texto (tinta) de la ventana principal de texto.
#ENDIF
;
#define NOTCREATED 252
#define TRUE 1
#define FALSE 0
;
; Atributos para el sistema.
;
#define WEARABLE  23            ; Objeto actual es ropa.
#define CONTAINER 31            ; Objeto actual es contenedor.
#define LISTED    55            ; Objetos - listados por LISTOBJ etc
#define OA_CLIST  54            ; - Listado continuo
#define OO_CLIST  64
#define TIMEOUT   87            ; If Timeout last frame
#define IA_RBUF   85            ; Input - recall buffer
#define IO_RBUF   32
#define IA_PINP   84            ; - reprint in stream
#define IO_PINP   16
#define IA_CSTR   83            ; - clear stream
#define IO_CSTR   8
#define IA_TAKEY  82            ; - timeout on any key
#define IO_TAKEY  4
#define IA_TMORE  81            ; - timeout on More...
#define IO_TMORE  2
#define IA_TSTAR  80            ; - timeout at start of input
#define IO_TSTAR  1
#define GMODE     247           ; Gr ficos - disponibles
#define GA_MDRW   246           ; - Dibujo invisible (drawstring)
#define GO_MDRW   64
#define GA_POFF   245           ; - Im genes OFF (drawstring)
#define GO_POFF   32
#define GA_WKEY   244           ; - Espera despu‚s de dibujar (drawstring)
#define GO_WKEY   16
#define GA_CBOR   243           ; - Cambia BORDER (drawstring)
#define GO_CBOR   8
#define MOUSE     240           ; rat¢n disponible (s¢lamente !DRAW)
;
#define O2      152     ; Offset de los atributos del segundo objeto
;
; Banderas del sistema 0 - 63
;
#define Dark      0
#define NOCarr    1
#define Work1     2     ; These are system as we consider the stack such
#define Work2     3
#define Stack    24     ; A small stack (always 2 bytes pushed) 10 pushes
#define EMPTY    23     ; Stack can run from here
#define FULL      3     ; to here - There will be an internal one soon
#define O2Num    25     ; 1st free in system 64
#define O2Con    26     ; Objeto 2 es contenedor.
#define O2Loc    27
#define DarkF    28
#define GFlags   29     ; Esto se prueba mejor usando HASAT GMODE
#define Score    30
#define Turns    31     ; 2 bytes
#define Verb     33
#define Noun1    34
#define Adject1  35
#define Adverb   36
#define MaxCarr  37
#define Player   38
#define O2Att    39     ; Usar banderas 39 y 40 para los atributos de otro objeto.
#define InStream 41
#define Prompt   42
#define Prep     43
#define Noun2    44
#define Adject2  45
#define CPNoun   46
#define CPAdject 47
#define Time     48
#define TIFlags  49
#define DAObjNo  50
#define CONum    51
#define Strength 52
#define OFlags   53
#define COLoc    54
#define COWei    55
#define COCon    56
#define COWR     57
#define COAtt    58
#define Key1     60
#define Key2     61
#define ScMode   62     ; 2=Text, 4=CGA, 13=EGA, 141=VGA
#define CurWin   63     ; Qu‚ ventana est  activa en este momento.
;
; Grupos £tiles.
; 
#define Z80 SPE+MSX+CPC+PCW
#define M6502 CBM64
#define M68000 ST+AMIGA
#define I86 PC
;
/CTL
_
/TOK
_____
_que_
a_de_
o_de_
_una_
_del_
s_de_
_de_l
_con_
ente_
_por_
_est 
tiene
s_un_
ante_
_para
_las_
entra
n_el_
e_de_
a_la_
erior
ci¢n_
ando_
iente
_el_
_la_
_de_
_con
_en_
los_
ado_
_se_
esta
_un_
las_
enta
_des
_al_
ada_
as_
es_
os_
_y_
ado
te_
ada
la_
ent
res
que
an_
o_p
rec
ido
s,_
ant
ina
ida
lar
ero
mpl
a_
o_
er
es
or
ar
al
en
as
os
e_
an
el
on
in
ci
un
._
co
re
di
,_
ur
tr
de
su
ab
ol
am
st
cu
s_
ac
il
gr
ad
te
y_
im
to
ue
pi
gu
ch
ca
la
n_
ro
ri
lo
mi
l_
ti
ob
me
si
pe
_n
tu
at
fi
do
em
ay
".
ll
;------------------------------------------------------------------------------
/VOC
;
; Secci¢n de vocabulario del juego.
;
; Movimiento: verbos y nombres < 14 X
;
N       2       noun
NORTE   2       noun
S       3       noun
SUR     3       noun
E       4       noun
ESTE    4       noun
O       5       noun
OESTE   5       noun
NE      6       noun
NORES   6       noun
NO      7       noun
NOROE   7       noun
SE      8       noun
SURES   8       noun
SO      9       noun
SUROE   9       noun
AR      10      noun
ARRIBA  10      noun
SUBIR   10      verb
SUBE    10      verb
AB      11      noun
ABAJO   11      noun
BAJAR   11      verb
BAJA    11      verb
ENTRA   12      verb
DENTRO  12      noun
SALIR   13      verb
SAL     13      verb
FUERA   13      noun
;
; Nombres <20 indica que se pueden usar como verbos
;         <50 indica nombre propio (no admite lo, la...)
;
I       14      noun
INVEN   14      noun
TODO    20      noun
TODOS   20      noun
TODAS   20      noun
;
; Objetos definidos por el usuario en el mapa visual, si los hubiera.
;
BOLSA      50      noun
PIEDRA      51      noun
BILLETE      52      noun
;
; Verbos
;
COGER   20      verb
COGE    20      verb
COGEL   20      verb
DEJAR   21      verb
DEJA    21      verb
DEJAL   21      verb
SOLTAR  21      verb
QUITAR  22      verb
PONER   23      verb
PONTE   23      verb
MIRAR   24      verb
M       24      verb
REDES   24      verb
R       24      verb
F       25      verb
FIN     25      verb
SAVE    26      verb
LOAD    27      verb
RAMSA   28      verb
RAMLO   29      verb
EX      30      verb
EXAMI   30      verb
DECIR   31      verb
PREGUNT 31      verb
HABLAR  31      verb
SALIDAS 32      verb
AYUDA   33      verb
METER   34      verb
METE    34      verb
METEL   34      verb
INTRO   34      verb
SACAR   35      verb
SACA    35      verb
SACAL   35      verb
EXTRA   35      verb
VACIAR  36      verb
;
; Adjetivos
;
PEQUE   2       adjective
GRANDE  3       adjective
VIEJO   4       adjective
VIEJA   4       adjective
NUEVO   5       adjective
NUEVA   5       adjective
DURO    6       adjective
DURA    6       adjective
BLANDO  7       adjective
CORTO   8       adjective
CORTA   8       adjective
LARGO   9       adjective
LARGA   9       adjective
;
; Adverbios
;
RAPID   2       adverb
R PID   2       adverb
DESPA   3       adverb
LENTA   3       adverb
CUIDA   5       adverb
;
; Preposiciones
;
A       2       preposition
DE      3       preposition
EN      4       preposition
POR     5       preposition
TRAVES  5       preposition
BAJO    7       preposition
JUNTO   8       preposition
MENOS   13      preposition
;
; Pronombres
;
;
; Conjunciones (mal llamadas "conjugation" en el DAAD). :-)
;
Y       2       conjugation
ENTONCE 2       conjugation
LUEGO   2       conjugation
;
/STX
;
; Mensajes del sistema (en segunda persona).
;
/0
Est  demasiado oscuro para ver nada.
/1
Tambi‚n puedes ver: 
/2

¨Qu‚ haces ahora?
/3

¨Qu‚ quieres hacer?
/4

¨Qu‚ quieres hacer ahora?
/5

¨Qu‚ haces?
/6
No he entendido nada.

/7
No puedes ir en esa direcci¢n.

/8
No puedes hacer eso.

/9
Llevas:

/10
Llevas puesto:

/11 ;*Libre
/12
¨Seguro?
/13
¨Quieres intentarlo de nuevo?
/14 ;*Libre
/15
Vale.

/16
Pulsa una tecla para continuar.

/17 ;*Has jugado
/18 ;*\sturno
/19 ;*s
/20 ;*.[CR]
/21 ;*Has resuelto un
/22 ;*%[CR]
/23
No llevas eso puesto.

/24
No puedes. Tienes puesto _.

/25
Ya tienes _.

/26
Aqu¡ no hay nada de eso.

/27
No puedes llevar nada m s.

/28
No tienes eso.

/29
Ya llevas puesto _.

/30     ;Un solo caracter en may£sculas. Inicial de S¡
S
/31     ;Un solo caracter en may£sculas. Inicial de No
N
/32
Hay m s...
/33

>
/34 ;*Libre
/35

El tiempo pasa...

/36
Has cogido _.

/37
Te has puesto _.

/38
Te has quitado _.

/39
Has dejado _.

/40
No puedes ponerte _.

/41
No puedes quitarte _.

/42
No puedes quitarte _.  No puedes llevar nada m s en las manos.

/43
@ pesa demasiado para t¡.

/44
@ est  en 
/45
@ no est  en 
/46
, 
/47
 y 
/48
.

/49
No tienes _.

/50
No llevas puesto _.

/51
.

/52
No hay nada de eso en
/53
Nada.

/54 ;Inicial de Cinta
C
/55 ;Disco
D
/56
Unidad no preparada. Pulsa una tecla para volver a intentarlo.

/57
Error de entrada/salida.

/58
El disco o el directorio puede estar lleno.

/59
Nombre de fichero no v lido.

/60
Nombre del fichero:
/61
Pon en marcha la cinta.

/62
¨Cinta o disco?
/63
No ves nada extra¤o en _.

/64
En _ ves:

;
/MTX
;
; Mensajes del juego.
;
; Los mensajes 0 a 13 se usan por Triz2DAAD para su rutina de listado de salidas (process 10).
;
/0
Salidas visibles: 
/1
ninguna
/2
norte 
/3
sur 
/4
este 
/5
oeste 
/6
noreste 
/7
noroeste 
/8
sureste 
/9
suroeste 
/10
arriba 
/11
abajo 
/12
entrar 
/13
salir 
;
; El mensaje 14 se usa por Triz2DAAD como texto de introducci¢n del juego.
;
/14
Texto introductorio de la aventura (editar en mensaje 14).
;
;
; Triz2DAAD usa 2 mensajes para la pantalla de ayuda.
;
/15
 PANTALLA DE AYUDA
/16
Las aventuras conversacionales son juegos de texto basados en la exploraci¢n de localidades y la manipulaci¢n de objetos al alcance inmediato del protagonista.


Las acciones se comunican al ordenador mediante frases sencillas del tipo "acci¢n-objeto".


El movimiento se efectua mediante puntos cardinales "IR NORTE", "SUR", "OESTE" o sus abreviaturas: N, S, E, O. Ocasionalmente ¢rdenes como "SUBIR", o "ENTRAR" tambi‚n funcionar n.


Acciones comunes con los objetos son "COGER objeto", "DEJAR", "EXAMINAR" (o su abreviatura "EX"). "INVENTARIO" (o "I") lista los objetos llevados. "MIRAR" o "M" redescribe la localidad.

;
/OTX
;
; Texto para los listados de los objetos.
;
/0
una Bolsa  [1] 
/1
una Piedra [1]
/2
un Billete [m]
;
/LTX
;
; Texto de las localidades.
;
/0
El Billete


por:  MSX SPAIN


Mientras estaba en la parada del autob£s, el billete de subida fue arrebatado por un golpe de viento y luego cogido y llevado por un pajarito hasta un cercano parque.

MIentras esperaba el autob£s una r faga de viento se llev¢ mi billete ¨Puede usted aydarme a encontralo?


/1
Estoy en la parada del autob£s en una calle direcci¢n Norte - Sur. Al Oeste queda un parque cuya verja de hierro est  abierta.
/2
La hierba sobre la cual camino est  muy cuidada, Hacia el Norte hay un c¢modo banco y hacia el Este queda un estanque.
/3
Estoy en un camino de graba que va de Este a Oeste, muy cercano a un c¢modo banco. Hacia el Sur hay u cuidado cesped y hacia el Norte hay un Pabell¢n de m£sica.
/4
Esto en el Pabell¢n de m£sica. Al Sur hay un camino de graba.
/5
El sol crea bellos efectos de luz en la superficie del estanque, mecida por una suave brisa, hay un camino al norte que termina en un lloroso Sauce, al Este queda un cuidado cesped.
/6
Estoy al lado de un sauce llor¢n, al Sur queda el estanque.
/7
Estoy sentado en una rama del sauce, con una visi¢n panor mica del parque, lejos al Este, m s all  de la verja del parque, puedo ver la parada del autob£s.
;
/CON
;
; Tabla de conexiones entre localidades.
;
/0
/1
O 3
/2
N 3
O 5
NO 6
/3
E 1
N 4
S 2
O 6
SO 5
/4
S 3
/5
N 6
E 2
NE 3
/6
S 5
E 3
SE 2
ARRIBA 7
/7
ABAJO 6
;
/OBJ
;
; Tabla de definici¢n de objetos:
; -Localidad inicial.
; -Peso.
; -Atributos de contenedor y ropa.
; -16 atributos definibles por el usuario.
; -Nombre y adjetivo.
;
/0 1 1 _ _   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  BOLSA _
/1 2 1 _ _   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  PIEDRA _
/2 7 1 _ _   _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  BILLETE _
;
/PRO 0

; PRO 0 es el primer proceso en ejecutarse en DAAD.

; Si estamos en la localidad 0 (inicio del juego)
; llama al proceso de inicializaci¢n (PRO 6).

_       _       AT 0
                PROCESS 6

; Establece la posici¢n de la ventana de texto.

_       _       PROCESS 9

; Establece el flag DarkF en funci¢n del flag Dark y de la
; presencia o no de fuentes de luz (en principio el objeto 0, aunque Triz2DAAD puede cambiar eso).

_       _       CLEAR DarkF
                NOTZERO Dark
                ABSENT 0
                SET DarkF

; Si hay un gr fico en la posici¢n correspondiente a la localidad del jugador
; lo carga y, si no est  oscuro, lo dibuja.

_       _       WINDOW  0
                PICTURE [Player]
                DISPLAY [DarkF]

; Pasa a la ventana de texto. Si no hay luz, imprime el mensaje de sistema 0
; "No se ve nada".

_       _       WINDOW 1
                NOTZERO DarkF
                SYSMESS 0

; En caso contario (s¡ hay luz) imprime la descripci¢n correspondiente
; a la localidad actual.

_       _       ZERO DarkF
                DESC [Player]

; Llama al proceso 3.

_       _       PROCESS 3

; Llama al proceso 1.

_       _       PROCESS 1

;------------------------------------------------------------------------------
/PRO 1

; Llamado desde PRO 0.

; Llama a PRO 4, antiguo proceso 2 del PAWS.

_       _       PROCESS 4

; Recibe y analiza el input del jugador.

_       _       PARSE 0
                PROCESS 2
                REDO

; Entradas para el contador de turnos.

_       _       EQ Turns 255
                EQ Turns+1 255
                CLEAR Turns
                CLEAR Turns+1
                SKIP 2

_       _       EQ Turns 255
                PLUS Turns+1 1
                CLEAR Turns
                SKIP 1

_       _       PLUS Turns 1

; Llama a PRO 5. Si al volver se ha ejecutado una acci¢n
; continua el bucle del juego recomenzando el PRO 1.

_       _       PROCESS 5
                ISDONE
                REDO

; Si no, trata de mover al jugador. Si lo consigue
; continua el bucle del juego recomenzando el PRO 0.

_       _       MOVE Player
                RESTART

; Si no, mira si el verbo de la SL (sentencia l¢gica) era de movimiento,
; en cuyo caso imprime el mensaje de sistema 7 "no puedes ir en esa direcci¢n" y
; el bucle del juego continua recomenzando PRO 1.

_       _       NEWTEXT
                LT Verb 14
                SYSMESS 7
                REDO

; Y si llega hasta aqu¡, imprime el mesaje de sistema 8 ("no puedes hacer eso") y
; el bucle del juego continua recomenzando PRO 1.

_       _       SYSMESS 8
                REDO

;------------------------------------------------------------------------------
/PRO 2

; Llamado desde PRO 1.

_       _       HASAT TIMEOUT
                SYSMESS 35
                DONE

_       _       SYSMESS 6

;------------------------------------------------------------------------------
/PRO 3

; PRO 3 es el antiguo "process 1" de PAWS.
; Se le llama desde PRO 0.
; Se ejecuta justo despu‚s de la descripci¢n de la localidad.

; Listado de salidas (si no est  oscuro).

_       _       NEWLINE
                ZERO DarkF
                PROCESS 10

; Listado de objetos (si no est  oscuro).

_       _       NEWLINE
                ZERO DarkF
                LISTOBJ

;------------------------------------------------------------------------------
/PRO 4

; PRO 4 equivale a la antigua "status table" de Quill o al antiguo "process 2" en PAWS.
; Se le llama desde PRO 1.
; Se ejecuta justo antes de que el parser pida una nueva ¢rden o sentencia l¢gica

/PRO 5

; PRO 5 equivale a la antigua "events table" de Quill o a la "tabla de respeuestas" de PAWS.
; Se le llama desde PRO 1.

; Entrada a¤adida por Triz2DAAD para pantallas de ayuda.

AYUDA   _       PROCESS 7
                CLS
                MESSAGE 15
                MESSAGE 16
                ANYKEY
                RESTART

EXAMI   _       WHATO
                NOTEQ 51 255
                PRESENT [51]
                HASAT CONTAINER
                SYSMESS 64
                LISTAT [51]
                DONE

EXAMI   _       WHATO
                NOTEQ 51 255
                PRESENT [51]
                SYSMESS 63
                DONE

EXAMI   _       NOTDONE

SALID   _       PROCESS 10
                DONE

VACIA   _       WHATO
                NOTEQ 51 255
                PRESENT [51]
                HASAT CONTAINER
                COPYFF Noun1 Noun2
                SYNONYM SACAR TODO

VACIA   _       NOTDONE


I       _       SYSMESS 9
                LISTAT CARRIED
                SYSMESS 10
                LISTAT WORN
                DONE

COGER   TODO    DOALL HERE
COGER   _       AUTOG
                DONE

DEJAR   TODO    DOALL CARRIED
DEJAR   _       AUTOD
                DONE

QUITAR  TODO    DOALL WORN
QUITAR  _       AUTOR
                DONE

PONER   TODO    DOALL CARRIED
PONER   _       AUTOW
                DONE

R       _       EQ 34 255
                RESTART

R       _       LET 33 30
                REDO

FIN     _       QUIT
                END

FIN     _       DONE

SAVE    _       SAVE 0
                RESTART

LOAD    _       LOAD 0
                RESTART

RAMSA   _       RAMSAVE
                RESTART

RAMLO   _       RAMLOAD 255
                RESTART

MIRAR   _       RESTART

/PRO 6

; Proceso de inicializaci¢n.
; Llamado desde PRO 0.

; -Colores de papel-tinta iniciales.
; -Recoloca las ventanas de texto y gr ficos.

_       _       WINDOW 1
                PAPER bg_colour
                INK fg_colour
                CLS
                PROCESS 9

; -Describe localidad 0 (normalmente pantalla de presentaci¢n).
; -Muestra texto de introducci¢n.
; -Comienza el bucle de reseteo de banderas.

_       _       DESC 0
                ANYKEY
                CLS
                MESSAGE 14
                ANYKEY
                SET 255

; Pone a 0 todas las banderas excepto la 29 (GFlags).

_       _       MINUS 255 1
                NOTEQ 255 GFlags
                CLEAR [255]

_       _       NOTZERO 255
                SKIP -2

; -Pone las localidades de los objetos a su valor original (establecido en /OBJ).
; -Valores por defecto de las banderas 52, 37, 46, 47 y 53.
; -Establece la localidad inicial.

_       _       RESET
                LET Strength 10
                LET MaxCarr 4
                SET CPNoun
                SET CPAdject
                LET OFlags 64
                GOTO 1

/PRO 7

; Texto "arriba."

_       _       WINDOW 1
                WINAT textrow2 0
                WINSIZE ROWS 127
                CLS

/PRO 8

; Texto "abajo."

_       _       WINDOW 1
                WINAT textrow1 0
                WINSIZE ROWS 127
                CLS

/PRO 9

; Recoloca la ventana de texto.

_       _       PICTURE [Player]
                PROCESS 8
                DONE

_       _       PROCESS 7

/PRO 10

; Listado autom tico de salidas
; ­OJO!, gasta los flags 100 y 101

_       _       MES 0
                CLEAR 101
                LET 33 2

_       _       COPYFF 38 100
                MOVE 100
                MES [33]
                PLUS 101 1

_       _       PLUS 33 1
                LT 33 14
                SKIP -2

_       _       NOTZERO 101
                DONE

_       _       MESSAGE 1

