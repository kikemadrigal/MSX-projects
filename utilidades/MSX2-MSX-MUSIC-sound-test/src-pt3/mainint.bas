10 screen 0
15 defint a-z:clear 200, &hBEFF
20 bload "musicint.bin"
1 'Rutina ensamblador inicializar reproductor'
30 defusr=&hbf00
40 a=usr(0)
1 ' Rutina enamblador cambiar valor variable PT3_SETUP para evitar repetir canción, ver línea 500'
50 defusr2=&hBF1A
1 ' Rutina ensamblador parar canción'
1 '60 defusr3=&hBF13
60 defusr3=&hBF2B 


100 Print "Repoduciendo musica - comunicacion con ensamblador"
120 locate 0,5:print chr$(94)" Reproducir"
130 locate 0,6:print "> Reiniciar"
140 locate 0,7:print "< Parar"
150 locate 0,8:print "v Pausar"
160 'locate 0,9:print " No repetir cancion"
170 'locate 0,10:print " Repetir cancion"

1' Rutina blucle chequear cursores
170 gosub 6000
180 goto 170

1 ' Rutina reproducir bloque
1 '200 defusr1=&hbf09
200 defusr1=&hBF1F
210 a=usr1(0)
1 ' Chequeo teclado
220 gosub 6000
260 goto 200

1''Rutina reiniciar'
300 gosub 6000
310 a=usr(0)
340 goto 200

1''Rutina pausar'
400 gosub 6000
440 goto 400

1''Rutina evitar repetir cancion'
1 ' Le decimos que solo reproduzca una canción poniendo el 7 bit a 1 como dice en las instrucciones, este valor será almacenado en la dirección &hf7f8 (ver manual usr comand)'
500 a=usr2(64)
510 goto 200

1'Rutina parar
600 a=usr3(0)
610 goto 170

1''Rutina repetir cancion'
700 a=usr2(2)
710 goto 200

1 'Subrutina captura movimiento joystick / cursores y boton de disparo'
    6000 j=stick(0)
    1' Arriba Reproducir
    6020 if j=3 then goto 200
    1 ' Izquierda Parar'
    6030 if j=7 then goto 600
    1' Derecha reiniciar
    6040 if j=1 then goto 300
    1 ' Abajo pausar'
    6050 if j=5 then goto 400 
6080 return

