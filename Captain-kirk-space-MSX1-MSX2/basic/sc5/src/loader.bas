10 SCREEN 5,2,0:open "GRP:" as #1:key off
1 'En la dirección &h2D el MSX almacena la versión e MSX: 0=MSX1, 1=MSX2, 2=MSX2+, 3=MSXturboR'
1 'Si es un MSX1 vamos al final del programa'
20 if PEEK(&H2D)=0 then print #1,"Lo siento tu MSX en un MSX1 y no puede ejecutar mi juego, necesitas un MSX2+": goto 10000
30 a=vdp(-1)
40 c=a and &b00001110
1 'Si no es un MSX2+ vamos al final del programa'
50 'if c <> 4 then print #1,"Lo siento pero tu MSX es un MSX2 y no puede ejecutar mi juego, necestas un MSX2+": goto 10000
60 'print #1,"Bien estas en un MSX2+!!!!"




1 'Vamos a trabajar con screen 2,2 (sprites de 16x16pixeles)'
80 screen 5,2
90 'print #1,"Escribiendo main.bas en RAM"
1 'cargamos la pantalla en la page 1 (32768)'
100 BLOAD"tiles.bin",S,32768
1 'Cargamos el xbasic'
150 print #1,"Cargando xbasic"
160 bload"xbasic.bin",r
200 print #1,"Cargando sprites"
1 'Inicializamos los sprites'
210 gosub 1000
1 'Inicializacion de las dimensiones de los arrays de nuestras entidades'
220 print #1,"Reservando espacio de arrays"
230 gosub 3000
240 print #1,"Poniendo main en RAM"
1 'Cargamos el main'
250 load "main.bas",r



1 'Rutina cargar sprites con datas basic'
    1 'En screen 5 sería:
    1 'base(28)=30208-&h7600-put sprite atributo,(x,y),color,definición_sprite$ para la tabla atributos sprites (sa=Atributos sprites)
    1 'base(29)=30720-&h7800-sprite$(entero_numero) para tabla definición sprites (sd=tsprite definición)'
    1 ' 29696-&h7400 sprite color() para la tabla de definición de colores de sprites (sc= sprite tabla de colores)'
    1 'Leer datas 
    1000 'sa=base(28): sd=base(29):sc=&h7400
    1 'Vamos a cargar 6 sprites'
    1010 for I=0 to 9:a$=""
        1020 for J=1 to 32: read b$
            1030 a$=a$+chr$(VAL("&H"+b$))
            1 'Otra forma sería así pero abría que eliminar el sprite$(numero_sprite)'
            1040 'vpoke sd, VAL("&H"+b$):sd=sd+1
        1050 NEXT J
        1060 SPRITE$(I)=a$
    1070 NEXT I

    1 'Nave espacial derecha 1
    1160 DATA 00,00,00,00,00,00,3E,E3
    1170 DATA 80,E1,3C,02,03,00,00,00
    1180 DATA 00,00,00,00,00,00,00,FC
    1190 DATA 04,FF,02,02,FF,00,00,00
    1 'Nave espacial derecha 2
    1200 DATA 00,00,00,00,00,00,00,3E
    1210 DATA 3F,00,07,03,00,00,00,00
    1220 DATA 00,00,00,00,00,00,00,00
    1230 DATA F8,00,FE,FE,00,00,00,00
    1 'Nave espacial abajao 1
    1240 DATA 00,00,FF,80,F3,12,3E,E3
    1250 DATA FF,FF,12,12,F3,80,FF,00
    1260 DATA 00,00,F8,08,F8,00,00,F8
    1270 DATA FC,F8,00,00,F8,08,F8,00
    1 'Nave espacial abajo 2
    1280 DATA 00,00,00,FF,0C,0C,3E,FF
    1290 DATA FF,FF,0C,0C,0C,FF,00,00
    1300 DATA 00,00,00,F0,00,00,00,F8
    1310 DATA FC,F8,00,00,00,F8,00,00
    1 'Nave espacial arriba 1
    1320 DATA 00,00,00,00,FF,FF,FF,FF
    1330 DATA FF,FF,FF,FF,FF,00,00,00
    1340 DATA 00,00,00,00,C0,00,C0,F8
    1350 DATA 80,F8,C0,00,C0,00,00,00
    1 'Nave espacial arriba 2
    1360 DATA 00,00,00,00,00,00,00,FF
    1370 DATA FF,FF,00,00,00,00,00,00
    1380 DATA 00,00,00,00,00,00,00,F8
    1390 DATA 80,F8,00,00,00,00,00,00

    1 'Disparo'
    1400 DATA C0,C0,00,00,00,00,00,00
    1410 DATA 00,00,00,00,00,00,00,00
    1420 DATA 00,00,00,00,00,00,00,00
    1430 DATA 00,00,00,00,00,00,00,00
    
    1 'Tanque enemigo'
    1440 DATA 00,00,00,00,00,00,00,01
    1450 DATA 01,01,07,3F,3F,3F,3C,3C
    1460 DATA 00,00,00,00,00,00,00,80
    1470 DATA 80,80,F0,FC,FC,FC,3C,3C
    1 'Nave enemiga derecha'
    1480 DATA 00,00,07,1F,3F,7E,FC,F0
    1490 DATA FC,F0,7C,3F,1F,07,00,00
    1500 DATA 00,00,80,E0,80,00,00,00
    1510 DATA 00,00,00,80,E0,80,00,00
    1 'Nave enemiga izquierda'
    1520 DATA 00,00,01,07,01,00,00,00
    1530 DATA 00,00,00,01,07,01,00,00
    1540 DATA 00,00,E0,F8,FC,7E,3F,0F
    1550 DATA 3F,0F,3E,FC,F8,E0,00,00

    
    1 '2000 for I=0 to 5:a$=""
    1 '    2010 for J=1 to 16: read b$
    1 '        2020 a$=a$+chr$(b$))
    1 '    2050 NEXT J
    1 '    2060 color sprite (I)=a$
    1 '2070 NEXT I

    2100 for i=0 to (16*6)-1
        2110 read a
        2120 vpoke &h7400+i,a
    2130 next i



    1 'Nave espacial derecha 1'
    2200 DATA &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H05,&H05
    2210 DATA &H08,&H05,&H08,&H08,&H05,&H0F,&H0F,&H0F
    1 'Nave espacial derecha 2'
    2220 DATA &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0A
    2230 DATA &H0A,&H0F,&H0A,&H0A,&H0F,&H0F,&H0F,&H0F
    1 'Nave espacial abajo 1'
    2240 DATA &H0F,&H0F,&H08,&H08,&H08,&H06,&H05,&H05
    2250 DATA &H0D,&H05,&H06,&H06,&H08,&H08,&H08,&H0F
    1 'Nave espacial abajo 2'
    2260 DATA &H0F,&H0F,&H08,&H0A,&H0A,&H0A,&H05,&H0A
    2270 DATA &H0D,&H05,&H0A,&H0A,&H0A,&H0A,&H08,&H0F
    1 'Nave espacial arriba 1'
    2280 DATA &H0F,&H0F,&H08,&H0A,&H08,&H0A,&H0A,&H05
    2300 DATA &H0A,&H05,&H0A,&H0A,&H08,&H0B,&H08,&H0F
    1 'Nave espacial arriba 2'
    2310 DATA &H0F,&H0F,&H08,&H0A,&H08,&H0A,&H0A,&H08
    2320 DATA &H0A,&H08,&H0A,&H0A,&H08,&H0B,&H08,&H0F



1 'El color al sprite se lo mondremos más adelante con put sprite (aunque tambien sepuede escribir con vpoke)'
2500 return






















1 'Rutina reservar espacio para arrays'
    1 'Definiendo el espacio para los arrays con los valores de los enemigos' 
    1 'em=enemigos maximos'
    1 'Para conecer las demás variables ir a la inicialización del enemigo'
    3000 em=5
    1 '1 ' Component position'
    3010 DIM ex(em),ey(em),ev(em),el(em),es(em),ep(em),ec(em),ee(em)


    1 ' Reservaremos el espacio en memoria para 5 disparos simultáneos'
    1 'dm=disparos maximos'
    3020 dm=5
    3030 DIM dx(dm),dy(dm),dv(dm),ds(dm),dp(dm),da(dm)
3900 return



























1 'Esta opción no se utiliza, los gráficos se cargan con bload, línea 100'
1 'Rutina cargar gráficos, los gráficos se cargarán con datas basic
    1 'Screen 2 sería base(10)=6144-&h1800 tabla mapa, base(11)=8192-&h2000 tabla color tiles, base(12)=0 definición tiles'
    1 'Definicición de tiles, cada tile se degine con 8 bytes
    1 'La tabla de definicion de tiles va desde el registro 0 al 6148
    1 '1 trozo: 0-2047 (&h7ff),2 trozo 2047(&h800)-4095(&hfff), 3 trozo 4096(&h1000)-6147(&h17ff)'
    1 'cargamos el banco 0 de definición de tiles (el de abajo)'
    4000 for i=0 to 255*8:read a$
        4010 vpoke i, val(a$)
    4020 next I
     1 'cargamos el banco 1 de definición de tiles (el de enmedio)'
    4030 for i=2048 to 2048+(255*8):read a$
        4040 vpoke i, val(a$)
    4050 next I
    1 'cargamos el banco 2 de definición de tiles (el de arriba)'
    4060 for i=4096 to 4096+(255*8):read a$
        4070 vpoke i, val(a$)
    4080 next I

    1 'Cargamos los colores del banco 0'
    4090 for i=8192 to 8192+(255*8):read a$
        4100 vpoke i, val(a$)
    4110 next I
    1 'Cargamos los colores del banco 1'
    4120 for i=10240 to 10240+(255*8):read a$
        4130 vpoke i, val(a$)
    4140 next I
    1 'Cargamos los colores del banco 2'
    4150 for i=12288 to 12288+(255*8):read a$
        4160 vpoke i, val(a$)
    4170 next I

    1 'Cargamos la tabla de nombres para decirle que tile va en que posición'
    4180 for i=6144 to 6144+768:read a$
        4190 vpoke i, val(a$)
    4200 next


30000 return
1 'Esta línea tan solo la ponemos por si no es un MSX2+ para que salte aquí y se quede esperando'
10000 goto 10000