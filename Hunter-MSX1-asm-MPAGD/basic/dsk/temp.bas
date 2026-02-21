1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E, incializamos y preparamos el sonido:&H90'
0 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&H90:a=usr2(0)

1 'Enlazamos con las rutinas de la bios para aparagar y encender la pantalla'
5 defusr3=&H41:defusr4=&H44
10 bload"nbasic.bin",r
20 open "grp:" as #1:defint a-z
30 bload"sprites.bin",s:print #1,"!Sprites leidos"
40 bload"scolor.bin",s:print #1,"!colores sprites leidos"
1 'Vamos a sacar de la pantalla los sprites'
45 for i=0 to 31: put sprite i,(0,212),,i:next i
50 bload"TILESET.S05",s,32768:print #1,"!tileset leido"
1 'Inicializamos el mapa'
70 print #1,"!Cargando mapa":gosub 13000
1 'Inicialización de las variables del juego'
1 'gx,gy son variables temporales del juego'
1 'gc=modo colisión de los sprites, gc=0 modo on sprite, gc=1 modo rectángulos'
80 gx=0:gy=0:time=0:hr=0:hs=200:ha=0
1 'Inicialización player'
100 gosub 10000
1 'Inicializamos shots'
105 gosub 11000
1 ' Rutina inicializar enemigos'
106 gosub 12000
1 'inicializamos el interruptor
107 gosub 16000
1 'Rutina barra espaciadora pulsada creamos un disparo
110 strig(0) on:on strig gosub 11100
1 'gc es si el juego está en modo colisión onsprite
1 'La rutina 10200 es cuando el player muere'
1 '120 on sprite gosub 10200:sprite on
130 bload"music.bin":defusr5=&hc000:b=usr5(0):defusr6=&hc009:b=usr6(0):defusr7=&hc017:b=usr7(0):defusr8=&hC013
1 'Mostramos la pantalla de presentación
140 gosub 14000



1 'main loop'
    2000 ha=time/60:if ho<>ha then gosub 8100
    1 'input system
    2005 gosub 3500
    1 'Physics player'
    2010 gosub 10500
    1 'Physics enemies'
    2020 gosub 12700
    1'Render player
    2030 gosub 10600
    1 'Render shots'
    2040 gosub 11300
    1 'si el mapa cambia 1 'Rutina hacer copys con mapa, 2 Escribimos en la VRAM, aumentamos el nivel:ponmeos el mc=0'
    1 '8000=mostramos la puntuación'
    2050 if mc=1 then cls:gosub 13100:gosub 13300:ma=ma+1:mc=0:gosub 8000
    1 'marcamos como que el mapa ha cambiado para que vuelva a cargarlo y le decimos que el mapa actual es el 0'
    2070 if pb=0 then mc=1:'if ma>1 then ma=0

    1 'debug'
    2080 'gosub 9000
2090 goto 2000



1 'Sistema de input'
    1 'Nos guardamos las posiciones del player antes de cambiarlas'
    2500 on stick(0) gosub 2600,2660,2700,2500,2800,2500,2860,2900
2599 return
1 '1 Arriba'
    1 'Si  no estamos saltando y lo que hay debajo en un sólido entonces salta,
    1 'Guardamos la posición vieja de y en po'
    2600 if pj=0 then po=py:pj=1:pd=3
2650 return
1 '2 arriba-derecha'
    2660 if pj=0 then po=py:pj=1 
    2670 if t3<>tw then px=px+pv:pd=3 
    2680 swap p(0),p(1):ps=p(1)
2690 return
1 're=8 es el efecto de sonido 8 de la rutina de reprodución de sonidos 2300
1 '3 derecha'
    1 'comprobamos que no hay un sólido a la derecha y despues si se ha salido lo recolocamos'
    2700 if t3<>tw then px=px+pv:pd=3
    2710 swap p(0),p(1):ps=p(1)
2720 return
1 '5 abajo'
    1 'Si lo que hay abajo es una escalera baja'
    2800 'if t5=69 then py=py+pv
2850 return
1 '7 izquierda'
    2860 if t7<>tw then px=px-pv:pd=7
    2870 swap p(2),p(3):ps=p(3)
2890 return
1 '8 izquierda-arriba'
    2900 if pj=0 then po=py:pj=1 
    2910 if t7<>tw then px=px-pv:pd=7
    2920 swap p(2),p(3):ps=p(3)
2950 return




1 'Sistema de input 2'
    1 'Nos guardamos las posiciones del player antes de cambiarlas'
    3500 on stick(0) goto 3600,3660,3700,3500,3800,3500,3860,3900
    3510 goto 3960
1 '1 Arriba'
    1 'Si  no estamos saltando y lo que hay debajo en un sólido entonces salta,
    1 'Guardamos la posición vieja de y en po'
    3600 if pj=0 then po=py:pd=3:pj=1
3610 goto 3960
1 '2 arriba-derecha'
    3660 if pj=0 then po=py:pj=1 
    3670 if t3<>tw then px=px+pv:pd=3
    3680 swap p(0),p(1):ps=p(1)
3690 goto 3960
1 're=8 es el efecto de sonido 8 de la rutina de reprodución de sonidos 2300
1 '3 derecha'
    1 'comprobamos que no hay un sólido a la derecha y despues si se ha salido lo recolocamos'
    3700 if t3<>tw then px=px+pv:pd=3 
    3710 swap p(0),p(1):ps=p(1)
3720 goto 3960
1 '5 abajo'
    1 'Si lo que hay abajo es una escalera baja'
    3800 'if t5=69 then py=py+pv
3850 goto 3960
1 '7 izquierda'
    3860 if t7<>tw then px=px-pv:pd=7
    3870 swap p(2),p(3):ps=p(3)
3890 goto 3960
1 '8 izquierda-arriba'
    3900 if pj=0 then po=py:pj=1 
    3910 if t7<>tw then px=px-pv:pd=7
    3920 swap p(2),p(3):ps=p(3)
3960 goto 2010

1 ' ----------------------'
1 '    Sound manager'
1 ' ----------------------'
1 'Reproductor de efectos d sonido'
    4300 a=usr2(0)
    4310 if re=1 then PLAY"O5 L8 V4 M8000 A A D F G2 A A A A r60 G E F D C D G R8 A2 A2 A8","o1 v4 c r8 o2 c r8 o1 v6 c r8 o2 v4 c r8 o1 c r8 o2 v6 c r8"
    1 'Tirando el paquete'
    4350 if re=5 then play "l10 o4 v4 g c"
    1 'Paquete cogido'
    4360 if re=6 then play"t250 o5 v12 d v9 e" 
    1 'Pitido normal'
    4370 if re=7 then play "O5 L8 V4 M8000 A A D F G2 A A A A"
    1 'Toque fino'
    4380 if re=8 then PLAY"S1M2000T150O7C32"
    1 'Pasos'
    4390 if re=9 then PLAY"o2 l64 t255 v10 m6500 c"
    4400 if re=10 then sound 6,5:sound 8,16:sound 12,6:sound 13,9
4420 return


1 'HUD'
    8000 preset (0,184):print #1,"Score: "pr" Vidas: "pl" cogidas: "pb
    8010 preset (0,196):print #1,"Level: "ma" balas: "pg" libre: "fre(0)
8020 return

1 'Rutina mostrar contador'
    8100 hr=hs-ha
    8110 if hr <= 0 then ha=0:time=0:hs=200
    8120 ho=ha:preset (216,204):print #1,hr
8130 return


1 'Debug'
    9000 'nada'
    1 '9010 preset (0,0): print #1," px "px" py "py" tx "tx" ty "ty
    1 '9010 preset (0,0): print #1,"pg "pg" ps "ps" pd "pd" pc "pc" px "px" py "py
    1 '9020 preset (0,8): print #1," t0 "t0" t1 "t1" t3 "t3" t5 "t5" t7 "t7  
    1 '9030 preset (0,16): print #1," a0 "a0" a1 "a1" a3 "a3" a5 "a5" a7 "a7  
    1 '9010 preset (0,0): print #1,"pj "pj" ty "ty" t5 "t5" tx "tx" t1 "t1
    1 '9010 preset (0,0): print #1,"en  "en" ex0 "ex(0)" ey0 "ey(0)" ep0 "ep(0)" es0 "es(0)
    1 '9020 preset (0,8): print #1,"ed0  "ed(0)" ee0 "ee(0)
    1 '9030 preset (0,16): print #1," ev0 "ev(0)" ev1 "ev(1)" ed0  "ed(0)" ed1 "ed(1)
    1 '9020 preset (0,16): print #1," dd "dd" dx "dx" dy "dy" ds  "ds" dp "dp
    9010 preset (0,16): print #1," mc "mc" pb "pb 
9090 return














1 ' ----------------------------------------------------------------------------------------'
1 '                                 SCREENS
1 ' ----------------------------------------------------------------------------------------'
1'------------------------------------'
1'  Pantalla de Bienvenida y records 
1'------------------------------------'
    14000 cls:preset (10,30):  print #1,"The hunter"
    1 ' Con inverse ponemos el fondo de los carcacteres en el frente y el frente en el fondo'
    14050 preset (10,160): print #1, "!Cursores para mover, pulsa una tecla para continuar"
    14060 preset (10,180): print #1, "!libre: "fre(0)
    1 'Si no se pulsa una tecla se queda en blucle infinito reproduciebdo una música, si se pulsa se para la música'
    14070 b=usr6(0)
    14080 if inkey$="" then goto 14070 
    14085 b=usr8(0)
14090 return
1'------------------------------------'
1'  Pantalla de payer muere
1'------------------------------------'
    1 'Borramos los enemigos'
    14100 en=0
    14110 cls:preset (10,30):  print #1,"Game over"
    1 'Recolocamos el player para que no se vea'
    14120 py=212
    1 'Marcamos el mapa como que ha cambiado para que lo vuelva a cargar'
    14130 mc=1: ma=0
    1 'hacemos una pequeña espera'
    14140 for i =0 to 1000:next i
    14150 goto 130
14190 return

1'------------------------------------'
1'          screen 0
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20000 en=0
    20010 'gosub 12500: ex(en-1)=14*8:ey(en-1)=9*8
    20030 gosub 12500: ex(en-1)=14*8:ey(en-1)=14*8:es(en-1)=17
    1 'Rendremos que coger 6 bloques'
    20040 pb=8
    1 'Rutina reposicionar sprite'
    20050 gosub 10100
    1 'Colocamos el interruptor'
    1 'Plano 0 player, plano 1 disparo, enemigos del 2 al 10, buo 11, mono 12, interruptor 13, jefe 14'
    1 'put sprite plano, x, y, color y sprite'
    1 '20060 put sprite 13,(256-16,19*8),,47
    1 '16300 es la rutina par apintar el switch'
    2060 sx=30*8:sy=19*8:tp=28*8:tq=7*8:gosub 16300
20090 return

1'------------------------------------'
1'          screen 1
1'------------------------------------'
    1 'Situamos al player
    1 'creamos 2 enemigos'
    20100 en=0
    1 'Rendremos que coger 6 bloques'
    20140 pb=6
    20150 px=3*8:py=18*8
20190 return

1 ' ----------------------------------------------------------------------------------------'
1 '                                END SCREENS
1 ' ----------------------------------------------------------------------------------------'



1 '-----------------------------------'
1  '       PLAYER 10000-10999
1 '-----------------------------------'

1 'inicialización player'
    1 'pv=velocidad horizontal
    1 'pw=velocidad vertical'
    1 'po=player y position old'
    1 'pd= player direction, 1 up, 3 right, 5 down, 7 left'
    1 'pj=player jump, salta activdo'
    1 'pl=player life o vida'
    1 'pr=player record, puntuación'
    1 'pb=bloques cogidos por el player'
    1 'pg=player gungs, balas, disparos que le quedan'
    10000 px=3*8:py=18*8:pv=8:pw=8:po=py:pd=3:pj=0:pl=3:pr=0:pb=0:pg=100:pc=11
    1 'para ver el sprite camnando a la derecha, izquierda, etc utilizaremos un array'
    1 'Sprite 0 camina a la dercha'
    1 'sprite 1 camina ala derecha moviéndose, no se porqué  pero si pongo dim p(6) no funciona, parece que es algo del nbasic'
    10010 p(0)=0:p(1)=1:p(2)=2:p(3)=3:p(4)=4:p(5)=5
    1 'Componente render: Plano 1(para el color) y 0 para el personaje, sprite del 0(para el color) y del 1 al 7 para el personaje'
    10020 pp=0:ps=0
10090 return

1 'Rutina reposicionar player'
    10100 px=3*8:py=18*8
    10110 'for i=1 to 16: read a:sc0$=sc0$+chr$(a):next i
    10120 'color sprite$(0)=sc0$
    10130 'put sprite pp,(px,py),,ps
    10140 'data &h0C,&h0A,&h09,&h09,&h09,&h09,&h04,&h04
    10150 'data &h04,&h04,&h04,&h04,&h04,&h04,&h08,&h08
10190 return

1 ' Rutina player dead'
    1 ' 8000 es el HUD'
    1 ' 14100 es la rutina cuando se termina el juego
    10200 if pl<=0 then gosub 14100 else beep:pl=pl-1: gosub 8000
    1 '10100 es la rutina de posición de sprite player'
    10220 gosub 10100:put sprite pp,(px,py),,ps
10290 return


1 'Physics player'
    1 'Con esto vemos los tiles que tenemos alrededor

    10500 gx=px:gy=py

    10502 gosub 13600
    1 '10501 preset (0,0): print #1," px "px" py "py" tx "tx"-"ty"-"gx"-"gy
    1 '10502 preset (0,8): print #1," t0 "t0" t1 "t1" t3 "t3" t5 "t5" t7 "t7  
    1 'Rutina salto: si esta saltando le restamos a la posición y la velocidad vertical
    10510 if pj=1 then py=py-pw
    1 'Si tenemos en la cabeza un bloque sólido bajamos'
    10511 if t1=tw then pj=2
    1 '-48 es la distancia máxima a la que puede saltar de la posición original (po), con pj=2 le decimos que está cayendo'
    10520 if pj=1 and py<po-48 then pj=2
    1 'Si cuando estemos cayendo hay un bloque sólido se termina el salto'
    10535 if t5=tw and pj=2 then pj=0
    1 'Rutina caida
    10536 if pj=2 then py=py+pw
   

    1 'Contorno, chqueamos que no se haya salido por la gravedad'
    1 '22*8=176-16 pixeles del sprite=160'

    10540 if py>160 then py=160
    10550 if py<=0 then py=0:pj=2
    1 '32*8=256-16pixeles del sprite=240'
    10551 if px>248 then px=248
    10552 if px<=0 then px=0
    1 'Chequeo escalera
    1 'Si estamos sobre una escalera subimos: la definición de esto está en el input system'
   
    1 'Chequeo bloques collectables'
    1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
    1 'Con pb-1 le decimos que queda un bloque menos por recoger'
    10568 if t0=tc then copy (8,40)-(8+8,39+8),1 to (px,py+8),0:m(ty+1,tx)=-1:beep:pb=pb-1:gosub 8000
    1 ' chequeo colisión con los tiles mortales
    10569 if t0=td then 10200

    1 'Colision del player con el interruptor'
    10570 if sx < px + 16 and sx + 16 > px and sy < py + 16 and 16 + sy > py then gosub 16400:beep:beep:beep
    1 'Gravedad'
    1 'Si no está saltando y no hay debajo un bloque sólido hacemos que caiga'
    10580 if pj=0 and t5<>tw then py=py+pv
10595 return


1 'render player'
    10600 'call turbo on (pp, px,py,ps)
    10601 put sprite pp,(px,py),,ps
    10602 'call turbo off
10690 return


 




1' ------------------------------------'
1' Rutinas disparos / fires 11000-11999 '
1' -------------------------------------'
1 'Rutina inicializar disparos'
1 'Recuerda que reservaste el espacio para X variables disparo en un array en el loader'
1 'Los disparos se irán creando dinámicamente según vayamos pulsando la barra espaciadora'
1 'Los parámteros se los metemos a ojo, la posición e y, son las del player'
1 'dn= disparo número, sirve para ir creando disparos ya que despues se incrementa'
1 'dd=disparo dirección
1 'ds=sprite'
1 'dp=plano'
1 'dc=color'
    11000 dn=0:'dd=0:dm=3
    1 '11010 DIM dx(dm),dy(dm),dv(dm),dw(dm),dd(dm),ds(dm),dp(dm),da(dm)
    11000 dx=0:dy=0:dv=8:dd=0:ds=12:dp=0:dc=11
11060 return

1 ' Rutina crear disparos'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' Si y aexiste algún disparo lo eliminamos
    11100 if dn>0 then gosub 11200
    1 'Posición'
    11120 dy=py
    11125 dd=pd:if dd=3 then dx=px+16 else dx=px
    1 'Físicas: velocidad'
    11130 dv=8
    1 'Render: el plano lo asignaremos según el número de siapros'
    11140 dp=2+dn
    11150 dn=dn+1
    1 'Hacemos un sonido'
    11170 re=10:gosub 4300
11180 return
1 'Rutina eliminar disparo
    11200 dn=dn-1
    11210 put sprite dp,(0,212),0,ds
11290 return

1 'Rutina actualizar disparos'
    1 'Si no hay disparos no pintes'
    11300 if dn<=0 then return
    1 'Si hay le sumamos la velocidad'
    11320 if dd=3 then dx=dx+dv else dx=dx-dv
    1 'put sprite numero_plano, (coordenada),color, numero de sprite'
    11330 put sprite dp,(dx,dy),dc,ds
    1 'Si está fuera de la pantalla el disparo lo eliminamos, la eliminación es con la variable dn(disparo número)'
    11340 if dx >= 256-16 then gosub 11200
    11350 if dx < 0 then gosub 11200
11390 return

1 '-----------------------------------'
1  '       Enemy 12000-12999
1 '-----------------------------------'

1 'Init
    1 'Definiendo el espacio para los arrays con los valores de los enemigos' 
    1 'em=enemigos maximos'
    1 'en=enemigo numero, variable utilizar para gestionar la creación y destrucción de enemigos'
    1 'er=enemigo a borrar, remove '
    12000 em=3
    12010 en=0
    1 'ex=coordenada x, ey=coordenada y'
    1 'ev=velocidad enemigo eje x, ew=velocidad eje y'r'
    1 'ed=enemigo dirección'
    1 'es=enemigo sprite, ep=enemigo plano'
    1 'ep=enemigo plano'
    1 'ec=enemigo color'
    1 'et= define el tipo, si es un perro, un pinguino, un pájaro, etc
    1 'ee=enemigo energia '
    1 'ef=enemigo frame'
    1 'Perro sprites derecha 13 y 14, izquierda 15 y 16 '
    1 'Conejo derecha 17,18  i<quierda 19,20'
    1 'Tortuga derecha 21,22   izquierda 23,24'
    1 'Reservamos el espacio en RAM para 5 enemigos'
    12020 DIM ex(em),ey(em),ev(em),ew(em),ed(em),es(em),ep(em),ec(em),et(em),ee(em),ef(em)
12030 return

1 ' Crear enemigo'
    12500 if en>5 then return
    12530 ev(en)=8:ew(en)=8
    12540 ed(en)=3
    12550 es(en)=13
    12560 ep(en)=10+en
    12570 ec(en)=6
    12580 en=en+1
12590 return

1 ' Rutina eliminar enemigos'
    12600 en=en-1
    12610 ex(er)=0:ey(er)=212
    12620 put sprite ep(er),(ex(er),ey(er)),0,es(er)
    12630 ex(er)=ex(en):ey(er)=ey(en):ev(er)=ev(en):es(er)=es(en):ep(er)=ep(en) 
    1 'Quitmos el sprite ya que si no se queda congelado'
    12640 'put sprite ep(ed),(-16,0),ec(ed),es(ed)
   
    12650 'en=en-1
12660 return

1 'Update enemigo'
    12700 if en<=0 then return
    12710 for i = 0 to en-1
        1 'Chequeo bloques collectables'
        1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
        1 'Lo siguiente lo necesitamos para que no compruebe el tile sobre el que estamos sino el siguiente o anterior según la dirección'
        12720 if ed(i)=3 then gx=ex(i)+8 else if ed(i)=7 then gx=ex(i)-8
        1 'La rutina 13600 nos devuelve los tiles de alrededor si le paamos primero el gx y gy'
        12730 gy=ey(i):gosub 13600

        1 'Si el tile en el que estamos no es sólido invertmos la velocidad horizontal'
        12740 if t5<>tw then ev(i)=-ev(i):if ed(i)=7 then ed(i)=3 else if ed(i)=3 then ed(i)=7
        12750 if ex(i)>256-40 then ex(i)=ex(i)-ev(i): if ex(i)<0 then ex(i)=ex(i)-ev(i)
        12755 ex(i)=ex(i)+ev(i)
        12756 ef(i)=ef(i)+1:if ef(i)>1 then ef(i)=0
        1 'Chequeamos la colisión con el player'
        1 'La rutina 10200 es cuando el player muere'
        12760 if ex(i) < px + 16 and ex(i) + 16 > px and ey(i) < py + 16 and 16 + ey(i) > py then gosub 10200
        1 'chequeamos la colisión con la bala'
        1 'La rutina 12600 es cuando el enemigo muere'
        1 'Con ed=i, almacenamos la posición de array que se va a sobreescribir con el último enemigo del array'
        1 'Con gosub 11200 eliminamos la bala'
        12770 if ex(i) < dx + 16 and ex(i) + 16 > dx and ey(i) < dy + 16 and 16 + ey(i) > dy then er=i:gosub 12600:gosub 11200
        
        1 'Sistema de animación enemigo'
        12780 if ed(i)=7 then es(i)=es(i)+2
        12785 if ef(i) mod 2 = 0 then es(i)=es(i)+1
        1 'put sprite numero_plano, (coordenada),color, numero de sprite'
        12790 put sprite ep(i),(ex(i),ey(i)),ec(i),es(i)
        12795 if ef(i) mod 2 = 0 then es(i)=es(i)-1
        12796 if ed(i)=7 then es(i)=es(i)-2
    12800 next i
12810 return





1' ------------------------------------'
1'          map 13000-13999 '
1' -------------------------------------'
1 'mc=counter map
1 'mu=update map, nos dice que debemos de volver a cargar el archivo.bin del disco en el array (en la RAM)'
    1' tx=Es el tile en el que está el player en el eje x
    1 't0=tile sobre el que está el player,t1 =tile arriba, t3 derecha, t5 abajo, t7 izquierda'
    13000 dim m(22,31):ma=0:mc=1 
    1 'te= tile vacío (empty)'
    1 'tw= tile pared (wall)'
    1 'tl= tile escalera (ladder)'
    1 'tf= tile pienso (fodder)'
    1 'td= tile mortal (deadly)'
    1 'tc= tile coleccionable (collectable)'
    1 'tp= inidica la posición en el eje x de la puerta'
    1 'tq=indica la posición en el eje y de la puerta'
    13005 te=255:tw=32:tl=0:tf=0:td=3:tc=67:tp=0:tq=0
    1 'dim mapa(filas,clumnas)'
    1 'ma=mapa activo o actual, se empieza con el 0'
    1 'mc=mapa cambia'
    13010 ty=19:tx=3:t0=m(ty+1,tx):t1=161:t3=m(ty,tx+1):t5=m(ty+2,tx):t7=m(ty,tx-1)
    1 ' Arary de tiles:'
    1 '0: tiles tipo vacíos'
    1 '1: tiles tipo muro'
    1 '2: tile tipo escalera'
    1 '3: tiles coleccionables'
    1 '4: tiles asesinos'
    1 '13020 dim t(5,5)
    1 '13030 t(1,0)=32:t(1,1)=39
    1 '13040 t(2,0)=69
    1 '13050 t(3,0)=67:t(3,1)=98
13090 return


1 'Cargar mundo con los mapas de los niveles en el buffer o array'
    13100 'print #1, "!cargando mapa"
    1 '20000 rutina de inicialización mundo 0
    1 '13110 if ma=0 then bload"level0.bin",r:gosub 20000
    13110 if ma=0 then gosub 20000
    13111 if ma=1 then bload"level1.bin",r:gosub 20100
    13115 call turbo on (m())
    13120 md=&hC73a 
    13130 for f=0 to 22
        13140 for c=0 to 31
            13150 tn=peek(md):md=md+1
            13160 m(f,c)=tn
        13170 next c
    13180 next f
    13190 call turbo off
    13191 'preset (0,0):print #1, "!mapa cargado"
13195 return

1 'Pintamos en la VRAM page 0, los valores definidos en el array hasta la columna 32
    13300 a=usr3(0)
    13301 call turbo on (m())
    13310 for f=0 to 22
        13360 for c=0 to 31
            13370 tn=m(f,c)
            13380 if tn >=0 and tn <32 then copy (tn*8,0*8)-((tn*8)+8,(0*8)+8),1 to (c*8,f*8),0,tpset
            13390 if tn >=32 and tn <64 then copy ((tn-32)*8,1*8)-(((tn-32)*8)+8,(1*8)+8),1 to (c*8,f*8),0,tpset
            13400 if tn >=64 and tn <96 then copy ((tn-64)*8,2*8)-(((tn-64)*8)+8,(2*8)+8),1 to (c*8,f*8),0,tpset
            13410 if tn>=96 and tn <128 then copy ((tn-96)*8,3*8)-(((tn-96)*8)+8,(3*8)+8),1 to (c*8,f*8),0,tpset
            13420 if tn>=128 and tn <160 then copy ((tn-128)*8,4*8)-(((tn-128)*8)+8,(4*8)+8),1 to (c*8,f*8),0,tpset
            13430 if tn>=160 and tn <192 then copy ((tn-160)*8,5*8)-(((tn-160)*8)+8,(5*8)+8),1 to (c*8,f*8),0,tpset
            13440 if tn>=192 and tn <224 then copy ((tn-192)*8,6*8)-(((tn-192)*8)+8,(6*8)+8),1 to (c*8,f*8),0,tpset
            13450 if tn>=224 and tn <256 then copy ((tn-224)*8,7*8)-(((tn-224)*8)+8,(7*8)+8),1 to (c*8,f*8),0,tpset
        13510 next c
    13520 next f 
    13540 a=usr4(0):
    13541 call turbo off
13570 return



1 '1'chequeando contorno de una coordeanda dada por tx y ty
1 '    13600 'if gx<8 or gx> 256-16 or gy<0 or gy> 192-16 then return
1 '    1 'El array es de ancho del 0-31 y de alto 0-22'
1 '    13601 tx=gx/8:ty=gy/8
1 '    1 '13601 if ty<16 or ty >20*8 or tx<8 or tx > 30*8 then return
1 '    1 't0 es el tile sobre el que estamos,le sumamos 1 a la y ya que es un sprite de 16px y solo queremos ver las piernas'
1 '    1 '13605 if ty>16 then t0=m(ty+1,tx)
1 '    13605 t0=m(ty+1,tx)
1 '    1 't1 será el tile de arriba'
1 '    1 '13610 if ty>256-16 then t1=m(ty-1,tx)
1 '    13610 t1=m(ty-1,tx)
1 '    1't3 será el tile de la derecha
1 '    1 '13620 if ty>256-16 then t3=m(ty,tx+1)
1 '    13620 t3=m(ty,tx+1)
1 '    1 'Chequeando abajo'
1 '    1  'tx=(px+8)/8:ty=(py+16+1)/8
1 '    1 'Son 2 tiles hacia abao porque el sprite es de 16px'
1 '    13630 if ty>0 and ty<20 then t5=m(ty+2,tx)
1 '    1 'Izquierda'
1 '    13640 if tx>0 then t7=m(ty,tx-1)
1 '13690  return

1'chequeando contorno de una coordeanda dada por tx y ty
    13600 'if gx<8 or gx> 256-16 or gy<0 or gy> 192-16 then return
    1 'El array es de ancho del 0-31 y de alto 0-22'
    13610 tx=gx/8:ty=gy/8
    1 'Chequeando márgenes del'
    13620 if tx < 0 or tx > 31 or ty < 0 or ty > 22 then return
    1 't0 es el tile sobre el que estamos,le sumamos 1 a la y ya que es un sprite de 16px y solo queremos ver las piernas'
    1 '13605 if ty>16 then t0=m(ty+1,tx)
    13630 if tx < 32 then t0=m(ty+1,tx)
    1 't1 será el tile de arriba'
    1 '13610 if ty>256-16 then t1=m(ty-1,tx)
    1 'No le podemos restar -1 a la posición 0 del array'
    13640 if ty > 0 then t1=m(ty-1,tx)
    1't3 será el tile de la derecha
    1 '13620 if ty>256-16 then t3=m(ty,tx+1)
    13650 if tx < 31 then t3=m(ty,tx+1)
    1 'Chequeando abajo'
    1  'tx=(px+8)/8:ty=(py+16+1)/8
    1 'Son 2 tiles hacia abao porque el sprite es de 16px'
    1 'Como el maximo son 22 tiles de alto menos la altura del sprite que son 2 no podemos comprobar los tiles apatir del 20'
    13660 if ty < 20 then t5=m(ty+2,tx)
    1 'Izquierda'
    1 'No le podemos sumar -1 a la posición del array'
    13670 if tx > 0 then t7=m(ty,tx-1)
13690  return



























1 '1 'Rutina hacer coipys con mapa
1 '    13100 a=usr3(0):call turbo on
1 '    13110 md=&hd001
1 '        13120 for f=0 to 23
1 '        1 'ahora leemos las columnas c
1 '            13130 for c=0 to 31
1 '                1 'Obtenemos el valor que representa al tile de la fila y la columna'
1 '                13140 tn=peek(md):md=md+1
1 '                13150 if tn >=0 and tn <32 then copy (tn*8,(0*8)+2)-((tn*8)+8,(0*8)+8),1 to (c*8,f*8),0,tpset
1 '                13160 if tn >=32 and tn <64 then copy ((tn-32)*8,(1*8)+2)-(((tn-32)*8)+8,(1*8)+8),1 to (c*8,f*8),0,tpset
1 '                13170 if tn >=64 and tn <96 then copy ((tn-64)*8,(2*8)+2)-(((tn-64)*8)+8,(2*8)+8),1 to (c*8,f*8),0,tpset
1 '                13180 if tn>=96 and tn <128 then copy ((tn-96)*8,(3*8)+2)-(((tn-96)*8)+8,(3*8)+8),1 to (c*8,f*8),0,tpset
1 '                13190 if tn>=128 and tn <160 then copy ((tn-128)*8,(4*8)+2)-(((tn-128)*8)+7,(4*8)+8),1 to (c*8,f*8),0,tpset
1 '                13200 if tn>=160 and tn <192 then copy ((tn-160)*8,(5*8)+2)-(((tn-160)*8)+7,(5*8)+8),1 to (c*8,f*8),0,tpset
1 '                13210 if tn>=192 and tn <224 then copy ((tn-192)*8,(6*8)+2)-(((tn-192)*8)+7,(6*8)+8),1 to (c*8,f*8),0,tpset
1 '                13220 if tn>=224 and tn <256 then copy ((tn-224)*8,(7*8)+2)-(((tn-224)*8)+7,(7*8)+8),1 to (c*8,f*8),0,tpset
1 '                1 '13230 if tn>=128 and tn <144 then copy ((tn-128)*16,8*16)-(((tn-128)*16)+16,(8*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13240 if tn>=144 and tn <160 then copy ((tn-144)*16,9*16)-(((tn-144)*16)+16,(9*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13250 if tn>=160 and tn <176 then copy ((tn-160)*16,10*16)-(((tn-160)*16)+16,(10*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13260 if tn>=176 and tn <192 then copy ((tn-176)*16,11*16)-(((tn-176)*16)+16,(11*16)+16),1 to (c*16,f*16),0,tpset
1 '                1 '13270 if tn>=192 and tn <208 then copy ((tn-192)*16,12*16)-(((tn-192)*16)+16,(12*16)+16),1 to (c*16,f*16),0,tpset
1 '                13280 next c
1 '        13290 next f 
1 '        13300 a=usr4(0):call turbo off
1 '13310 return1' ------------------------------------'
1' Rutinas switch /  switch 16000-16999 '
1' -------------------------------------'



1 ' Rutina Inicializar stiwch'
    1 'Plano 0 player, plano 1 disparo, enemigos del 2 al 10, buo 11, mono 12, interruptor 13, jefe 14'
    1 'put sprite plano, x, y, color y sprite'
    1 'sx y sy coordenadas switch x e y'
    1 'ss=sprite switch'
    1 'sp=plano switch'
    1 'sc=color switch'
    1 'sh=switch habilitado'
    16000 sx=0:sy=0:ss=47:sp=13:sc=6:sh=0
16180 return

1 'Rutina pintar switch '
    1 'el interruptor se pintará desactivado si el switch no está habilitado'
    16300 put sprite sp,(sx,sy),sc,ss
    1 'Pintamos la puerta que viene con el switch'
    16310 for i=8 to 24 step 8: copy (8,8)-((8)+8,(8)+8),1 to (tp,tq+i),0:next i
16390 return

1 'Rutina habilitar instruuptor'
    1 '16400 if sh=0 then sh=1:sc=3:ss=ss+1:for i=8 to 24 step 8: copy (0,0)-(8,8),1 to (tp,tq+i),0,tpset:next i
    16400 if sh=0 then sh=1:sc=3:ss=ss+1:line(tp,tq)-(tp+8,tq+24),14,bf
    1 'Pintamos los tiles de fondo'
    1 '16420 for i=8 to 24 step 8: copy (8,40)-(8+8,39+8),1 to (tp,tq+i),0:next i

    16430 put sprite sp,(sx,sy),sc,ss
16490 return


