1 'MSX 1
1 'machine Sony_HB-55P -ext Sony_HBD-50
1 'MSX2
1 'machine Philips_NMS_8255 
1 'MSX2+
1 'machine Sony_HB-F1XV
1 'Es importante dejar screen2 que es el screen que soportan todas las versiones'
10 SCREEN 2,2,0:open "GRP:" as #1
15 IF PEEK(&HFFA7)=&HC9 THEN PRINT"No disk installed": END
1 'En la dirección &h2D el MSX almacena la versión e MSX: 0=MSX1, 1=MSX2, 2=MSX2+, 3=MSXturboR'
1 'Si es un MSX1 vamos al final del programa'
20 if PEEK(&H2D)=0 then print #1,"Lo siento tu MSX en un MSX1 y no puede ejecutar mi juego, necesitas un MSX2+": goto 1000
30 a=vdp(-1)
40 c=a and &b00001110
1 'Si no es un MSX2+ vamos al final del programa'
50 if c <> 4 then print #1,"Lo siento pero tu MSX es un MSX2 y no puede ejecutar mi juego, necestas un MSX2+": goto 1000
60 print #1,"Bién estas en un MSX2+!!!!"


1000 goto 1000
