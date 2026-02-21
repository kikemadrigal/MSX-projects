@echo off

set TARGET_DSK=disco.dsk
set TARGET_DIR_AS_DISK=dsk

rem Con esta línea le estamos diciendo que tiene que empezar por la función main
rem With this line we are telling you that you have to start with the main function
@echo off&cls&call:main %1&goto:EOF


:main
    echo MSX Spain 2024
    rem Ckequeando parámetros
    if [%1]==[] (call :create)
    if [%1]==[all] (call :not_implemented)
    if [%1]==[dsk] (call :create_dsk)
    if [%1]==[rom] (call :not_implemented)
    if [%1]==[cas] (call :not_implemented)
    if [%1]==[clean] (call :clean_objets)
    rem Si el argumento no está vacío, ni es dsk, ni es cas, etc
    rem If the argument is not empty, neither is it dsk, nor is it cas, etc.
    if [%1] NEQ [] (
        if [%1] NEQ [all] (
            if [%1] NEQ [rom] (
                if [%1] NEQ [dsk] (
                    if [%1] NEQ [cas] ( 
                        if [%1] NEQ [clean] (call :help) 
                    )
                )
            )
        }
    )    
goto:eof

:not_implemented
    echo "Not implemented yet"
goto:eof


:create
    echo Escogiste crear dir as disk
    call :preparar_archivos_fuente
    rem call :convertir_imagenes
    rem call :crear_dir_as_disk
    call :abrir_emulador_con_dir_as_disk
goto:eof

:create_dsk
    echo Escogiste crear dsk
    call :preparar_archivos_fuente
    rem call :convertir_imagenes
    call :crear_dsk
    call :abrir_emulador_con_dsk
goto:eof

:clean_objets
    echo escogiste borrar objetos
    if exist obj del /F /Q obj\*.*
    if exist dsk del /F /Q dsk\*.*
goto:eof

:preparar_archivos_fuente
    if not exist dsk mkdir dsk
    rem añadimos el xbasic
    copy ..\..\tools\xbasic\XBASIC.BIN dsk

    rem Copiamos los cargadores
    copy src\autoexec.bas dsk
    copy src\loader.bas dsk

    rem Le quitamos los comentarios a main.bas
    if not exist ..\..\tools\MSXTools\MSXTools.jar GOTO :not_exist_deletecomments
    java -jar ..\..\tools\MSXTools\MSXTools.jar -m=-m=delete-comments -o=src\main.bas 
    move src\main-del.bas dsk\game.bas

    rem añadimos todos los arhivos binarios de la carpeta bin al disco
    rem recuerda que un sc2, sc5, sc8 es también un archivo binario, renombralo
    rem por favor mirar for /?
    for /R bin/ %%a in (*.bin) do (
         copy "%%a" dsk)
goto:eof

:crear_dsk
    rem comprobamos que existe el disk manager
    if not exist ..\..\tools\Disk-Manager-v0.17 GOTO :not_exist_disk_manager
    rem Crear nuevo dsk
    rem como diskmanager no puede crear dsk vacíos desde el cmd copiamos y pegamos uno vacío
    if exist game.dsk del /f /Q game.dsk
    copy ..\..\tools\Disk-Manager-v0.17\game.dsk .\
    rem añadimos todos los .bas de la carpeta obj al disco
    rem por favor mirar for /?
    for /R dsk/ %%a in (*.*) do (
        start /wait ..\..\tools\Disk-Manager-v0.17\DISKMGR.exe -A -F -C game.dsk "%%a")    
goto:eof


:abrir_emulador_con_dir_as_disk
rem abrimos nuestro emulador preferido
rem copy %TARGET_DSK% tools\emulators\BlueMSX
rem start /wait tools/emulators/BlueMSX/blueMSX.exe -diska %TARGET_DSK%
rem start /wait emulators/fMSX/fMSX.exe -diska %TARGET_DSK%


rem MSX 1
rem start /wait tools/emulators/openmsx/openmsx.exe -machine Sony_HB-55P -ext Sony_HBD-50 -diska %TARGET_DSK%
rem MSX2
start /wait ..\..\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska %TARGET_DIR_AS_DISK%
rem MSX2+
rem start /wait tools/emulators/openmsx/openmsx.exe -machine Sony_HB-F1XV -diska %TARGET_DSK%
goto:eof


:abrir_emulador_con_dsk
    rem copy %TARGET_DSK% tools\emulators\BlueMSX
    rem start /wait tools/emulators/BlueMSX/blueMSX.exe -diskA %TARGET_DSK%
    rem start /wait tools/emulators/fMSX/fMSX.exe -diska %TARGET_DSK%
    start /wait ..\..\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska game.dsk
    rem start tools\emulators\openmsx-16.0\openmsx.exe -script tools\emulators\openmsx-16.0\emul_start_config.txt
goto:eof







:not_exist_deletecomments
    echo "Not exit deletecomments"
goto :end
:not_exist_disk_manager
    echo "Not exit diskmanager"
goto :end
:not_exist_tokenizer
    echo "Not exit tokenizer"
goto :end
:not_exist_emulators
    echo "Not exit emulators"
goto :end
:not_exist_bluemsx
goto :end
:not_exist_openmsx
goto :end

:error
    echo "ha habido un error"
goto:eof

:end