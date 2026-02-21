@echo off
set TARGET_DSK=disco.dsk

rem con esta línea le estamos diciendo que tiene que empezar por la función main
@echo off&cls&call:main %1&goto:EOF



:main
    echo MSX Murcia 2020
    rem Ckequeando parámetros
    if [%1]==[] (call :create_all)
    if [%1]==[dsk] (call :help)
    rem si el argumento no está vacío, ni es dsk, ni es cas, etc
    if [%1] NEQ [] (
        if [%1] NEQ [rom] (
            if [%1] NEQ [dsk] (
                if [%1] NEQ [cas] ( 
                    if [%1] NEQ [clean] (call :help) 
                )
            )
        )
    )    
goto:eof

:create_all
    rem  if not exist tools/sjasm42c/sjasm.exe goto sjasm_no_exist
    rem if exist tools/sjasm42c/sjasm.exe call :create_bin
    rem call :copy_bins
    call :copy_to_obj
    if not exist tools/deletecomments1.4/deletecomments1.4.jar goto delete_comments_no_exist
    if exist tools/deletecomments/deletecomments1.4.jar call :delete_comments
    if not exist tools/Disk-Manager-v0.17/DISKMGR.exe goto disk_manager_no_exist
    if exist tools/Disk-Manager-v0.17/DISKMGR.exe call :create_dsk
    if not exist tools/emulators/ goto emulator_no_exist
    if exist tools/emulators/ call :open_emulator
goto:eof




:create_bin
    rem sjasm (http://www.xl2s.tk/) es un compilador de ensamblador z80 que puedo convertir tu código ensamblador en los archivos binarios.rom y .bin
    rem necesitamos el .bin de la pantalla de carga y del reproductor de música
    start /wait tools/sjasm42c/sjasm.exe src/music.asm
goto:eof

:copy_bins
    move /y music.bin .\bin
    rem move /y src\music.lst .\bin
goto:eof

:copy_to_obj
    rem Copiando todos los archivos.bas de la carpeta src
    rem los pegamos en objects y mostramos un mensajito
    for /R src %%a in (*.bas) do (
        copy "%%a" obj)
    rem Copiando todos los archivos.bin de la carpeta bin
    rem los pegamos en objects y mostramos un mensajito
    for /R bin %%a in (*.*) do (
        copy "%%a" obj)
goto:eof


:delete_comments
    rem Le quitcd..amos los comentarios a game.bas
    java -jar tools/deletecomments1.4/deletecomments1.4.jar src/main.bas obj/game.bas  
goto:eof

:tokenized
    rem Lo tokenizamos
    rem start /wait tools/tokenizer/msxbatoken.py obj/game.asc obj/game.bas 
goto:eof

:create_dsk
    if exist %TARGET_DSK% del /f /Q %TARGET_DSK%
    copy tools\Disk-Manager-v0.17\disco.dsk .\%TARGET_DSK%
    rem añadimos todos los .bas de la carpeta obj al disco
    rem por favor mirar for /?
    for /R obj/ %%a in (*.bas) do (
        start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% "%%a")  
    rem start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% obj/autoexec.bas  
    rem start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% obj/main.bas  
    rem start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% obj/main2.bas 
    rem start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% bin/dibujo.sc5  
    rem start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C %TARGET_DSK% obj/music.bin  
goto:eof

:open_emulator
    rem abrimos nuestro emulador preferido
    rem copy %TARGET_DSK% tools\emulators\BlueMSX
    rem start /wait tools/emulators/BlueMSX/blueMSX.exe -diska %TARGET_DSK%
    rem start /wait emulators/fMSX/fMSX.exe -diska %TARGET_DSK%


    rem MSX 1
    rem start /wait tools/emulators/openmsx-16.0/openmsx.exe  -ext Sony_HBD-50 -ext ram32k -diska %TARGET_DSK% 
    rem start /wait tools/emulators/openmsx-16.0/openmsx.exe -script tools/emulators/openmsx-16.0/emul_start_config.txt
    rem MSX2
    start /wait tools/emulators/openmsx-16.0/openmsx.exe -machine Philips_NMS_8255 -diska ./obj
    rem MSX2+
    rem start /wait tools/emulators/openmsx-16.0/openmsx.exe -machine Sony_HB-F1XV -diska %TARGET_DSK%
goto:eof



:sjasm_no_exist
echo "sjasm no existe: visite http://www.xl2s.tk/"
goto end
:delete_comments_no_exist
echo "No existe deletecommits, visite msx.tipolisto/files"
goto end
:disk_manager_no_exist
echo "No existe disk-manager, visite http://www.lexlechz.at/en/software.html"
goto end
:emulator_no_exist
echo "No hay emuladores"
goto end


:help
    echo "Navidad 2020 MSX Murcia"
:end


