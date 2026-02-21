10 cls
1 '20 bload "music.bin"
1 'en screen 5: color 15,1,1 para texto blanco, fondo negro, borde negro'
1 'en screen 8: color32*7+4*7+3 para el verde del 0 al 7, para el rojo del 0 al 7, para el azul del 0 al 3
10 screen 8,0,0:color 0,255,255: bload"loader.s08",s
20 key off:open "grp:" as #1:preset (0,0):print #1,"Feliz navidad a todos"
30 preset (130,110):print #1,"Amor"
50 preset (120,120):print #1,"por MSX"
60 close
90 load"main.bas",r

