

@echo off

rem set app=%~n1
set app=friends




rem creamos el el arcivo .sce partiendo del archivo.trizbort
rem .\python\python.exe .\triz2DAAD\triz2DAAD.py .\projects\%app%\%app%.trizbort 
rem cd .\triz2sce
rem python triz2sce.py ..\projects\%app%\%app%.trizbort 
rem move %app%.sce ..\projects\%app%\
rem cd ..


echo Abriendo DOSBox con: %app%
rem Creamos el directorio de nuestro juego en la carpeta de dosbox
If not exist "c:\DOSBox\daad" (md c:\DOSBox\daad)
rem copiamos el juego creado con trizbort y pasado a .sce con triz2DAAD
copy projects\%app%\%app%.sce C:\DOSBox\DAAD\%app%.sce
rem copiamos el compilador que nos genera el .ddb a partir del .sce
If not exist "C:\DOSBox\DAAD\DC.EXE" (copy .\DAAD\DC.EXE C:\DOSBox\DAAD) 
rem copiamos el interprete para la depuración
If not exist "C:\DOSBox\DAAD\INTSD.EXE" (copy .\DAAD\INTERP\INTSD.EXE C:\DOSBox\DAAD) 


rem creamos el DOSBOX.conf con el mount y el dc.exe
echo [autoexec] > .\DOSBox\DOSBox.conf
echo mount C C:\DOSBox\DAAD >> .\DOSBox\DOSBox.conf
echo C:\ >> .\DOSBox\DOSBox.conf
echo DC.EXE %app%.sce >> .\DOSBox\DOSBox.conf
echo INTSD.EXE %app%.ddb >> .\DOSBox\DOSBox.conf
rem echo EXIT >> .\DOSBox\DOSBox.conf
rem Abriendo DOSBox con un archivo de configuación
.\DOSBox\DOSBox.exe -conf .\DOSBox\DOSBox.conf 
rem .\DOSBox\DOSBox.exe -c "mount -u C" -c "mount C C:\DOSBox\DAAD" -c "c:\ " -c "cd C:\DOSBox\DAAD" -c "DC.EXE %app%.sce"  -c "INTSD.EXE %app%.ddb" 
rem crear ddb para msx
.\DOSBox\DOSBox.exe -c "mount -u C" -c "mount C C:\DOSBox\DAAD" -c "c:\ " -c "cd C:\DOSBox\DAAD" -c "DC.EXE -m4 %app%.sce"  -c "exit"

rem Una vez DOXBOX haya terminado ponemos nuestro archivo .ddb en projects\proyecto
copy C:\DOSBox\DAAD\%app%.ddb .\projects\%app%\%app%.ddb


rem copiamos nuestro proyecto al dsk
copy .\projects\%app%\%app%.ddb dsk\DAAD.ddb
rem abrimos el emulador
start openmsx\openmsx.exe -script openmsx\emul_start_config.txt