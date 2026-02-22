
rem para desactivar los mensajes de los programas
@echo off
rem sjasm (http://www.xl2s.tk/) es un compilador de ensamblador z80 que puedo convertir tu código ensamblador en los archivos binarios.rom y .bin
rem necesitamos el .bin de la pantalla de carga y del reproductor de música
start /wait tools/sjasm/sjasm.exe src/screen1/1.asm
rem start /wait tools/sjasm/sjasm.exe src/music.asm
move /Y scloader.bin ./src/screem1



rem /*******borrando comentarios*******/
rem para ejcutar este comando necesitas tener java jre instalado
rem start /wait java -jar tools/deletecomments/deletecomments.jar src/main-dev.bas
rem escribe type /? y find /? paa más ayuda
type src\main-dev.bas | find /V  "1'"  > obj\main.bas


rem /************Diskmanager******************/
rem Añadiendo archivos al .dsk, tenemos que crear antes el archivo disco.dsk con el programa disk manager
rem para ver los comandos abrir archivo DISKMGR.chm
rem AUTOEXEC.BAS es un archivo basic con el comando bload que hará que se autoejecute el main.bas
start /wait tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/AUTOEXEC.BAS 
rem main.bas contiene mi código fuente
start /wait tools/Disk-Manager/DISKMGR.exe -A -F -C bin/main.dsk src/screen1/1.bin



rem /***********Abriendo el emulador***********/
rem Abriendo con openmsx, presiona f9 al arrancar para que vaya rápido
start /wait emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -diska bin/main.dsk
rem Abriendo con FMSX https://fms.komkon.org/fMSX/fMSX.html
rem start /wait emulators/fMSX/fMSX.exe -diska main.dsk
rem copy bin\main.dsk emulators\blueMSX
rem start /wait emulators/BlueMSX/blueMSX.exe -diska main.dsk


