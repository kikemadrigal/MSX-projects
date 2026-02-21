@echo off

rem set app=%~n1
set app=friends


rem LAS SIGUIENTES 3 LINEAS HAY QUE COMENTARLAS PARA DESPUES DE CREAR EL MAPA, CONEXIONES Y OBJETOS
rem trizbort https://github.com/JasonLautzenheiser/trizbort/releases/tag/v1.7.4.1

rem creamos el el arcivo .sce partiendo del archivo.trizbort https://pypi.org/project/triz2DAAD/
.\tools\python\python.exe tools\triz2DAAD\triz2DAAD.py .\projects\%app%\%app%.trizbort 

rem con los parametros de trizbort.py -dr para crear un ficher compatible con daar ready 0.3
rem -dsf un dsf compatible con DAAD Reborn Compiler
rem triz2sce https://pypi.org/project/triz2sce/#files
rem cd .\triz2sce
rem python triz2sce.py ..\projects\%app%\%app%.trizbort 
rem move %app%.sce ..\projects\%app%\
rem cd ..




echo Abriendo DOSBox con: %app%
rem Creamos el directorio de nuestro juego en la carpeta de dosbox
If not exist "c:\DOSBox\daad\%app%" (md c:\DOSBox\daad\%app%)
rem copiamos el juego creado con trizbort y pasado a .sce con triz2DAAD
copy projects\%app%\%app%.sce C:\DOSBox\DAAD\%app%\%app%.sce
rem copiamos el compilador que nos genera el .ddb a partir del .sce
If not exist "C:\DOSBox\DAAD\DC.EXE" (copy .\tools\DAAD\DC.EXE C:\DOSBox\DAAD) 
rem copiamos el interprete para la depuración
If not exist "C:\DOSBox\INTSD.EXE" (copy .\tools\DAAD\INTERP\INTSD.EXE C:\DOSBox\DAAD) 


rem creamos el DOSBOX.conf con el mount y el dc.exe
echo [autoexec] > .\DOSBox\DOSBox.conf
echo mount C C:\DOSBox\DAAD >> .\DOSBox\DOSBox.conf
echo C:\ >> .\DOSBox\DOSBox.conf
echo DC.EXE %app%\%app%.sce >> .\DOSBox\DOSBox.conf
echo EXIT >> .\DOSBox\DOSBox.conf
rem Abriendo DOSBox con un archivo de configuación
.\tools\DOSBox\DOSBox.exe -conf .\tools\DOSBox\DOSBox.conf 

rem Una vez DOXBOX haya terminado ponemos nuestro archivo .ddb en projects\proyecto
copy C:\DOSBox\DAAD\%app%\%app%.ddb .\projects\%app%\%app%.ddb


rem copiamos nuestro proyecto al dsk
copy .\projects\%app%\%app%.ddb dsk\DAAD.ddb
rem abrimos el emulador
start ..\tools\emulators\openmsx\openmsx.exe -script ..\tools\emulators\openmsx\emul_start_config.txt