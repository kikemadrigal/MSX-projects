1 ' ------------------------------------'
1 '     Loader - inicializador          '
1 ' ------------------------------------'




1 ' Inicilizamos dispositivo: 003B, inicilizamos teclado: 003E, inicializamos el psg'
10 defusr=&h003B:a=usr(0):defusr1=&h003E:a=usr1(0):defusr2=&h0090:a=usr2(0)
20 SCREEN 5,2

1 ' Mostramos la pantalla de carga'

30 OPEN"grp:"AS#1:COLOR 15:PRESET(0,10):PRINT#1,"Cargando...":close #1
40 cls:bload "tileset.bin", s, 32768
1 ' Definicimos la estructura de nuestras entidades'


1 ' Definimos nuestro mapa o niveles'




1 ' Cargamos nuestros gráficos'
1000 'gosub 9700
1010 'gosub 9800
1 '1020 goto 1020


1 ' Cargamos nuestros sprites'



1 ' Cargamos el main'
3000 load "game.bas",r
















9800 bload"tileset.bin",s,32768
9810 return




1'




