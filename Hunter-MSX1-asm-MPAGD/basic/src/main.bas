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



