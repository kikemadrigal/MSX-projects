5 cls:locate 2,2
10 print "Elige el modo de la imagen";
15 locate 0,6
20 print "1. Screen 2, escrita en un archivo basic";
25 locate 0,8
30 print "2. Screen 2,Escrita en un archivo sc2 y cargada desde basic";
35 locate 0,10
40 print "3. Screen 2,Escrita en un archivo asm y cargada desde basic -aqui";
45 locate 0,12
50 print "4. Screen 5, Escrita en un archivo sc2 y cargada desde basic ";
55 locate 0,14
60 print "5. Screen 5, escrita en ensamblador y cargada desde basic, aqui";

70 k$=inkey$
    80 if k$="1" then gosub 200
    90 if k$="2" then gosub 230
    100 if k$="3" then gosub 280
    120 if k$="4" then gosub 500
    130 if k$="5" then gosub 600
140 goto 70


1 ' Todos los bytes escritos en basic'
200 Locate 2,20:print "Espera....";
210 load "1.bas",r
220 return

230 screen 2
240 BLOAD"1.SC2",S
250 goto 1000

280 bload "1.bin",r
290 k$=inkey$:if k$="" then goto 290
300 goto 1000


1 ' y haberle cambiado el tamaño con photshop a 256x212px'
500 screen 5
510 DATA 1,1,1,2,2,1,2,2,2,3,3,3,4,3,2,4,3,3,4,4,4,5,4,3
520 DATA 6,4,3,6,5,3,5,5,5,5,5,6,7,6,3,7,7,3,6,6,6,7,7,7
530 FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
540 BLOAD"1.SC5",S
550 goto 1000


600 bload"1sc5.bin",r
610 goto 1000



1000 k$=inkey$:if k$="" then goto 610
1010 screen 0: load"main.bas",r





