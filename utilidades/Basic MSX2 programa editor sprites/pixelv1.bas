1 'Inicializamos y pintamos la pantalla de presentación'
2  SCREEN3:OPEN"grp:"AS#1:GOSUB 1000
1 'Enlazamos con las rutinas de la bios'
5  DEFINTA-Z:DEFUSR1=&H41:Z=USR1(0):DEFUSR2=&H44:Z=USR2(0):DEFUSR3=&H90:Z=USR3(0)
1 'Inicialización pantalla 1 y habilitamos las interrupciones del pulsar espacio, al pulsar f y número
10 COLOR 15,1,1:SCREEN 5
1 'Cuando se pulse la barra espaciadora llamaremos a la rutina de la línea 200'
11 ON STRIG GOSUB 200
1 ' Si se pulsa F1 llamamos a la rutina de la línea 250 y si se pulsa F2 a la de la línea 600'
12 ON KEY GOSUB 250,600

13 STRIG(0)ON:KEY(2)ON
14 Z=USR1(0)
1 ' pintamos la pantalla 1'
15 GOSUB 500:Z=USR2(0)
1 'Inicializamos el array que contendrá los pixeles'
20 DIM A(15),B(15)
1 'Creamos el sprite que es un cursor redondo pequeño'
35 SPRITE$(0)=CHR$(&H0)+CHR$(&H18)+CHR$(&H3C)+CHR$(&H7E)+CHR$(&H7E)+CHR$(&H3C)+CHR$(&H18)+CHR$(&H0):X=0:Y=0:CA=0:CB=0
    
1 'Bucle principal'
    1 'CA=columna A del array, CB=columna B del array'
    100 A(CA)=C:B(CB)=C
    1 'Efecto parpadeo del sprite'
    101 PUT SPRITE 0,(X,Y),15,0
    102 FOR R=0 TO 90: NEXT
    103 PUT SPRITE 0,(X,Y),1,0
    104 FOR R=1 TO 90: NEXT
    1 'al pulsar una de las flechas moveremos el sprite 8 pixeles'
    109 ON STICK(0)GOTO110,100,120,110,130,110,140,110:GOTO 100
    110 Y=Y-8:IF Y<0 THEN Y=0:GOTO 150 ELSE CB=CB-1:GOTO 150
    120 X=X+8:IF X>120 THEN X=120:GOTO 150:ELSE CA=CA+1:GOTO 150
    130 Y=Y+8:IF Y>120 THEN Y=120:GOTO 150:ELSE CB=CB+1:GOTO 150
    140 X=X-8:IF X<0 THEN X=0:GOTO 100 ELSE CA=CA-1:GOTO 150
150 GOTO 100



1 'Rutina al pulsar la tecla espacio'
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





1 'Rutina al pulsar f1
    250 PSET(200+CA,CB+168),C:LINE(X,Y)-(X+7,Y+7),C,BF:KEY(1)ON
251 RETURN


350 GOTO 350
499 '�� pantalla ��


1 'Rutina escribir aspecto, pintar puntos y escribir opciones'
1 ' el draw pinta el subrayado de aspecto'
    500 PRESET(180,155):PRINT#1,"ASPECTO":DRAW"bm180,164c15r52"
    510 LINE(0,0)-(130,130),0,BF:FORR=0TO16:FORT=0TO16:PSET(T*8,R*8),15:NEXT:NEXT
    520 COLOR10:PRESET(0,182):PRINT#1,"SP-SELEC. COLOR":PRESET(0,192):PRINT#1,"F1-PINTA PIXEL":PRESET(0,202):PRINT#1,"F2-DATAS DIBUJO"
521 RETURN

1 ' Rutina al pulsar la tecla f2, dibujamos el gráfico a la derecha'
600 '� datas��
    1 'Inicializamos el PSG'
    605 Z=USR3(0)
    606 LINE(0,150)-(170,160),1,BF:FORR=0TO15:COPY(200,168)-(215,183)TO(R*16,135):NEXT:SOUND 8,16
    610 KEY(1)OFF:KEY(2)OFF:STRIG(0)OFF:LINE(130,0)-(255,80),1,BF:FORR=0TO15:FORT=0TO15:L=POINT(4+T*8,4+R*8):COLOR11:PRESET(130+T*6,R*8):PRINT#1,HEX$(L):NEXT:SOUND0,50+R*6:COLOR12:PRESET(220,R*8):PRINT#1,"-";R:SOUND1,0:SOUND7,56:SOUND12,10:SOUND13,0:NEXT
    612 COLOR 7:PRESET(140,202):PRINT#1,"ESC-NUEVO":PRESET(140,192):PRINT#1,"INS-CONTINUAR"
    615 IK$=INKEY$:IF IK$="" THEN 615
    1 'Si la tecla es espacio, pintaos de nuevo la pantalla y volvemos a empezar'
    620 IF IK$=CHR$(27) THEN ERASE A,B:GOSUB 810:GOTO 10
630 IF IK$=CHR$(18) THEN KEY(1)ON:KEY(2)ON:STRIG(0)ON:LINE(140,192)-(250,210),1,BF:LINE(0,135)-(255,150),1,BF:LINE(130,0)-(255,140),1,BF:GOSUB 830:GOTO 100:GOTO 615



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
1021 RETURN
1050 DATA P,I,X,E,L,A,R,T
