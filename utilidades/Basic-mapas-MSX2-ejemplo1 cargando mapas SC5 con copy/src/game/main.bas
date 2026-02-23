1 ' ------------------------------------'
1 '               MAIN                  '
1 ' ------------------------------------'



5 OPEN"grp:"AS#1: defint a-z
1 ' Inicializamos el mapa'
10 gosub 30000




1 ' Llamamos a la función cargar array con data'
10010 gosub 30100
10030 'print#1,"en la posición del array fila 10, columna 2 hay un "m(9,1,ms)
10040 'print#1," "
10050 'print#1,"en la posición del array fila 1, columna 4 hay un "m(0,3,ms)
1 ' Dibujar mapa con array'
10060 gosub 30300







20000 goto 20000





1 ' ------------------------------------'
1 '               Render system         '
1 ' ------------------------------------'





1 ' ------------------------------------'
1 '               Entidades             '
1 ' ------------------------------------'




1 ' ------------------------------'
1 '             Mapas             '
1 ' ------------------------------'


1 ' neceswitamos decirle a nuestro juego don de hay una pared: una casa: etc'
1 ' Como son 256x212px y heos dibujado cuadros de 16 por 16px necesitamos un mapa
1 '' de 13 filas y 16 columnas recordemos que la posición 1 tambien s cuenta en un array'
1 ' inicializamos el mapa'
1 ' ms=mapa seleccionado'
1 ' mm=mapa maximo '
1 ' mt=mapa tile'
1 ' tn=tile numero'
1 ' tile seleccinado'
    30000 ms=0:mm=1:tn=-1:ts=0:tf=0:tc=0
    1 '13 serán la fila y 16 laas columnas'
    30010 dim m(12,15,mm-1)
30020 return


1' funcion guardar los tiles que hemos guardado como data en un array
    1 ' ahora leemos las filas f'
    30100 'color 15,2,2
    30110 for f=0 to 12
        1 ' ahora leemos las columnas c
        30120 for c=0 to 15
            30130 read a$ 
            30150 m(f,c,ms)=VAL(a$)
        30210 next c
    30220 next f
30240 return




1' funcion dibujar tiles con array
1 'copy (mt*16,mt*16)-((mt*16)+16,(mt*16)+16),1 to (c*16,f*16) '
    30300 for f=0 to 12
        30310 'tn=tn+1
        30320 for c=0 to 15
            30330 tn=m(f,c,ms)  
            1 ' Para referenciar cada tile en el tileset (lo que hemos pegado en la page 1)
            1 ' cogeremos su número de tile tn y cada 16 tiles será otra fila, lo pegaremos en la columna c, fila f'
            30340 if tn <= 15 then copy (tn*16,0*16)-((tn*16)+16,(0*16)+16),1 to (c*16,f*16)
            30350 if tn>15 and tn <=31 then copy ((tn-16)*16,1*16)-(((tn-16)*16)+16,(1*16)+16),1 to (c*16,f*16)
            30360 if tn>31 and tn <=47 then copy ((tn-32)*16,2*16)-(((tn-32)*16)+16,(2*16)+16),1 to (c*16,f*16)
            30370 if tn>47 and tn <=63 then copy ((tn-48)*16,3*16)-(((tn-48)*16)+16,(3*16)+16),1 to (c*16,f*16)
            30380 if tn>63 and tn <=79 then copy ((tn-64)*16,4*16)-(((tn-64)*16)+16,(4*16)+16),1 to (c*16,f*16)
            30390 if tn>79 and tn <=95 then copy ((tn-80)*16,5*16)-(((tn-80)*16)+16,(5*16)+16),1 to (c*16,f*16)
            30400 if tn>95 and tn <=111 then copy ((tn-96)*16,6*16)-(((tn-96)*16)+16,(6*16)+16),1 to (c*16,f*16)
            30410 if tn>111 and tn <=143 then copy ((tn-112)*16,7*16)-(((tn-112)*16)+16,(7*16)+16),1 to (c*16,f*16)
            30420 if tn>143 and tn <=159 then copy ((tn-128)*16,8*16)-(((tn-128)*16)+16,(8*16)+16),1 to (c*16,f*16)
            30440 if tn>159 and tn <=175 then copy ((tn-144)*16,9*16)-(((tn-144)*16)+16,(9*16)+16),1 to (c*16,f*16)
            30450 if tn>175 and tn <=191 then copy ((tn-160)*16,10*16)-(((tn-160)*16)+16,(10*16)+16),1 to (c*16,f*16)
            30460 if tn>191 and tn <=207 then copy ((tn-176)*16,11*16)-(((tn-176)*16)+16,(11*16)+16),1 to (c*16,f*16)
        30470 next c
    30480 next f
30490 return




1 ' Los mapas estámn hechos con el programa tiled, incluido en el proyecto'
1 ' En el mapa de tiles el:
1 '     0 es un arbol' 
1 ' LEVELS'


1' level 1

30800 data -1,9,-1,-1,-1,-1,32,-1,-1,114,114,114,-1,13,14,15
30810 data -1,-1,-1,-1,-1,0,-1,9,-1,114,114,114,-1,29,30,31
30820 data 67,68,69,36,37,-1,-1,-1,-1,32,-1,-1,-1,-1,-1,-1
30830 data 83,84,85,52,53,-1,-1,67,68,69,-1,0,-1,-1,32,-1
30840 data 90,-1,-1,-1,-1,-1,-1,83,84,85,-1,-1,-1,67,68,69
30850 data 90,90,36,37,-1,0,44,-1,46,-1,32,-1,-1,83,84,85
30860 data 90,90,52,53,-1,-1,44,-1,46,34,35,-1,34,35,-1,-1
30870 data 90,90,23,23,23,23,-1,9,46,50,51,-1,50,51,-1,-1
30880 data -1,-1,-1,23,23,23,23,-1,46,-1,-1,-1,32,-1,-1,-1
30890 data -1,0,-1,23,23,23,23,-1,46,-1,-1,-1,-1,-1,0,-1
30900 data -1,-1,-1,-1,-1,36,37,114,46,-1,0,-1,-1,-1,-1,-1
30910 data -1,13,14,15,0,52,53,90,46,90,-1,-1,34,35,-1,-1
30920 data 9,29,30,31,-1,-1,-1,90,46,90,-1,-1,50,51,-1,9

1' level 2


