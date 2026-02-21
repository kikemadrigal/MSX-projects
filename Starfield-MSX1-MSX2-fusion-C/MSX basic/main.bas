5 'call turbo on
10 dim b$(1)
15 screen 1:defint a-z:key off:color 15,1,1


1 'Esta parte es para que aparecan las letras en la pantalla'
1 'Creamos un array de 2 posiciones con 2 strings de 24 carcateres en la 1 posición metermos las letras de la A-Z en la 2 las letras de la a-z'
1 'Fíjate que no utilizamos la letra (Y)'
20 b$(0)="ABCDEFGHIJKLMNOPQRSTUVWX"
30 b$(1)="abcdefghijklmnopqrstuvwx"
40 for j=0 to 31 step 2
    42 for k=0 to 1
        1 'obtenemos un número aleatorio de 0 a 24
        44 r=int(rnd(1)*24)
        1 'right extrae los carácteres de la cadena empezando por la derecha, en el caso de que r=4 extraerá ABCD'
        46 b$(k)=right$(b$(k),r)+left$(b$(k),24-r)
    48 next k
    50 for i=0 to 23
        1 'en la posición de la vram 6144 / h1800 es donde empieza el mapa de nombres (por favor, estudia la estructura de la VRAM MSX1)'
        60 for k=0 to 1
            62 vpoke &h1800+k+j+i*32,asc(mid$(b$(k),i+1,1))
        64 next k
    70 next i
75 next j


1 '20 for c=0 to 31 step 2
1 '    30 for f=0 to 23
1 '        40 vpoke &h1800+c+f*32,rnd(1)*(87-65)+65
1 '        50 vpoke &h1800+c+1+f*32,rnd(1)*(119-97)+97
1 '    60 next f
1 '70 next c


1 'La posición 520/8=carácter 65 que es la A y aquí empiezan las letras de la A-Za-z, 520+456=976/8= es el carácter=z'
1 'Vamos a poner en transparente (con ceros) 32 carácteres
1 'la defición de los carácteres se encuentra en la dirección 0 a la BRAM como solo keremos borrar de la A a la z empezamos por la 512'
80 for i=0 to 456
    82 vpoke 520+i,0
84 next i


1 'blucle'
    1 'desde el 526/8=carácter 65 ( A ), es decir a partir de aquí empieza la A mayúscula'
    1 'iremos tocando cada uno de los bytes de las líneas que configuran el carácter'
    100 vpoke 526+k,0
    1 'Aumenta de 10 en 10 si k es menor que 191 si es mayor k=0, k cambiará las letras mayúsculas'
    120 k=k*-(k<191)+10
    130 vpoke 526+k,1
    1 '782 que es el 782/8=carácter 97  ( a ) y a partir de akí empecieza la a minúscula
    140 vpoke 782+h,0
    1 'h aumenta de 2 en 2 desde 0 a 191 si es 192 h=0, h cambiará las letras minúsculas'
    1 'la ultima letra será 774+191=965/8=120 la ( x )'
    150 h=h*-(h<191)+2
    160 vpoke 782+h,1

    1 'La Y la única letra que no guardamos en el array
    170 print chr$(27)"Y"
180 goto 100

200 'call turbo off

