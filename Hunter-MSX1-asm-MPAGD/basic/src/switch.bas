1' ------------------------------------'
1' Rutinas switch /  switch 16000-16999 '
1' -------------------------------------'



1 ' Rutina Inicializar stiwch'
    1 'Plano 0 player, plano 1 disparo, enemigos del 2 al 10, buo 11, mono 12, interruptor 13, jefe 14'
    1 'put sprite plano, x, y, color y sprite'
    1 'sx y sy coordenadas switch x e y'
    1 'ss=sprite switch'
    1 'sp=plano switch'
    1 'sc=color switch'
    1 'sh=switch habilitado'
    16000 sx=0:sy=0:ss=47:sp=13:sc=6:sh=0
16180 return

1 'Rutina pintar switch '
    1 'el interruptor se pintará desactivado si el switch no está habilitado'
    16300 put sprite sp,(sx,sy),sc,ss
    1 'Pintamos la puerta que viene con el switch'
    16310 for i=8 to 24 step 8: copy (8,8)-((8)+8,(8)+8),1 to (tp,tq+i),0:next i
16390 return

1 'Rutina habilitar instruuptor'
    1 '16400 if sh=0 then sh=1:sc=3:ss=ss+1:for i=8 to 24 step 8: copy (0,0)-(8,8),1 to (tp,tq+i),0,tpset:next i
    16400 if sh=0 then sh=1:sc=3:ss=ss+1:line(tp,tq)-(tp+8,tq+24),14,bf
    1 'Pintamos los tiles de fondo'
    1 '16420 for i=8 to 24 step 8: copy (8,40)-(8+8,39+8),1 to (tp,tq+i),0:next i

    16430 put sprite sp,(sx,sy),sc,ss
16490 return


