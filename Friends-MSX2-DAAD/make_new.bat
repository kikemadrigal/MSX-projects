@echo off

set app=friends

rem creando el dsf
.\tools\python\python.exe .\tools\triz2DAAD\triz2DAAD.py -dr -idloc -idobj .\projects\%app%\%app%.trizbort 

rem Creando el json con el DRF
start .\tools\DRC\windows\drf.exe msx2 8_6 .\projects\%app%\%app%.dsf .\projects\%app%\%app%.json 

rem Creando en DRB
rem para la creación de un DDB es necesario tener instalado XAMPP: https://www.apachefriends.org/es/download.html
rem inicializamos el servidor web apache necesario para el lenguaje php
Set MyProcess=httpd.exe
tasklist | find /i "%MyProcess%">nul  && (echo %MyProcess% Already running) || start C:\xampp\apache\bin\httpd.exe
rem ejecutamos con php
C:\xampp\php\php.exe .\tools\DRC\drb.php MSX2 8_6 es .\projects\%app%\%app%.json
rem cerramos el servidor apache
rem tasklist | find /i "%MyProcess%">nul  && taskkill/im %MyProcess%

rem copiamos nuestro proyecto al dsk
copy .\projects\%app%\%app%.ddb dsk\DAAD.DDB
rem abrimos el emulador
start tools\openmsx\openmsx.exe -script tools\openmsx\emul_start_config.txt