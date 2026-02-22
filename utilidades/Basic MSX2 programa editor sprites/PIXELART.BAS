1 'Inicializamos y pintamos la pantalla de presentación'
2  SCREEN3:OPEN"grp:"AS#1:GOSUB 1000
1 'Enlazamos con las rutinas de la bios'
5  DEFINTA-Z:DEFUSR1=&H41:Z=USR1(0):DEFUSR2=&H44:Z=USR2(0):DEFUSR3=&H90:Z=USR3(0)
1 'X e Y coordenadas sprite '
1 'pp=posición de la paleta de colores, solo utilizada para los dibujitos de la paleta'
1 'C=establece el color con el que se pintará
1 'tx y ty es el tile que aparece abajo a la derecha'
1 'tc=columna tile, para ir metiéndolos en la page 1'
1 'tf=fila tile, para ir metiéndolos en la page 1'
6  X=0:Y=0:pp=160:tx=200:ty=168:tn=0:C=(pp-120)/8:tc=0:tf=0
1 'Limpiamos la VRAM de la page 1 (a partir de la dirección &h8000 o 32765)'
7 for i=&h8000 to &h9999:vpoke i,0: next 
1 'Inicialización pantalla 1 y habilitamos las interrupciones del pulsar espacio, al pulsar f1
10 COLOR 15,0,1:SCREEN 5,0,0:Z=USR3(0):ON STRIG GOSUB 250:STRIG(0)ON:ON KEY GOSUB 600:KEY(1)ON
1 'Establecemos la posición del tile que vamos a copiar en la page 1'
12 tc=tn:tf=tn/16
1 'Apahamos la pantalla, pintamos la pantalla 1 (el board, las letras,el tile) y encenddemos la pantalla'
15 Z=USR1(0):GOSUB 500:Z=USR2(0)
1 'Creamos el sprite que es un cursor redondo pequeño'
35 SPRITE$(0)=CHR$(&H0)+CHR$(&H18)+CHR$(&H3C)+CHR$(&H7E)+CHR$(&H7E)+CHR$(&H3C)+CHR$(&H18)+CHR$(&H0):X=0:Y=0:CA=0:CB=0
    


1 'Bucle principal'
    100 PUT SPRITE 0,(X,Y),15,0
    1 'al pulsar una de las flechas moveremos el sprite 8 pixeles'
    109 st=STICK(0) 
    1 'Si se pulsa arriba'
    110 if st=1 then Y=Y-8:IF Y<0 THEN Y=0
    120 if st=3 then X=X+8:IF X>120 THEN X=120
    130 if st=5 then Y=Y+8:IF Y>120 THEN Y=120
    140 if st=7 then X=X-8:IF X<0 THEN X=0
    1 'Captura de teclas'
    150 K$=INKEY$
    155 'if k$=" " then gosub 250
    160 IF K$="o" or K$="O" THEN if pp>120 then gosub 800:line(pp,200)-(pp+8,208),1,B:pp=pp-8:C=(pp-120)/8
    165 IF K$="p" or K$="P" THEN if pp<240 then gosub 800:line(pp,200)-(pp+8,208),1,B:pp=pp+8:C=(pp-120)/8
    1 'Rutina ver page 1'
    172 if k$="v" or k$="V" then gosub 400
    1 'Rutina copiar en page 1 el tile actual'
    173 if k$="s" or k$="S" then gosub 300
    1 'Rutina crer archivo con los datas'
    174 if k$="c" or k$="C" then gosub 700
    1 'Rutina cargar archivo con los datas'
    175 if k$="l" or k$="L" then gosub 750
    1 'Crear un nuevo tile (le sumanmos 1 a tn=tile number)'
    179 if k$="n" or k$="N" then tn=tn+1:goto 10
    1 ' Rutina dibujar datas'
    180 if k$="d" or k$="D" then gosub 600
190 GOTO 100



1 'Inutilizada-----Rutina al pulsar la tecla espacio'
    1 'GOSUB 800=Hacemos un sonido, '
    1'&H156: borra el buffer del teclado para que no se vuelva a pulsar
    200 GOSUB 800:DEFUSR=&H156:W=USR(0):STRIG(0)OFF:KEY(1)OFF:LINE(0,150)-(170,170),1,BF:COLOR 10:PRESET(0,150):PRINT#1,"SELECCIONA COLOR(0-F)"
    205 K$=INKEY$
    1 'Si no se pulsa nada volvemos a capturar las teclas'
    210 IF K$="" GOTO 205
    1 'Si lo que se ha pulsado no es una letra volvemos a capturarla'
    215 IFK$<CHR$(33)THEN 205
    1 'Val convierte la letra en su valor entero correspondiente'
    220 C=VAL("&H"+K$)
    230 LINE(0,150)-(170,160),1,BF
    231 PRESET(0,150):PRINT#1,"COLOR PIXEL-"
    232 LINE(100,150)-(110,160),C,BF
    233 STRIG(0)ON:KEY(1)ON
239 RETURN




1 'Rutina pintar en board y pixel abajo derecha al pulsar espacio
    250 PSET(tx+(X/8),ty+(Y/8)),C
    251 LINE(X,Y)-(X+7,Y+7),C,BF
252 RETURN




1 'Rutina copiar en page 1 el tile actual'
    1 'tx y ty es el cuadradito que sale con el tile abajo a la derecha'
    300 copy (tx,ty)-(tx+17,ty+17),0 to (tc*16,tf*16),1
    305 LINE(130,0)-(255,128),1,BF
    310 color 6:PRESET(150,8):PRINT#1,"Saved 1 page":for i=0 to 3000:next:color 15
    320 PRESET(150,8):PRINT#1,"              "
330 return




1 'Rutina ver page 1'
    1 'Apagamos la pantalla'
    400 'Z=USR1(0)
    1 'Ponemos el sprite del cursor fuera de a vista'
    401 PUT SPRITE 0,(0,212),0,0
    1 'Pasamos la pantalla actual a la page 3'
    405 copy (0,0)-(256,212),0 to (0,0),3
    1 'Mostramos el contenido de la page 1 en la page 0'
    410 copy (0,0)-(256,212),1 to (0,0),0
    415 'set pàge 1,0
    1 'Mostramos un mensaje'
    420 preset(0,212-8):print #1,"Press any key ": if inkey$="" then goto 420 
    1 'Recueramos el contenido de la pantalla con la que estábamos trabajando
    430 copy (0,0)-(256,212),3 to (0,0),0
    435 'set page 0,1
    1 'Recuperamos el sprite'
    440 PUT SPRITE 0,(X,Y),15,0
    1 'Encendemos la pantalla'
    445 'Z=USR2(0)
450 return


1 'Rutina escribir aspecto, pintar puntos y escribir opciones'
1 ' el draw pinta el subrayado de aspecto'
    500 PRESET(170,155):PRINT#1,"Appearance":DRAW"bm170,164c15r78"
    510 LINE(0,0)-(130,130),0,BF:FORR=0TO16:FORT=0TO16:PSET(T*8,R*8),15:NEXT:NEXT
    1 '520 COLOR10:PRESET(0,182):PRINT#1,"SP-SELEC. COLOR":PRESET(0,192):PRINT#1,"F1-PINTA PIXEL":PRESET(0,202):PRINT#1,"F2-DATAS DIBUJO"
    520 COLOR 15
    530 PRESET(0,17*8):PRINT#1,"Tile "tn+1"(c:"tc"f:"tf")   Values"
    540 COLOR 10:PRESET(0,18*8):PRINT#1,"SP Draw"
    550 PRESET(0,19*8):PRINT#1,"O/P Select color"
    570 PRESET(0,20*8):PRINT#1,"V View page"
    580 PRESET(0,21*8):PRINT#1,"S Save tile in page 1"
    581 PRESET(0,22*8):PRINT#1,"C Create file"
    582 PRESET(0,23*8):PRINT#1,"L Load file from disk"
    583 PRESET(0,24*8):PRINT#1,"N New/Add tile"
    1 '584 PRESET(0,25*8):PRINT#1,"F1 View datas"
    584 PRESET(0,25*8):PRINT#1,"D View datas"
    1 'Pintamos la tableta de colores,120 es donde empiezan en el eje x la tabla de colores
    585 line(118,198)-(122+(16*8),210),15,b
    586 for i=0 to 15:line(120+8*i,200)-(120+8+8*i,208),i,bf:line(120+8*i,200)-(120+8+8*i,208),1,b:next
590 RETURN

1 ' Rutina dibujar datas'
    1 'Inicializamos el PSG'
    600 Z=USR3(0) 
    606 'LINE(0,150)-(170,160),1,BF:FORR=0TO15:COPY(200,168)-(215,183)TO(R*16,135):NEXT:SOUND 8,16
    610 SOUND 8,16
    611 LINE(130,0)-(255,128),1,BF
    612 FORR=0TO15:FORT=0TO15:L=POINT(4+T*8,4+R*8):COLOR11:PRESET(130+T*6,R*8):PRINT#1,HEX$(L):NEXT:SOUND0,50+R*6:COLOR12:PRESET(220,R*8):PRINT#1,"-";R:SOUND1,0:SOUND7,56:SOUND12,10:SOUND13,0:NEXT
    613 color 15
    1 '612 COLOR 7:PRESET(140,202):PRINT#1,"ESC-NUEVO":PRESET(140,192):PRINT#1,"INS-CONTINUAR"
    1 '615 IK$=INKEY$:IF IK$="" THEN 615
    1 '620 IF IK$=CHR$(27) THEN ERASE A,B:GOSUB 810:GOTO 10
    1 '630 IF IK$=CHR$(18)THENKEY(1)ON:KEY(2)ON:STRIG(0)ON:LINE(140,192)-(250,210),1,BF:LINE(0,135)-(255,150),1,BF:LINE(130,0)-(255,140),1,BF:GOSUB 830
640 return


1 'Rutina crer archivo con los datas'
    700 bsave "tiles.dat",&h8000,&hFFFF,s
    705 LINE(130,0)-(255,128),1,BF
    710 color 6:PRESET(150,8):PRINT#1,"file created":for i=0 to 3000:next::color 15
    720 PRESET(150,8):PRINT#1,"              "
730 return

1 'Rutina cargar archivo con los datas'
    750 bload "tiles.dat",s
    706 LINE(130,0)-(255,128),1,Bf
    760 color 6:PRESET(150,8):PRINT#1,"uploaded file":for i=0 to 3000:next::color 15
    770 PRESET(150,8):PRINT#1,"              "
790 return

1 'Rutina efecto de sonido'
    800 SOUND8,16:FORR=0TO250STEP25:SOUND0,R:SOUND1,0:SOUND7,56:SOUND12,2:SOUND13,0:NEXT:Z=USR3(0)
801 RETURN
1 'Rutina efecto de sonido 2'
    810 FORT=15TO0STEP-2:SOUND8,T:FORR=250TO0STEP-25:SOUND0,R:SOUND6,R:SOUND7,50:SOUND12,18:SOUND13,0:NEXT:NEXT:Z=USR3(0)
811 RETURN
1 'Rutina efecto de sonido 3'  
    830 FORR=15TO0STEP-2:PLAY"l64v=r;a":NEXT
831 RETURN



1 'Rutina pintar la pantalla de presentación'
999 '�� portada��
    1000 COLOR 15,0,1
    1010 RESTORE:FOR R=0 TO 7:READ PX$
        1011 COLOR INT(RND(1)*14+2),1,1
        1012 PRESET(25+R*25,0)
        1013 PRINT #1,PX$
    1014 NEXT
    1015 COLOR 15:PRESET(50,70):PRINT#1,"16x16"
    1020 FORR=1 TO 3000:NEXT
1022 RETURN
1050 DATA P,I,X,E,L,A,R,T

