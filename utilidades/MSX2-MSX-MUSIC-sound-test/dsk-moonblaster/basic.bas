10 BLOAD"basic.bin",R
20 print "Prueba para Josep"
30 call MBKLOAD("misample.mbk")
1 '40 call MBMLOAD("musica.mbm")
40 call MBMLOAD("heroic.mbm")
50 call MBCHIP(1):call MBPLAY
1 'Otras instrucciones: _MBSTOP , _MBHALT (pausar), _MBCONT (continuar), _MBFADE(15) (desvanecer)