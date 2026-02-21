1' ------------------------------------'
1' Rutinas boss / boss14000-14999 '
1' -------------------------------------'
1 'Rutina inicializar boss'

    14000 'nada'
    1 '11010 DIM dx(dm),dy(dm),dv(dm),dw(dm),dd(dm),ds(dm),dp(dm),da(dm)
    14000 bx=0:by=0:bv=8:bd=0:bs=12:bp=1:bc=11
14060 return

1 ' Rutina crear boss'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' Si y aexiste algún disparo lo eliminamos
    14100 'nada'

14180 return
1 'Rutina eliminar boss
    14200 put sprite bp,(0,212),0,bs
14290 return

1 'Rutina actualizar boss'
    1 'Si no hay disparos no pintes'
    14300 'nada'
    1 'Si hay una colision con algú bloque sólido cambiamos la dirección'
    14320 'nada'
    1 'put sprite numero_plano, (coordenada),color, numero de sprite'
    14330 put sprite bp,(bx,by),,bs
    1 'Si está fuera de la pantalla el disparo lo eliminamos, la eliminación es con la variable dn(disparo número)'
    14340 'if bx >= 256-16 then 
    14350 'if bx < 0 then 
14390 return
