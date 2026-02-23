1 'mapas screen5 16x16


1 'Inicialize'
10 SCREEN 5,2,0:open "grp:" for output as #1
20 COLOR 15,0,0:DEFINT A-Z
25 time=0
1 'Llamamos a la rutina dibujar tiles page 1'
30 GOSUB 5000
1 'Llamamos a la rutina dibujar page 0'
40 gosub 2000
1 'Bucle para que no salga del programa'
50 GOTO 50




1 'Rutina de dibujado page 0'
    1 'dos blucles anidados(b=para las filas y a=para las columnas)'
    2000 FOR B=0 TO 12:READ D$
        2030 FOR A=0 TO 15
            2060 H$=mid$(D$,A+1,1)
            2065 'on val(H$) gosub 3000,3010,3020,3030,3040
            2070 if H$="1" then COPY(0,0)-(15,15),1 TO(A*16,B*16)
            2080 if H$="2" then COPY(16,0)-(31,15),1 TO(A*16,B*16)
            2090 if H$="3" then COPY(32,0)-(47,15),1 TO(A*16,B*16)
            2100 if H$="4" then COPY(48,0)-(63,15),1 TO(A*16,B*16)
            2110 if H$="5" then COPY(64,0)-(79,15),1 TO(A*16,B*16)
        2120 NEXT 
    2130 NEXT
    2140 preset (0,0):print #1,"fre:"fre(0)" time:"time/50
    2800 DATA 1111111111111111
    2810 DATA 1411133111115551
    2820 DATA 1111333311155551
    2830 DATA 1113333331111111
    2840 DATA 1113333331111111
    2850 DATA 1111333311111111
    2860 DATA 1111133111111111
    2870 DATA 1111122111111111
    2880 DATA 1111122111111111
    2890 DATA 1111122111111111
    2900 DATA 3333333333333333
    2910 DATA 3333333333333333
    2920 DATA 3333333333333333
2930 RETURN



1 'Rutina dibujar tiles page 1'
    5000 SETPAGE 0,1:CLS:COLOR 15,0,0
    1 'Dibujamos un cuadrado de color azul claro'
    5010 LINE(0,0)-(15,15),7,BF
    1 'Dibujamos un cuadrado rojo'
    5020 LINE(16,0)-(31,15),6,BF
    5030 CIRCLE(56,8),7,10:PAINT STEP(0,0),10
    5040 DRAW"c12bm32,0f15;bm32,15e15"
    5050 LINE(64,0)-(79,15),15,BF
    5060 setpage 0,0
5100 RETURN
