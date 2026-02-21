1 '-----------------------------------'
1  '       Enemy 12000-12999
1 '-----------------------------------'

1 'Init
    1 'Definiendo el espacio para los arrays con los valores de los enemigos' 
    1 'em=enemigos maximos'
    1 'en=enemigo numero, variable utilizar para gestionar la creación y destrucción de enemigos'
    1 'er=enemigo a borrar, remove '
    12000 em=3
    12010 en=0
    1 'ex=coordenada x, ey=coordenada y'
    1 'ev=velocidad enemigo eje x, ew=velocidad eje y'r'
    1 'ed=enemigo dirección'
    1 'es=enemigo sprite, ep=enemigo plano'
    1 'ep=enemigo plano'
    1 'ec=enemigo color'
    1 'et= define el tipo, si es un perro, un pinguino, un pájaro, etc
    1 'ee=enemigo energia '
    1 'ef=enemigo frame'
    1 'Perro sprites derecha 13 y 14, izquierda 15 y 16 '
    1 'Conejo derecha 17,18  i<quierda 19,20'
    1 'Tortuga derecha 21,22   izquierda 23,24'
    1 'Reservamos el espacio en RAM para 5 enemigos'
    12020 DIM ex(em),ey(em),ev(em),ew(em),ed(em),es(em),ep(em),ec(em),et(em),ee(em),ef(em)
12030 return

1 ' Crear enemigo'
    12500 if en>5 then return
    12530 ev(en)=8:ew(en)=8
    12540 ed(en)=3
    12550 es(en)=13
    12560 ep(en)=10+en
    12570 ec(en)=6
    12580 en=en+1
12590 return

1 ' Rutina eliminar enemigos'
    12600 en=en-1
    12610 ex(er)=0:ey(er)=212
    12620 put sprite ep(er),(ex(er),ey(er)),0,es(er)
    12630 ex(er)=ex(en):ey(er)=ey(en):ev(er)=ev(en):es(er)=es(en):ep(er)=ep(en) 
    1 'Quitmos el sprite ya que si no se queda congelado'
    12640 'put sprite ep(ed),(-16,0),ec(ed),es(ed)
   
    12650 'en=en-1
12660 return

1 'Update enemigo'
    12700 if en<=0 then return
    12710 for i = 0 to en-1
        1 'Chequeo bloques collectables'
        1 'vamos a coprobar los tiles de alrededor y sobre el que estamos'
        1 'Lo siguiente lo necesitamos para que no compruebe el tile sobre el que estamos sino el siguiente o anterior según la dirección'
        12720 if ed(i)=3 then gx=ex(i)+8 else if ed(i)=7 then gx=ex(i)-8
        1 'La rutina 13600 nos devuelve los tiles de alrededor si le paamos primero el gx y gy'
        12730 gy=ey(i):gosub 13600

        1 'Si el tile en el que estamos no es sólido invertmos la velocidad horizontal'
        12740 if t5<>tw then ev(i)=-ev(i):if ed(i)=7 then ed(i)=3 else if ed(i)=3 then ed(i)=7
        12750 if ex(i)>256-40 then ex(i)=ex(i)-ev(i): if ex(i)<0 then ex(i)=ex(i)-ev(i)
        12755 ex(i)=ex(i)+ev(i)
        12756 ef(i)=ef(i)+1:if ef(i)>1 then ef(i)=0
        1 'Chequeamos la colisión con el player'
        1 'La rutina 10200 es cuando el player muere'
        12760 if ex(i) < px + 16 and ex(i) + 16 > px and ey(i) < py + 16 and 16 + ey(i) > py then gosub 10200
        1 'chequeamos la colisión con la bala'
        1 'La rutina 12600 es cuando el enemigo muere'
        1 'Con ed=i, almacenamos la posición de array que se va a sobreescribir con el último enemigo del array'
        1 'Con gosub 11200 eliminamos la bala'
        12770 if ex(i) < dx + 16 and ex(i) + 16 > dx and ey(i) < dy + 16 and 16 + ey(i) > dy then er=i:gosub 12600:gosub 11200
        
        1 'Sistema de animación enemigo'
        12780 if ed(i)=7 then es(i)=es(i)+2
        12785 if ef(i) mod 2 = 0 then es(i)=es(i)+1
        1 'put sprite numero_plano, (coordenada),color, numero de sprite'
        12790 put sprite ep(i),(ex(i),ey(i)),ec(i),es(i)
        12795 if ef(i) mod 2 = 0 then es(i)=es(i)-1
        12796 if ed(i)=7 then es(i)=es(i)-2
    12800 next i
12810 return





