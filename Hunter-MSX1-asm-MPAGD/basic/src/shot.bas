1' ------------------------------------'
1' Rutinas disparos / fires 11000-11999 '
1' -------------------------------------'
1 'Rutina inicializar disparos'
1 'Recuerda que reservaste el espacio para X variables disparo en un array en el loader'
1 'Los disparos se irán creando dinámicamente según vayamos pulsando la barra espaciadora'
1 'Los parámteros se los metemos a ojo, la posición e y, son las del player'
1 'dn= disparo número, sirve para ir creando disparos ya que despues se incrementa'
1 'dd=disparo dirección
1 'ds=sprite'
1 'dp=plano'
1 'dc=color'
    11000 dn=0:'dd=0:dm=3
    1 '11010 DIM dx(dm),dy(dm),dv(dm),dw(dm),dd(dm),ds(dm),dp(dm),da(dm)
    11000 dx=0:dy=0:dv=8:dd=0:ds=12:dp=0:dc=11
11060 return

1 ' Rutina crear disparos'
1 ' Recuerda que hemos reservamos espacio para disparos en el loader'
    1 ' Si y aexiste algún disparo lo eliminamos
    11100 if dn>0 then gosub 11200
    1 'Posición'
    11120 dy=py
    11125 dd=pd:if dd=3 then dx=px+16 else dx=px
    1 'Físicas: velocidad'
    11130 dv=8
    1 'Render: el plano lo asignaremos según el número de siapros'
    11140 dp=2+dn
    11150 dn=dn+1
    1 'Hacemos un sonido'
    11170 re=10:gosub 4300
11180 return
1 'Rutina eliminar disparo
    11200 dn=dn-1
    11210 put sprite dp,(0,212),0,ds
11290 return

1 'Rutina actualizar disparos'
    1 'Si no hay disparos no pintes'
    11300 if dn<=0 then return
    1 'Si hay le sumamos la velocidad'
    11320 if dd=3 then dx=dx+dv else dx=dx-dv
    1 'put sprite numero_plano, (coordenada),color, numero de sprite'
    11330 put sprite dp,(dx,dy),dc,ds
    1 'Si está fuera de la pantalla el disparo lo eliminamos, la eliminación es con la variable dn(disparo número)'
    11340 if dx >= 256-16 then gosub 11200
    11350 if dx < 0 then gosub 11200
11390 return

