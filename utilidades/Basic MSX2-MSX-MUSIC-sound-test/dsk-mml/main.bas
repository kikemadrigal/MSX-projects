1 'https://www.msx.org/wiki/PLAY

1' Las notas son 
1 'do  re mi fa so la si'
1 'a   b  c  d  e  f  g 
1 'Siendo la a la más grave y g la más aguda'
1 'v=volumen del 0 al 15, siendo el 15 el más alto'
1' l=duración de las notas de 1 a 64 siendo el 64 el más corto
1 'o=octava del 1 al 8, cuando siendo el 8 el más fino o agudo'
1 'r=pausa de 1 a 64, suendo la 64 la más corta'
1 'T=velocidad e ejecución 0-250 siendo 250 la más rápida'

1 'Inicializamos el traker'
1 'Inicilizamos el juego'
1 'inicializamos el psg &h90'
10 defusr2=&H90
40 cls: print "Presiona con el teclado el numero de la cancion a reproducir"
50 locate 0,3:print "1 Escuchar caffarena"
60 locate 0,4:print "2 Escuchar intro Aland"
70 locate 0,5:print "3 Escuchar game over Aland"

1 'Inicializamos el tracker'
80 gosub 3500

1 ' --------------------------------------------------------------'
1 '   INPUT
1 ' --------------------------------------------------------------'
    1000 k$=inkey$
    1010 k=val(k$)
    1020 locate 0,8:print "escogida: "k
    1030 if k=1 then locate 0,10:print "Espera a que termine":re=1: gosub 4000:locate 0,10:print "                         "
    1040 if k=2 then locate 0,10:print "Espera a que termine":re=2: gosub 4000:locate 0,10:print "                        "
    1050 if k=3 then re=3: gosub 4000
    1060 if k=5 then locate 0,10:print "Espera a que termine":re=5: gosub 4000:locate 0,10:print "                        "
    1 '1040 if strig(0)=-1 then a=usr2(0) else goto 1040
1990  goto 1000

3500 rem música
    1 'Con envolvente'
    1 'T=250 la velocidad de todo el string será un poco rápida'
    1 'L=10 es como la T pero con trozos de notas'
    1 'v12=el columen se escuchará más fuerte que el acompñamiento y a que es la música principal'
    1 'O2=la más grave es la octava 1, esta será bastante grave'
    1 'a,b,c,d,e,f,g=las notas irán bajando de grave a más agudo en la misma octava (piensa en la música de game over)'
    1 'r10= la pausa puede ser de 0 a 64 siendo 64 la más corta, esto lo he hexo a ojo'
    1 'Escribiendo m1000 s2 cccccccc es posible crear un efecto de subida y bajada de notas, esto es la envolvente, con m la velocidad, con s el tipo"
    3510 s1$="V13 O1 L4 aaa V10 a V13 bbb V10 b V13 L2 O2 cdeg+"
    3520 s2$="V14 O4 L8 a V15 O6 c O5 b O6 c O4 V14 L8aaaV12aV14g+V15O6dcdO4V14L8g+g+g+V12g+V15O5aO6cO5babO6dcO5bO6cedcO5bebe"
    3530 s3$="V13O4L2ecdeL8 aO5cO4bO5cO3L8aaaV10aV13g+O5dcdO3L8g+g+g+v10g+"
    
    
    1 ' Intro'
    1 '--------'
    1 'Música prinipal       
    3540 s4$="t150 V10 L2 O3 gfe l6 dedec l2  o4 gfe l6  dedec o5 l2 gfe l6  dedec   o3 l2 gfe l6  dedec o4 l2 gfe l6  dedec   o5 l2 gfe l6  dedec l2 gfe l6  dedec"
    1 'Algún efecto'
    3550 s5$="t150 V10 L2 O2 gfe l6 deggg l2     gfe l6  deggg l2    gfe l6  deggg      l2 gfe l6  deggg l2    gfe l6  deggg      l2 gfe l6  deggg l2 gfe l6  deggg"
    1 'Acompañamiento'
    3560 s6$=""
     
     
    3570 s7$="t150 V10 L2 O3 gfe l6 dedec l2  o4 gfe l6  dedec o5 l2 gfe l6  dedec   o3 l2 gfe l6  dedec o4 l2 gfe l6  dedec   o5 l2 gfe l6  dedec l2 gfe l6  dedec"
    1 'Algún efecto'
    3580 s8$="t150 V10 L2 O2 gfe l6 deggg l2     gfe l6  deggg l2    gfe l6  deggg      l2 gfe l6  deggg l2    gfe l6  deggg      l2 gfe l6  deggg l2 gfe l6  deggg"
    1 'bateríaaaaaaa'
    3590 s9$="T250 V8  O1 gr50 O3 ar40 O1 gr50 gr50 O3 ar40 gr50 gr50  O1 gr50 O3 ar40 O1 gr50 gr50 O3 ar40 gr50 gr50  O1 gr50 O3 ar40 O1 gr50 gr50 O3 ar40 gr50 gr50  "
    
     
    
    1 'Game over'
    1 '-----------'
    1 'Música principal'
    3600 sa$="T150 V12 L10 O2 fff R10 eee r10 ddd r8 l8 ccccccav10cgegcgegv4cgegcgegV2cgeg "
    1 ' Acompñamiento'
    3610 sb$="T150 V8  L10 O2 bbb R10 bbb R10 bbb r8 bbbbbbbbbbbbbbbb"
3999 return
4000 rem reproductor de música
    4000 a=usr2(0)
    4010 'PLAY"T150","T150","T150"
    1 ' Intro'
    4020 if re=1 then play s1$,s2$,s3$
    4050 if re=2 then PLAY s4$,s5$
    4060 if re=3 then PLAY sa$,sb$

4990 return



