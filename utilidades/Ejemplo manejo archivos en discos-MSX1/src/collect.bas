
1 ' MSX MUrcia
1 ' Uso de escritura y lectura de archivos 3000 y 3500
1 ' Uso:
1 ' input"texto";variable_que_almacena_string
1 ' printspc(x) para imprimir espacios
1 ' left$(cadena) para cortar cadenas
1 ' on error goto para la gestión de errores, línea 90
1 '
1 '------------------------'
1 '|   Tabla:software      |
1 '|-----------------------  
1 '|    Id
1 '|    Name
1 '|    Plataform
1 '|    Development
1 '|    Year
1 '|    Country
1 '| 
1 '------------------------'

10 KEY OFF:WIDTH 40:SCREEN 0
1 'Ponemos el tamaño del área de caracteres a 8000 bytes'
20 CLEAR 8000
1 'sof$ es el array libros, dev$ es el array clientes'
1 'st=software tamaño,sc=software campos'
30 st=50:sc=6:DIM sof$(st,sc),dev$(5,7)
1 'p1=paginacion limite inferior, p2 paginacion limite superior'
40 p1=1:p2=5
1 'Variable utilizadas para guardar los datos en un fichero'
1 'r=registro variable utilizada para indexar los registros'
50 r=0
1 'Vemos el valor que tiene el ultimo registro almacenado en el archivo regcon.dat ene l dsk'
60 OPEN"regcon.dat"FOR INPUT AS#1
70 INPUT#1,r
80 close#1
90 on error goto 25000
1 'Leemos los datos del disco'
91 gosub 3500
1 'Todo este pifostio es para escibir el menú'
92 MP$="MENU":EU$="MSX Murcia":VO$(MA)="Fin de tarea":V1$="GESTION AUTORES":V2$="GESTION LIBROS":V3$="LISTADOS":V4$="BIBLIOTECA":V5$="GESTION FICHEROS":BP$="O4L30DFB"
93 XC=3
94 PROG$="Collections"
1 ' ------------------------------------------------------------------------------------------------------------
1 '                    Main Menu 
1 ' ------------------------------------------------------------------------------------------------------------
100 CLS
110 'X=0:Y=0:GOSUB 15000:PRINT CHR$(1);CHR$(&H58);:FOR V=1 TO 6:PRINT CHR$(1);CHR$(&H57);:NEXT V:PRINT CHR$(1);CHR$(&H59);
120 'X=XC+6:Y=0:GOSUB 15000:PRINT EU$:X=0:Y=Y+1:GOSUB 15000:PRINT CHR$(1);CHR$(&H56);" ";MP$;" ";CHR$(1);CHR$(&H56);:Y=Y+1:X=0:GOSUB 15000:PRINT CHR$(1);CHR$(&H56);"      ";CHR$(1);CHR$(&H56);:PRINT SPACE$(5);:PRINT PRO$
130 'X=0:Y=Y+1:GOSUB 15000:PRINT CHR$(1);CHR$(&H5A);:FOR V=1 TO 6:PRINT CHR$(1);CHR$(&H57);:NEXT V:PRINT CHR$(1);CHR$(&H51);:FOR V=1 TO 30:PRINT CHR$(1);CHR$(&H57);:NEXT V
140 PRINT:PRINT:PRINT:PRINTTAB(9)"1. Software management"
150 PRINT:PRINTSPC(9)"2. Developer management"
160 PRINT:PRINTSPC(9)"3. Save data file"
170 PRINT:PRINTSPC(9)"4. Read data file"
180 PRINT:PRINTSPC(9)"5. Exit"
190 PRINT:PRINT:PRINT:PRINTSPC(15)"Option?"
1 'Captura de teclado'
190 OP$=INKEY$:OP=VAL(OP$):IF OP<1 OR OP>4 THEN 190
200 ON OP goto 1000,200,3000,3500,30000
1 ' ------------------------------------------------------------------------------------------------------------
1 '                    Gestión software 
1 ' ------------------------------------------------------------------------------------------------------------
    1 ' ----------------
    1 ' - Consulta software -
    1 ' ----------------
        1 'Mostrar todos los registros'
        1000 CLS:width 80:PRINTSPC(25)" Seleccionar ":PRINT
        1005 print "Registros del "p1" al "p2", ultimo insertado el "r-1
        1010 ca$="Index":gosub 15100:c0$=ca$
        1020 ca$="Name":gosub 15200:c1$=ca$
        1030 ca$="Plataform":gosub 15100:c2$=ca$
        1040 ca$="Develop":gosub 15200:c3$=ca$
        1050 ca$="year":gosub 15100:c4$=ca$
        1060 ca$="Country":gosub 15100:c5$=ca$
        1070 PRINT c0$" "c1$" "c2$" "c3$" "c4$" "c5$
        1075 print
        1080 FOR x=0 TO st-1
            1 'paginación'
            1085 if x<p1 or x>p2 then goto 1170 
            1090 ca$=sof$(x,0):gosub 15100:c0$=ca$
            1100 ca$=sof$(x,1):gosub 15200:C1$=ca$
            1110 ca$=sof$(x,2):gosub 15100:c2$=ca$
            1120 ca$=sof$(x,3):gosub 15200:c3$=ca$
            1130 ca$=sof$(x,4):gosub 15100:c4$=ca$
            1140 ca$=sof$(x,5):gosub 15100:c5$=ca$
            1150 PRINT c0$" "c1$" "c2$" "c3$" "c4$" "c5$
            1160 print"--------------------------------------------------------"
        1170 next x
        1180 PRINT"N.registro actualizar / C crear / E salir / N siguiente/ P anterior"
        1181 PRINT:INPUT"Option: ";op$
        1182 if op$="P" or op$="p" then p1=p1-5:p2=p2-5: goto 1000
        1183 if op$="N" or op$="n" then p1=p1+5:p2=p2+5: goto 1000
        1185 if op$="C" or op$="c" then width 40:gosub 1200 
        1186 if op$="E" or op$="e" then width 40: goto 100 
        1187 in=val(op$):if in>0 or in<1000 then  width 40:gosub 1300 else 1182
        1 'else op=VAL(OP$):IF op<1 OR op>4 THEN 1120 else gosub 1300
    1193 goto 100

    1 '-----------------------------
    1 '     Insertar sotware 
    1 '-----------------------------
        1200 CLS:PRINTSPC(10)"Crear software"
        1210 PRINT
        1230 sof$(r,0)=str$(r)
        1240 PRINT:INPUT"Name: ";sof$(r,1)
        1250 PRINT:INPUT"Plataform: ";sof$(r,2)
        1260 PRINT:INPUT"Developers: ";sof$(r,3)
        1270 PRINT:INPUT"Year: ";sof$(r,4)
        1280 PRINT:INPUT"Country: ";sof$(r,5)
        1290 PRINT:PRINT:PRINTSPC(10)"ES CORRECTO S/N?":PRINT
        1 'Si los datos son correctos salimos al menu de gestión de sofware'
        1 'Aunmentamos el registro contador y los guardamos en el disco'
        1 'Guardamos los nuevos datos en el disco'
        1291 op$=INKEY$:IF op$="S" or op$="s" THEN r=r+1:OPEN"regcon.dat"FOR OUTPUT AS#1:PRINT#1,r:close#1:gosub 3000:goto 1000
        1 'si no es correcto volvemos a pintar la pantalla vacía y si no se pulsa nada volvemos a pedir la teecla'
        1292 IF op$="N" or op$="n" THEN 1200 else 1291
    1299 return

    
    1 '-----------------------------
    1 '     Update sotware 
    1 '-----------------------------
        1300 rem update
        1 '1310 FOR X=0 TO st-1
        1 '    1 'Si el registro de software ha sido encontrado'
        1 '    1315 va=val(sof$(X,0))
        1 '    1320 IF va=in THEN w=X:GOTO 1340
        1 '1330 next X
        1340 ca$=sof$(in,0):gosub 15100:c0$=ca$
        1350 ca$=sof$(in,1):gosub 15200:c1$=ca$
        1360 ca$=sof$(in,2):gosub 15100:c2$=ca$
        1370 ca$=sof$(in,3):gosub 15200:c3$=ca$
        1380 ca$=sof$(in,4):gosub 15100:c4$=ca$
        1390 ca$=sof$(in,5):gosub 15100:c5$=ca$

        1400 cls:locate 10,0:PRINT"Index: "c0$
        1410 locate 0,2:PRINT"Name: "c1$
        1420 locate 20,3:PRINT string$(14,"-")
        1430 locate 0,4:PRINT"Platform: "c2$
        1440 locate 20,5:PRINT string$(14,"-")
        1450 locate 0,6:PRINT"Develop: "c3$
        1460 locate 20,7:PRINT string$(14,"-")
        1470 locate 0,8:PRINT"Year: "c4$
        1480 locate 20,9:PRINT string$(14,"-")
        1490 locate 0,10:PRINT"Country: "c5$
        1500 locate 20,11:PRINT string$(14,"-")
        1 'Una vez pintado posicionamos el cursor en el nombre'
        1510 locate 19,2:printspc(1):INPUT" ";sof$(in,1)
        1520 locate 19,4:printspc(1):INPUT" ";sof$(in,2)
        1530 locate 19,6:printspc(1):INPUT" ";sof$(in,3)
        1540 locate 19,8:printspc(1):INPUT" ";sof$(in,4)
        1550 locate 19,10:printspc(1):INPUT" ";sof$(in,5)
        1 'Conforme vayamos pulsando enter posicionamos el cursor uno más abajo'
        1560 locate 0,14:PRINT:INPUT"D para eliminar,salvar S/N?: ";op$
        1 'Si guardamos los cambios guardamos los datos en el disco gosub 3000'
        1570 if op$="S" or op$="s" then :gosub 3000:1000
        1580 if op$="N" or op$="n" then  1510
        1580 if op$="D" or op$="d" then  1700
    1590 goto 1000

    1 '-----------------------------
    1 '     Delete sotware 
    1 '-----------------------------
    1700 rem delete
    1710 ca$=sof$(in,0):gosub 15100:c0$=ca$
    1720 ca$=sof$(in,1):gosub 15200:c1$=ca$
    1730 ca$=sof$(in,2):gosub 15100:c2$=ca$
    1740 ca$=sof$(in,3):gosub 15200:c3$=ca$
    1750 ca$=sof$(in,4):gosub 15100:c4$=ca$
    1760 ca$=sof$(in,5):gosub 15100:c5$=ca$

    1770 cls:locate 10,0:PRINT"Index: "c0$
    1780 locate 0,2:PRINT"Name: "c1$
    1790 locate 0,4:PRINT"Platform: "c2$
    1800 locate 0,6:PRINT"Develop: "c3$
    1810 locate 0,8:PRINT"Year: "c4$
    1820 locate 0,10:PRINT"Country: "c5$

    1830 PRINT:PRINT:PRINTSPC(8)"DESEAS DAR DE BAJA S/N?"
    1840 op$=INKEY$:IF op$="S" or op$="s" THEN sof$(in,1)="":sof$(in,2)="":sof$(in,3)="":sof$(in,4)="":sof$(in,5)="":gosub 1900:GOTO 1000
    1850 IF op$="N" or op$="n" THEN 1000 else 1840
    1890 goto 1000


    1 '------------------------------------------------------
    1 '     Actualizar indices hasta el último por borrar
    1 '------------------------------------------------------
    1900 FOR x=in TO r
        1 'Ocuparán el lugar del eliminado en el array'
        1930 sof$(x,1)=sof$(x+1,1)
        1940 sof$(x,2)=sof$(x+1,2)
        1950 sof$(x,3)=sof$(x+1,3)
        1960 sof$(x,4)=sof$(x+1,4)
        1970 sof$(x,5)=sof$(x+1,5)
    1980 next x
    1 'Actualizamos el indice'
    1985 r=r-1:OPEN"regcon.dat"FOR OUTPUT AS#1:PRINT#1,r:close#1
    1990 return
1 ' ------------------------------------------------------------------------------------------------------------
1 '                    Gestión de archivos 
1 ' ------------------------------------------------------------------------------------------------------------

    1 '-----------------------------------
    1 '    Escritura de archivo datos.dat
    1 '-----------------------------------
        1 'sof$(20,3)
        3000 cls:PRINT"Cuando este preparado pulse una tecla para grabar en el disco";
        3010 op$=INKEY$:IF op$=""THEN 3010
        3020 PRINT"Grabando en disco";
        3030 OPEN"data.dat"FOR OUTPUT AS#1
        3040 FOR x=0 TO st-1
            1 'Grabamos la id'
            3050 PRINT#1,sof$(x,0)
            1 'Grabamos el nombre'
            3060 PRINT#1,sof$(x,1)
            1 'Grabamos l aplataforma'
            3070 PRINT#1,sof$(x,2)
            3080 PRINT#1,sof$(x,3)
            3090 PRINT#1,sof$(x,4)
            3100 PRINT#1,sof$(x,5)
        3110 next x
        3120 close#1
    3490 goto 100

    
    1 '-----------------------------------
    1 '     Lectura de archivo datos.dat
    1 '-----------------------------------
        3500 cls
        3510 'ON ERROR GOTO
        3520 PRINT"Buscando fichero data.dat en disco"
        3530 OPEN"data.dat"FOR INPUT AS#1
        3540 PRINT"Lectura de ficher data.dat"

        3550 FOR x=0 TO 7
            1 'Grabamos la id'
            3560 INPUT#1,sof$(x,0)
            1 'Grabamos el nombre'
            3570 INPUT#1,sof$(x,1)
            1 'Grabamos l aplataforma'
            3580 INPUT#1,sof$(x,2)
            3590 INPUT#1,sof$(x,3)
            3600 INPUT#1,sof$(x,4)
            3610 INPUT#1,sof$(x,5)
        3620 next x
        3630 close#1
    3990 goto 100
    















1 ' ------------------------------------------------------------------------------------------------------------
1 '                    Útiles 
1 ' ------------------------------------------------------------------------------------------------------------



10060 ' ---- FIN DE PROGRAMA ----
10070 CLS:LOCATE12,11:PRINT"HASTA PRONTO !":FOR X=1 TO 1000:NEXT:CLS:END
15000 ' ------------------
15010 '  POSICIONA CURSOR
15020 ' ------------------
    15030 LOCATE X,Y
15040 RETURN
1 'Formateamos el string a 6 caracteres
1 'Si la longitud es mayor que 6 lo recortamos
1 'Si es menor que 6 rellenamos con espacios a la derecha'
    15100 n=len(ca$)
    15110 if n>6 then ca$=left$(ca$,6) 
    15120 if n<7 then for i=n to 6: ca$=ca$+" ":next i
15190 return
1 'Formatemos el string a 15 caracteres'
    15200 n=len(ca$)
    15210 if n>10 then ca$=left$(ca$,10) 
    15220 if n<11 then for i=n to 10: ca$=ca$+" ":next i
15290 return

20000 ' ------------------
20010 '  PRESENTA MASCARA
20020 ' ------------------
    20030 CLS
    20040 X=0:Y=0:GOSUB15000:PRINT CHR$(1);CHR$(&H58);:FOR V=1 TO 6:PRINT CHR$(1);CHR$(&H57);:NEXT V:PRINT CHR$(1);CHR$(&H59);:X=XC+6:GOSUB 15000:PRINT EU$
    20050 OPZ$=LEFT$(STR$(OPZ),2)
    20060 Y=Y+1:X=0:GOSUB 15000:PRINT CHR$(1);CHR$(&H56);"VOZ";OPZ$;" ";:PRINT CHR$(1);CHR$(&H56);
    20070 Y=Y+2:X=0:GOSUB 15000:PRINT CHR$(1);CHR$(&H5A);:FOR V=1 TO 6:PRINT CHR$(1);CHR$(&H57);:NEXT V:PRINT CHR$(1);CHR$(&H51);:FOR V=1 TO 30:PRINT CHR$(1);CHR$(&H57);:NEXT V
    20080 Y=Y-1:X=0:GOSUB 15000:PRINT CHR$(1);CHR$(&H56);SPC(6);CHR$(1);CHR$(&H56)
20110 RETURN

1 'Rutina de gestión de errores'
    25000 print "Codigo de error "ERR
25090 END

30000 cls:end
