10 rem Program: Tapadera
20 rem Autor: MSX Murcia 2020
30 rem Platform: MSX2
40 rem language: MSX Basic


70 'print #1, "Ejecutando main"
1 'Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E'
80 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0)
1 'cargamos las rutinas de apgar y encender pantalla'
90 defint a-z: defusr1=&H41:defusr2=&H44
1 'Inicializar mapa, son 96 columnas y 24 filas'
110 gosub 20000
1 'Inicializamos el personaje'
120 gosub 10000
1 'inicializar disparos'
130 gosub 11000
1 'inicializamos enemigos'
140 gosub 11400

1'------------------------------------'
1'  Pantalla de Bienvenida y records 
1'------------------------------------'
200 cls:preset (100,212/2): print #1, "Space 2": print #1,"Pulsa una tecla para continuar": print #1,"Espacio libre: "fre(0)
1 'Repetir mientras no se pulse una tecla'
210 k$=inkey$:if k$="" then goto 210
1 'Borramos el mensaje de bienvenida y vamos a la pantalla 1'
220 goto 400

1'------------------------------------'
1'     Pantalla Ganadora'
1'------------------------------------'
1' Dibujamos el texto de la pantalla ganadora
300 print #1,"has ganado"
1' Otra partida s/n,es posible borrar la interrogación con for i=0 to 7: vpoke base(2)+(63*8)+i,0: next i
310 'input #1,"¿Otra partida S/N ";a$
320 if inkey$="s" then 290
330 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end

1'------------------------------------'
1'           Game over 
1'------------------------------------'
1' Dibujamos el texto de la pantalla game over

1' Otra partida s/n,es posible borrar la interrogación con for i=0 to 7: vpoke base(2)+(63*8)+i,0: next i
350 preset (0,10)
360 print #1," Te han matado!!"
370 'input #1,"¿Otra partida S/N ";a$
380 if inkey$="s" then 290
390 if inkey$="n" then print #1,"adios": for i=0 to 500: next i:cls:end



1'---------------------------------------------------------------------------------------------------------'
1'-------------------------         Pantalla 1 /screen 1                            -----------------------        
1'---------------------------------------------------------------------------------------------------------'
1 'Le ponemos un color bonito'
400 color 15,1,1
1 'Ti para controlar el tiempo y cuando aparecen los personajes y ms=elegimos el mapa'
405 cls:ti=1:ms=0
1 'Llamamos a la rutina guardar información en array'
1 'Esta rutina distingue el mapa que está seleccionado y carga el archivo de los mapas'
410 gosub 20500
1 'Pintamos algunas estrellas'
420 for i=0 to 200: pset(rnd(1)*256,rnd(1)*212),15: next i
1 'Pintamos el mapa 0
430 gosub 20700
1 'Con el 0 le decimos que es la barra espaciadora y no los botones de los joystick'
1 'Cunado se pulse la barra espaciadora hiremos a la línea 11100'
440 on strig gosub 11100:strig(0) on
1 'Dubamos un marco arriba para el HUD'
450 LINE(0,0)-(256,15),11,b
460 on interval=50 gosub 9000:interval on:time=0



1 'Solo se saldrá de este bucle si se ha llegado al final de la pantalla'
1 ' ----------------------'
1 '      MAIN LOOP
1 ' ----------------------'
    1 'Chekear que el mapa ha llegado al final'
    500 gosub 20100
    1 'crear enemigos secuencialmente'
    510 gosub 600
    1 'Cheak vidas'
    520 'nada'
    1 'Comprobamos las colisiones'
    530 gosub 8000
    1 'Actualizamos el render'
    540 gosub 7000
    1 'Capturamos las teclas'
    550 gosub 6200
    1 'Bucle'
    560 goto 500
1 ' ----------------------'
1 '    FINAL MAIN LOOP
1 ' ----------------------'

1 'Rutina crear enemigos'
1 'Crearemos un enemigo cada multiplo de 10'
    600 if ti mod 10 =0 then gosub 11500
610 return

1'---------------------------------------------------------------------------------------------------------'
1'-------------------------     Final Pantalla 1 / screen 1                         -----------------------        
1'---------------------------------------------------------------------------------------------------------'












1 ' ----------------------'
1 '     INPUT SYSTEM'
1 ' ----------------------'
1 '2 Sistema de input'
    6200 px=x:py=y 
    6210 on stick(0) gosub 6240,6210,6250,6210,6260,6210,6270
    6220 'if stick(0)=-1 then ps=0
6230 return
1 '1 arriba'
6240 y=y-pv:ps=4:return
1 '3 derecha'
6250 x=x+pv:ps=0:return
1 '5 abajo'
6260 y=y+pv:ps=2:return
1 '7 izquierda'
6270 x=x-pv:ps=0:return





1 ' ----------------------'
1 '     RENDER SYSTEM'
1 ' ----------------------'
    1 'Render map'
    1 'Rutina desplazar pantalla a la izquierda
    7000 'gosub 21500
    1 ' Rutina dibujar mapa
    7010 gosub 20700
    1 'Pintamos de nuevo el player con la posición
    7020 gosub 10500
    1 'pintamos los disparos'
    7030 gosub 11300
    1 'Pintamos los enemigos'
    7040 gosub 11700
7110 return





1 ' ----------------------'
1 '     COLLISION SYSTEM'
1 ' ----------------------'
    1 'Colision del player con la pantalla'
    8000 if y<=0 then y=py
    8070 if y>212-16 then y=py
    8080 if x<0 then x=px
    8090 if x>256-16 then x=px
8100 return




1 ' ----------------------'
1 '     HUD'
1 ' ----------------------'
    9000 'preset (0,192-8):print #1,"Tapadera game, fre "fre(0)
    9010 'preset (0,20):print #1,"       dn "dn
    9020 'preset (0,30):print #1,"D:ds: "ds(dd)", dp: "dp(dd)", dx: "dx(dd)
    9030 'preset (0,5):print using #1,"##";time/50
    9040 'preset (2,6):print #1,"km: "ti"  V: "pe
    9050 preset (2,6):print #1,"en: "en", ti: "ti
9090 return





1 ' ----------------------'
1 '         PLAYER
1 ' ----------------------'
1 'inicialice player'
    10000 x=8*2:px=x:y=212/2:py=y: pw=16: ph=16: pd=3: pu=0: pv=8: pe=100: pc=0
    1 'variables para manejar los sprites, 
    1 'ps=payer sprite, lo cremaos con el spritedevtools 
    1 'pp=player plano; para cambiarlo en el plano osprite paraq ue de la sención de movimento
    10010 ps=0: pp=0
10030 return

1 'Update player'
    10500 put sprite pp,(x,y),,ps
    10510 put sprite pp+1,(x,y),,ps+1
10520 return

1' ------------------------------------------------------------------------------'
1' -------------------------Rutinas disparos / fires ----------------------------'
1' ------------------------------------------------------------------------------'
1 'Rutina inicializar disparos'
1 'Recuerda que reservaste el espacio para X variables disparo en un array en el loader'
1 'Los disparos se irán creando dinámicamente según vayamos pulsando la barra espaciadora'
1 'Los parámteros se los metemos a ojo, la posición e y, son las del player'
1 'dn= disparo número, sirve para ir creando disparos ya que despues se incrementa'
1 'dd=disparo destruido, variable utilizada para eliminar enemigos (ver linea 11330 y 11200)'
    11000 dn=0:dd=0
11060 return

1 ' Rutina crear disparos'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' solo permitiremos X disparos (recuerda que el 1 es la plantilla del cual copiamos, solo se mostraán 4)'
    11100 if dn>9 then return 
    1 'Posición'
    11120 dx(dn)=px+16:dy(dn)=py+8
    1 'Físicas: velocidad'
    11130 dv(dn)=8
    1 'Render: sprite y plano'
    11140 ds(dn)=6:dp(dn)=6+dn
    1 'RPG: disparo activo (no utlizado)'
    11150 da(dn)=0
    1 ' Para crear disparos sumamos 1 al contador de numero de disparos'
    11160 dn=dn+1
    11170 beep
11180 return

1 ' Rutina eliminar disparos'
    1 ' Si el enemigo es la última posición de array simplemente le restamos 1 al número de enemigos'
    1 ' Aunque tenemos 5 disparos reservados en memoria, la rutina actualizar disparos solo pinta dn '
    11200 'Bajamos el número de disparos para que nos pinte los X que habíamos reservado en el loader, solo los que le decimos
    11210 dn=dn-1
    11220 'Ponemos el sprite fuera para que no se vea'
    11230 put sprite dp(dd),(-16,0),15,ds(dd)
    11240 'preset (0,130):print #1,"D:ds: "ds(dd)", dp: "dp(dd)", dx: "dx(dd)
    1 'Copiamos los valores del ultimo disparo sobre el disparo destruido (al fin y al cabo es solo moverlos)'
    11250 dx(dd)=dx(dn):dy(dd)=dy(dn):dv(dd)=dv(dn):ds(dd)=ds(dn):dp(dd)=dp(dn):da(dd)=da(dn) 
11260 return

1 'Rutina actualizar disparos'
    1 'Si no hay disparos no pintes'
    11300 if dn=0 then return 
    11310 for i=0 to dn-1 
        1 'Si hay le sumamos la velocidad'
        11320 dx(i)=dx(i)+dv(i) 
        1 'lo pintamos
        11330 put sprite dp(i),(dx(i),dy(i)),15,ds(i)
        1 'Si está fuera de la pantalla el disparo lo eliminamos'
        11340 if dx(i)>=256 then dd=i:gosub 11200
        11350 'preset (0,150+i*10):print #1,"i: "i", ds: "ds(i)", dp: "dp(i)
        1 'Si la pantalla es superior a 256px, nos guardamos la posición del array del enemigo destruido y llamamos a la rutina destruir enemigo'
    11360 next i
11390 return

1 '---------------------------------------------------------'
1 '------------------------ENEMIES -------------------------'
1 '---------------------------------------------------------'
1 'Init
1 'Recuerda que hemos reservado el espacio para X enemigos en el loader'
1 'en=numero de enemigo'
1 'Componente de posicion'
    1 'ex=coordenada x, ey=coordenada y', e1=coordenada previa x, e2=coordenada previa y
1 'Componente de fisica'
    1 'ev=velocidad enemigo eje x, el=velocidad eje y'
1 'Componente de render'
    1 'es=enemigo sprite, ep=enemigo plano'
1 'Componente RPG'
    1 'ee=enemigo energia '
    11400 en=0
11410 return

1 ' Crear enemigo'
    11500 if en>5 then return
    11510 ex(en)=256:ey(en)=rnd(1)*140
    11520 if ey(en)<64 then goto 11510
    11530 ev(en)=16:el(en)=16
    1 'Los enemigos son los sprites 7,8,9'
    11540 es(en)=8:ep(en)=7+en:ec(en)=rnd(1)*15
    11550 if ec(en)<2 then goto 11540
    11560 ee(en)=100
    11570 en=en+1
11580 return

1 ' Rutina eliminar enemigos'
    11600 en=en-1
    11610 ey(ed)=rnd(1)*140
    11620 if ey(ed)<64 then goto 11610
    11630 ec(ed)=rnd(1)*15
    11640 if ec(ed)<2 then goto 11630
    11650 put sprite ep(ed),(-16,0),ec(ed),es(ed)
11660 return

1 'Update enemigo'
    11700 if en<=0 then return
    11710 for i=0 to en-1
        1 ' A cada uno le restamos la velocidad'
        11720 ex(i)=ex(i)-ev(i)        
        11730 'nada'
        11770 put sprite ep(i),(ex(i),ey(i)),ec(ei),es(i)
        11780 'preset (0,150+i*10):print #1,"es: "es(i)", ep: "ep(i)", ex: "ex(i)
        11790 if ex(i)<=0 then ed=i:gosub 11600
    11800 next i
11810 return


1 '---------------------------------------------------------'
1 '------------------------MAP -----------------------------'
1 '---------------------------------------------------------'
1 'm() nuestro array tiene 2 dimensiones, la 1 es la que almacena las columnas o eje x y la segunda las filas o eje y
    20000 dim m(255,13)
    1 'mc: mapa contador columna, utilizado para ir haciendo los copys con el data de la columna leida del array'
    1 'ms: mapa selecionado, para elegir el mapa y cambiarlo cuando sea conveniente'
    1 'md=mapa dirección que está en la ram y que es cargada con bload'
    20010 ms=0:md=0:mc=0
20020 return

1 'Rutina update de mapa'
1 'Si el mapa seleccionado es el 0 vamos a poner la paleta y el mapa de la linea'
    20100 if ti=256 then preset (10,90):print #1,"Mision conseguida":return
    20110 ti=ti+1
20120 return
  


1 'Rutina cargar mapa con array de datas'
1 'ahora leemos las filas o la posición x
20300 'print #1,"Cargando mapa"
20310 for f=0 to 12
    1 'ahora leemos las columnas c o la posicion y
    20320 for c=0 to 255
        20330 read a$ 
           20340 if a$ <> "-1" then m(c,f)=VAL(a$) else m(c,f)=255
        20350 next c
    20360 next f
20370 return


1 'Guardar_mapa_en_array desde un archivo guardado en disco
    1 'Cada mapa ocupa 862 bytes'
    1 'md=mapa dirección, la dirección c001 se la he puesto yo en el archivo binario cuando lo creé'
    1 'El archivo tan solo contiene los datos de la definición de los mapas'
    20500 preset (20,80):print #1, "Cargando mapa "ms+1" del disco.."
    20505 md=&hc001
    20510 'print #1,"Cargando mundo..."
    20520 if ms=0 then bload"word0.bin",r
    20530 if ms=1 then bload"word1.bin",r
    20540 for i=0 to 0
        1 'ahora leemos las filas o la posición x
        20550 for f=0 to 12
        1 'ahora leemos las columnas c o la posicion y
            20560 for c=0 to 255
                20570 m(c,f)=peek(md):md=md+1
            20580 next c
        20590 next f
    20600 next i
    20610 preset (20,80):print #1, "                                    "
20620 return



1 'Rutina dibujar mapa'
    1 'Obtenemos el tile deL array que toca (mc) y lo pintamos al final de la pantalla'
    20700 '_TURBO on (mc,m())
    1 'Copiamos las columnas a la ultima columna page 0'
    20710 mc=mc+1
    20720 if mc>255 then mc=0
    20730 if mc mod 16=0 then gosub 21000
    20740 gosub 21500
    20900 '_TURBO off
20990 return

1 ' Rutina opiar columnas a la ultima columna page 0'
    1 'El t1 será los tiles de la 1 fila desde 0 hasta 16 px de alto'
    21000 t1=m(mc,0)
    1 'El t2 serán los tiles de la 2 fila de 16pz a 32 px'
    21030 t2=m(mc,1)
    1 't3 son los tiles de la 3 fila'
    21040 t3=m(mc,2)
    21050 t4=m(mc,3)

    1 'fila 9'
    21060 t5=m(mc,9)
    1 'fila 10'
    21070 t6=m(mc,10)
    1 'fila 11'
    21080 t7=m(mc,11)
    1 'fila 12'
    21090 t8=m(mc,12)
    1 'Si te fijas en el mapa tan solo obtenemos el valor que hay en el mapa,
    1 'este valor indica su posicón en el tileset o el dibujo que hemos pegado en la page 1 en el cargador
    21100 copy (t1*16,0)-((t1*16)+16,(0*16)+16),1 to (15*16,1*16),0,pset
    21110 copy (t2*16,0)-((t2*16)+16,(0*16)+16),1 to (15*16,2*16),0,pset
    21120 copy (t3*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,3*16),0,pset
    21130 copy (t4*16,0)-((t3*16)+16,(0*16)+16),1 to (15*16,4*16),0,pset

    21140 copy (t5*16,0)-((t5*16)+16,(0*16)+16),1 to (15*16,9*16),0,pset
    21150 copy (t6*16,0)-((t6*16)+16,(0*16)+16),1 to (15*16,10*16),0,pset
    21160 copy (t7*16,0)-((t7*16)+16,(0*16)+16),1 to (15*16,11*16),0,pset
    21170 copy (t8*16,0)-((t8*16)+16,(0*16)+16),1 to (15*16,12*16),0,pset
21190 return

1 'Rutina desplazar pantalla a la izquierda
    21500 '_TURBO on
    21510 preset(100,100):print #1,"mc: "mc
    21530 copy (2,1*16)-(254,5*16),0 to (0,1*16),0,pset  
    21540 copy (2,9*16)-(254,13*16),0 to (0,9*16),0,pset  
    21590 '_TURBO off
21600 return
 
1 'Mostrar lo que hay guardado en el array
    21700 for f=0 to 12
    1 '' ahora leemos las columnas c
        21720 for c=0 to 255
            21730 print #1, m(c,f);
        21740 next c
    21760 next f
21790 return


1 '------------------DEFINICION DE MAPAS---------------------------------'
1 'level 1'

1 '30000 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,2,2,2,2,0,0,0,8,8,8,8,8,8,8,8
1 '30010 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,8,8,8,8,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
1 '30020 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,3,3,3,0
1 '30030 data 3,3,3,3,0,0,3,3,3,3,3,3,3,3,3,3,0,3,3,3,0,0,3,3,3,3,0,3,3,3,3
1 '30040 data 0,3,3,3,1,0,0,1,3,3,3,0,2,2,2,0,3,3,3,3,0,2,0,0,3,3,3,3,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,8,8
1 '30050 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,1,1,1,1,0,0,8,8,0,0,0,0,0,0,0,0,0,8,8,8,8,0,3,3,3,3,3,3,1,1,1,1,1,3,3,3,3,3,3,3,0,3,3,3,3,3,3,3
1 '30060 data 3,3,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,1,1,3,3,3,3,3,3,3,3,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30070 data 0,0,0,0,0,0,0,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2,2
1 '30080 data 0,1,3,3,0,0,0,0,0,1,0,0,0,0,0,0,3,3,3,3,0,0,0,0,1,3,3,3,3,3,1,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1
1 '30090 data 8,8,8,8,8,8,8,2,2,2,2,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,2,3,3,3,3,3
1 '30100 data 3,3,0,0,0,0,0,0,0,0,1,1,0,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,1,1,1,1,1,0,0,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30110 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30120 data 0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,2,3,3,2,0,0,0,0,0,3,1,3,1,3,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30130 data 2,2,2,2,2,2,2,0,0,0,0,2,2,2,2,2,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,3,3,3
1 '30140 data 3,2,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30150 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30160 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30170 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30180 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30190 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30200 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30210 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30220 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30230 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30240 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30250 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30260 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30270 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30280 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30290 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30300 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30310 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30320 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30330 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30340 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30350 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30360 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,4,0,0,0,0,0,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30370 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,6,7,0,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30380 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30390 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30400 data 0,0,0,4,5,6,4,4,5,6,4,0,0,0,0,8,8,8,8,4,0,0,4,4,8,8,8,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30410 data 0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,3,3,3,3,3,3,3,3,5,6,0,5,6,0,5,6,0,0,5,6,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30420 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,0,6,0,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,4,5,4,5,4,4,5,6,7,8,8,0,0,0,0,0,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30430 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1 '30440 data 4,5,6,8,8,8,8,8,8,8,8,6,7,7,8,8,8,8,8,8,6,7,8,8,8,8,8,8,4,5,6,4,5,4,4,4,5,6,7,4,5,6,7,4,5,6,4,5,6,7,4,5,6,7,7,7,6,7,6,7,7,7,7,7,0,0,0,0,0,0,0,0,4,5,6
1 '30450 data 7,4,5,6,7,5,6,7,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,6,0,0,0,0,6,0,0,0,0,0,6,0,0,0,0,0,0,0
1 '30460 data 0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5
1 '30470 data 5,5,6,0,0,0,0,0,5,5,5,6,0,0,0,0,0,0,0,0,0,0,0,0,5,6,0,5,6,0,0
1 '30480 data 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,3,3,3,3,3
1 '30490 data 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,8,6,6,6,8,8,0,0,0,8,8,0,0,0,0,8,8,8,6,6,6,6,6,6
1 '30500 data 8,8,8,8,0,0,0,8,8,8,8,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,4,4,4,4,4,5,6,7,5,6,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,0,0,8,8,8,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8
1 '30510 data 8,8,5,5,5,5,5,5,5,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
