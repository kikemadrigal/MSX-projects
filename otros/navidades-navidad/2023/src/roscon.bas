1 'Que es el seno de un ángulo? el seno es tan solo una relación
1 'O una forma de indicar el resultado que te dá un número dividido entre otro'
1 'sen= ordenada / radio'
1 'cos= abcisa / radio
1 ''            ***|     (xP,yP)  
1 ''        *      |   / *        
1 ''      *        |  /    *      
1 ''    * ordenada-->/       *    
1 ''  *            |/  )angulo  *  
1 ''  *            |------------*  
1 ''  *              /          *   
1 ''    *           /        *    
1 ''      *   abcisa       *      
1 ''        *           *        
1 ''            ***          
10 screen 5:color 15,1,1:open "grp:" as #1
1 'r=radio
1 'Dibujamos un círculo pekeño
1 'r=radio:c=color, d=distancia para poder ponerle un color'
20 x=120:y=90:r=15:c=4:d=0:gosub 1000
1 'dibujamos un circulo más grande'
30 x=120:y=90:r=50:c=9:d=16:gosub 1000
1 'pintamos el borde interno'
40 x=120:y=90:r=17:c=15:d=16:gosub 1000
1 ' pintamos el borde externo'
50 x=120:y=90:r=54:c=15:d=51:gosub 1000
1 'ponemos el azukiki'
70 for i=0 to 100:x=rnd(1)*(200-50)+50: y=rnd(1)*(150-30)+30: pset (x, y),15:next i
1 'pintamos varios círculos de colores'
100 gosub 2000
1 'Pinatmos la nata'
110 gosub 2100
190 preset (60,170):print #1, "Feliz dia de reyes"
200 preset (80,180):print #1, "MSX Spain"
210 gosub 2200
220 goto 210
1 'función que dibuja un círculo'
1 'input x, y, r=radio, c= color',d=desplazamiento para el color
1 'ra=radián'
    1000 PI=3.1416:ra=0
    1010 for i=0 to 360
        1020 ra=i * PI / 180
        1030 xP = x + r * cos(ra)
        1040 yP = y + r * sin(ra)
        1050 pset (xP,yP),1
    1060 next i
    1070 paint (x+d,y),c,1
1090 return







1 'pintar gelatina'
    2000 x=150:y=90:r=5:c=6:d=0:gosub 1000
    2010 x=90:y=90:r=5:c=7:gosub 1000
    2020 x=110:y=70:r=5:c=8:gosub 1000
    2030 x=115:y=50:r=5:c=10:gosub 1000
    2040 x=85:y=100:r=5:c=11:gosub 1000
    2050 x=120:y=110:r=5:c=12:gosub 1000
    2060 x=130:y=120:r=5:c=13:gosub 1000
2090 return

1 'Pintamos la nata'
    2100 x=184:y=86:r=10:c=15:d=3:gosub 1000
    2110 x=60:y=96:r=11:gosub 1000
    2120 x=90:y=40:r=11:gosub 1000
    2130 x=170:y=126:r=14:gosub 1000
    2140 x=90:y=145:r=8:gosub 1000
2190 return


1 ' Rutina pintar adorno'
    2200 x=0:y=20:i=-180:r=10: PI=3.1416
    2210 i=i+1:if co>15 then co=0
        2220 ra=i * PI / 180
        2230 xP = x + r * cos(ra)
        2240 yP = y + r * sin(ra)
        2250 pset (xP,yP),co
        2260 if x> 256 then return
        2270 if i=0 then i=-180:x=x+r*2:y=+r*2:co=co+1
    2280 goto 2210
2290 return


