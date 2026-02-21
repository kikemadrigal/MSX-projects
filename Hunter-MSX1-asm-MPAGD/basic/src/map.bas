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
1 '13310 return