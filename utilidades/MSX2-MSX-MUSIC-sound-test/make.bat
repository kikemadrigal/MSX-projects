@echo off&cls&call:main %1&goto:EOF

:main
    echo MSX Murcia 2026 - MSX Music Sound Test
    echo escribe make.bat pt3 o mml o mb o clean para crear el disco de cada prueba
    echo.
    rem Ckequeando parámetros
 
    if [%1]==[mml] (call :create_dsk_mml)
    if [%1]==[pt3] (call :create_dsk_pt3)
    if [%1]==[mb] (call :create_dsk_moonblaster)
    
    rem Si el argumento no está vacío, ni es dsk, ni es cas, etc
    rem If the argument is not empty, neither is it dsk, nor is it cas, etc.
 
    if [%1] NEQ [1] (
        if [%1] NEQ [2] (
            if [%1] NEQ [3] (
                if [%1] NEQ [clean] (call :help) 
            )
        )
    }
goto:eof

:help
    echo make.bat [mml] [pt3] [mb] [clean]
goto:eof



:create_dsk_moonblaster
    rem moonblaster tracker
    start ..\..\tools\emulators\openmsx\openmsx.exe -script ..\..\tools\emulators\openmsx\emul_start_config_moonblaster.txt
goto:eof


:create_dsk_pt3
    rem para desactivar los mensajes de los programas
    rem @echo off
    rem sjasm (http://www.xl2s.tk/) es un compilador de ensamblador z80 que puedo convertir tu código ensamblador en los archivos binarios.rom y .bin
    rem necesitamos el .bin de la pantalla de carga y del reproductor de música
    start /wait ..\..\tools\sjasm\sjasm.exe src-pt3/scloader.asm
    start /wait ..\..\tools\sjasm\sjasm.exe src-pt3/musicint.asm
    move /Y scloader.bin ./dsk-pt3
    move /Y music.bin ./dsk-pt3
    move /Y musicint.bin ./dsk-pt3
    rem del /F src-pt3/loader.lst
    rem del /F src-pt3/music.lst



    rem Copiando todos los archivos.bas de la carpeta src
    rem los pegamos en objects y mostramos un mensajito
    for /R src-pt3 %%a in (*.bas) do (
        copy "%%a" dsk-pt3 )
    rem Copiando todos los archivos.bin de la carpeta bin
    rem los pegamos en objects y mostramos un mensajito
    rem for /R bin %%a in (*.*) do (
    rem     copy "%%a" obj & echo %%a)


    rem /***********Abriendo el emulador***********/
    rem Abriendo con openmsx, presiona f9 al arrancar para que vaya rápido
    rem start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -diska bin/main.dsk
    start /wait ..\..\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska ./dsk-pt3
    rem Abriendo con FMSX https://fms.komkon.org/fMSX/fMSX.html
    rem start /wait emulators/fMSX/fMSX.exe -diska main.dsk
goto:eof




:create_dsk_mml
    rem copiamos el main.bas a dsk-mml
    copy src/main.bas dsk-mml
    start ..\..\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska dsk-mml
goto:eof