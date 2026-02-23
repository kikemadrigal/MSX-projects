
rem para desactivar los mensajes de los programas
rem @echo off
rem sjasm (http://www.xl2s.tk/) es un compilador de ensamblador z80 que puedo convertir tu código ensamblador en los archivos binarios.rom y .bin
rem necesitamos el .bin de la pantalla de carga y del reproductor de música
start /wait ..\..\tools\sjasm\sjasm.exe src\screen1\1.asm
start /wait ..\..\tools\sjasm\sjasm.exe src\screen1\1sc5.asm
move /Y 1.bin .\src\screen1
move /Y 1sc5.bin .\src\screen1

rem /*******borrando comentarios*******/
type src\main-dev.bas | find /V  "1'"  > src\main.bas


rem /************Diskmanager******************/
rem Añadiendo archivos al .dsk, tenemos que crear antes el archivo disco.dsk con el programa disk manager
rem para ver los comandos abrir archivo DISKMGR.chm
rem If exist .\bin\main.dsk del .\bin\main.dsk
if not exist  .\bin\main.dsk copy ..\..\tools\Disk-Manager\disco.dsk .\bin\main.dsk
rem Le añadimos los archivos al dsk
rem 1. AUTOEXEC.BAS es un archivo basic con el comando bload que hará que se autoejecute el main.bas
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/AUTOEXEC.BAS 
rem 2. main.bas contiene mi código fuente
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/main.bas
rem 3. le metemos el archivo binario con la pantalla de carga
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1.bin
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1.bas
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1.sc2
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1sc5.bin
start /wait ..\..\tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1.sc5

rem /***********Abriendo el emulador***********/
rem Abriendo con openmsx, presiona f9 al arrancar para que vaya rápido
start /wait ..\..\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska bin\main.dsk
rem Abriendo con FMSX https://fms.komkon.org/fMSX/fMSX.html
rem start /wait emulators/fMSX/fMSX.exe -diska main.dsk


