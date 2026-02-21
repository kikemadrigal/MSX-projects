
1 'inkey$ ofrece el valor correspondiente a la tecla pulsada y cadena nula (-1) en caso de o haber pulsado ninguna tecla
1 '1000 if inkey$="" then goto 1000 y '
1 'stick(N) ofrece la dirección de las teclas cursor y de los joysticks, cuando N=0 ofrece los cursores, cuando N=1 la del joystick 1'
1 'Si escribimos STICK(0)ORSTICK(1) combinamos los cursores y el joystick'
1 'Para conyinuar depués de pulsar el espacio:150 IF NOT STRIG(0) THEN 150'


1 'Juan Morales utiliza el on stick(0) goto'
1 'Raul portales utiliza stick(0) if st=1 then, if st=3 then..'



10 screen 5,2:defsng a-z:color 1,15,15: open "grp:" as #1
1 'escribimos los sprites'
20 gosub 15000
1 'Inicializamos variables sprite'
30 gosub 10000



1 'Main loop
    1 'Sistema de física / input'
    1 '100 gosub 1000
    1 '100 gosub 2000
    1 '100 gosub 5000
    1 '100 gosub 4000
    100 gosub 7000
    1 'Sistema de render'
    110 put sprite pp,(px,py),pc,ps
    1 'Pintamos el marcador'
    120 gosub 9000
130 goto 100



1 ' --------------------------------------------------------------'
1 '   INPUT/PHYSIC SYSTEM 1 - inkey$ -teclas op a - time 5-6
1 ' --------------------------------------------------------------'
    1000 k$=inkey$
    1005 k=val(k$)
    1010 if pa=1 then py=py-pl
    1020 if py<po-20 then pl=-pl
    1030 if py>po then py=po:pl=-pl:pa=0
    1 ' arriba
    1040 if k$="a" then py=py+pv 
    1 ' derecha
    1060 if k$="p" then px=px+pv
    1 ' izquirda
    1070 if k$="o" then px=px-pv
    1 '1 Arriba'
    1 '1080 if k=1 then po=py:pa=1
    1 '2-arriba-derecha'
    1 '1090 if k=2 then px=px+pv:if pa<>1 then pa=1
    1 '3 derecha'
    1 '1100 if k=3 then px=px+pv
    1 '7 izquierda'
    1 '1110 if k=7 then px=px-pv
    1 '8 arriba izquierda'
    1 '1120 if k=8 then px=px-pv:if pa<>1 then pa=1
1990 return




1 ' -------------------------------------------------------------'
1 '   INPUT/PHYSIC SYSTEM 2 - on stick(0) goto - time 4
1 ' -------------------------------------------------------------'
    1 '                     1   2     3    4    5   6    7    8'
    2000 on stick(0) goto 2200,2400,2600,2000,3000,3200,3400,3600
    2010 if pa=1 then py=py-pl
    2020 if py<po-20 then pl=-pl
    2030 if py>po then py=po:pl=-pl:pa=0
    2040 goto 3900
    1 '1 Arriba'
    1 'Rutina de salto (1 parte), antes hemos inicilizado los valores del player en 10000'
    1 'Si el salto no está activo conservamos en po el valor del eje y y activamos el salto'
    1 '1 Arriba'
    2200 if pa<>1 then po=py:pa=1:goto 3900
    1 '2 Arriba derecha'
    2400 px=px+pv:if pa<>1 then pa=1:goto 3900
    1 '3 derecha'
    2600 px=px+pv:goto 3900
    1 '7 izquierda'
    3400 px=px-pv:goto 3900
    1 '8 Arriba izquierda'
    3600 px=px-pv:if pa<>1 then pa=1:goto 3900
3900 return





1 ' -------------------------------------------------------------'
1 '   INPUT/PHYSIC SYSTEM 3 - stick(0) if then - time 5-6
1 ' -------------------------------------------------------------'
    1'1 Arriba, 2 arriba derecha, 3 derecha, 4 abajo derecha, 5 abajo, 6 abajo izquierda, 7 izquierda, 8 izquierda arriba
    4000 j=stick(0)
    4010 if pa=1 then py=py-pl
    4020 if py<po-20 then pl=-pl
    4030 if py>po then py=po:pl=-pl:pa=0
    4040 if j=1 then  if pa<>1 then po=py:pa=1
    4050 if j=2 then  px=px+pv:if pa<>1 then pa=1
    4060 if j=3 then  px=px+pv
    4070 if j=7 then  px=px-pv
    4080 if j=8 then  px=px-pv:if pa<>1 then pa=1
4990 return



1 ' ------------------------------------------------------'
1 '   INPUT/PHYSIC SYSTEM 4 - on stick(0) gosub - time 4-5
1 ' ------------------------------------------------------'
    5000 on stick(0) gosub 5200,5400,5600,5800,6000,6200,6400,6600
    1 'Rutina de salto (2 parte)'
    1 'En cada ciclo si el salto está activo le restamos la velocidad del eje y'
    5100 if pa=1 then py=py-pl
    1 ' Si la posición y es menor que la posición antigua del je y menos 20 invertimos la velocidad vertical (en lugar de + ahora es -)'
    5120 if py<po-20 then pl=-pl
    1 ' Si el salto es mayor que la posición antgua hemos terminado y restablecemos los valores'
    5130 if py>po then py=po:pl=-pl:pa=0
5190 return
1 '1 Arriba'
    1 'Rutina de salto (1 parte), antes hemos inicilizado los valores del player en 10000'
    1 'Si el salto no está activo conservamos en po el valor del eje y y activamos el salto'
    5200 if pa<>1 then po=py:pa=1
5290 return
1 '2-arriba-derecha'
    5400 if pa<>1 then pa=1
    5410 px=px+pv
5490 return
1 '3 derecha'
    5600 px=px+pv
5690 return
1 '4-abajo derecha'
    5800 'nada'
5890 return
1 '5 abajo'
    6000 'nada'
6090 return
1 '6-abajo-izquierda'
    6200 'nada'
6290 return
1 '7 izquierda'
    6400 px=px-pv:'gosub 9000
6490 return
1 '8 arriba izquierda'
    6600 if pa<>1 then pa=1
    6610 px=px-pv:'gosub 9000
6690 return


1 ' --------------------------------------------------------------------------------'
1 '   INPUT/PHYSIC SYSTEM 5 - on stick with expressions - time 
1 ' --------------------------------------------------------------------------------'
    1 'stick(0) x=x -(st and horizontal-limit-right)*horizontal-velocity + (st and horizontal-limit-left)*horizontal-velocity'
    7000 st=stick(0):px=px -(st=3 and px<247)*pv+(st=7 and px>0)*pv:py=py-(st=5 and py<192)*pl+(st=1 and py>0)*pl
7990 return


1 ' ----------------------'
1 '     HUD'
1 ' ----------------------'
    9000 line (0,180)-(256,212),15,bf 
    9060 preset (0,186):print #1,time
    9070 time=0
9090 return


1 ' ----------------------'
1 '      PLAYER
1 ' ----------------------'
1 ' Inicialización variables'
    1 ' Componente físicia'
    1 'px=posicion x,pw= ancho player,ph=alto player, pv=velocidad eje x, pl=velocidad eje y, po=posición y vieja, pa=salto activado player'
    10000 px=10*8:py=20*8:pw=16:ph=16:pv=8:pl=8:po=py:pa=0
    1 ' Componente render'
    10030 pc=6:pp=0:ps=0
10090 return

1 ' ----------------------'
1 '     SPRITES
1 ' ----------------------'
1 'Rutina cargar sprites con datas basic'
    15000 for j=1 to 32:read a$
        15020 sp$=sp$+chr$(val(a$))
    15030 next j
    15040 sprite$(0)=sp$
15060 return 
1 'Area datas'
15120 DATA 255,255,255,255,255,255,255,255
15130 DATA 255,255,255,255,255,255,255,255
15140 DATA 255,255,255,255,255,255,255,255
15150 DATA 255,255,255,255,255,255,255,255