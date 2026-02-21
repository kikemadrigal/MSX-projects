1' ------------------------------------'
1' Rutinas owl /  buho 15000-15999 '
1' -------------------------------------'
1 'Rutina inicializar boss'

    15000 'nada'
    1 '11010 DIM dx(dm),dy(dm),dv(dm),dw(dm),dd(dm),ds(dm),dp(dm),da(dm)
    15000 ox=0:oy=0:ov=8:od=0:os=12:op=1:oc=11
15060 return

1 ' Rutina crear buho'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' Si y aexiste algún disparo lo eliminamos
    15100 'nada'

15180 return
1 'Rutina eliminar boss
    15200 put sprite op,(0,212),0,os
15290 return

1 'Rutina actualizar buho'
    1 'Si no hay disparos no pintes'
    15300 'nada'

    15330 put sprite op,(ox,oy),,os

15390 return
