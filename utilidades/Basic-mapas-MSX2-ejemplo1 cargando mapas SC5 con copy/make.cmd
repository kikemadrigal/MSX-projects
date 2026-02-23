rem este programa necesita las dependencias de:
rem java para ejecutar de deletecomments.jar
rem python 3 para ejecutar mkcas.py


rem Varibles de configuración
set TARGET_CAS=juego.cas
set TARGET_WAV=juego.wav
set TARGET_DSK=juego.dsk
set TARGET_ROM=juego.rom

rem con esta línea le estamos diciendo que tiene que empezar por la función main
@echo off&cls&call:main %1&goto:EOF

:main
    echo MSX Murcia 2020
    rem Ckequeando parámetros
    if [%1]==[] (call :create_all)
    if [%1]==[dsk] (call :create_dsk)
    if [%1]==[rom] (call :create_rom)
    if [%1]==[cas] (call :create_cas)
    if [%1]==[clean] (call :clean_objets)
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
    call :preparar_archivos_fuente
    call :convertir_imagenes
    call :crear_dsk
    call :crear_rom
    call :crear_cas
    call :crear_wav
    call :abrir_emulador_con_dsk
goto:eof

:create_dsk
    echo Escogiste crear dsk
    call :preparar_archivos_fuente
    call :convertir_imagenes
    call :crear_dsk
    call :abrir_emulador_con_dsk
goto:eof


:create_rom
    echo Escogiste crear rom
    call :preparar_archivos_fuente
    call :convertir_imagenes
    call :crear_dsk
    call :crear_rom
    call :abrir_emulador_con_rom
goto:eof



:create_cas
    echo Escogiste crear cas
    call :preparar_archivos_fuente
    call :convertir_imagenes
    call :crear_cas
    call :crear_wav
    call :abrir_emulador_con_wav
goto:eof

:clean_objets
    echo escogiste borrar objetos
    del /F /Q obj\*.*
goto:eof

:help
     echo No reconozco la sintaxis, pon:
     echo .
     echo make [dsk] [rom] [cas] [clean]
goto:eof

















rem ----------------------------------------------------------------------------
rem Esta función prepará los archivos fuente pata incluirlos en un dsk, cas 

:preparar_archivos_fuente

    rem creamos la carpeta obects si no existe, si existe borramos su contenido
    If not exist .\obj (md .\obj) else (call :clean_objets)

    rem Copiamos todos los archivos.bas de la carpeta de fuentes/game
    rem los pegamos en obj y mostramos un mensajito
    for /R src\game %%w in (*.bas) do (
        copy "%%w" obj  )

    rem unimos los temprales a unico archivo llamado game.bas
    for /R obj %%a in (*.bas) do (
         type "%%a" >> obj\gametemp.bas)  
    echo gametemp.bas creado.

    rem borramos los temporales menos gametemp.bas
    for /R obj  %%a in (*.bas) do (
        if "%%~nxa" NEQ "gametemp.bas" (del /F /Q "%%a") )  

    rem Le quitamos los comentarios a gametemp.bas y creamos el game.bas
    java -jar tools/deletecomments/deletecomments.jar obj/gametemp.bas
    rem otra forma de quita los comentarios es así (escribe type /? y find /? paa más ayuda)
    rem pero esta forma no quita los saltos de línea y necesitas ponerle en al fina de cada archivo un 1':
    rem type obj\gametemp.bas | find /V  "1 '"  > obj\game.bas

    rem borramos el gametemp.bas
    del /F /Q obj\gametemp.bas
    echo .

    rem copiamos el autoexec del juego para que se inicie solo el juego
    copy src\autoexec.bas obj

    rem copiamos el cargador del juego
    copy src\loader.bas obj
goto:eof









:convertir_imagenes
 rem ir a: http://msx.jannone.org/conv/
goto:eof





rem -----------------------------------------------------------------------------
rem Creará un nuevo archivo .dsk con los archivos .bin y .bas especificados
:crear_dsk
    rem Crear nuevo dsk
    rem como diskmanager no puede crear dsk vacíos desde el cmd copiamos y pegamos uno vacío
    if exist %TARGET_DSK% del /f /Q %TARGET_DSK%
    copy tools\Disk-Manager\main.dsk .\%TARGET_DSK%
    rem añadimos todos los .bas de la carpeta objects al disco
    rem por favor mirar for /?
    for /R obj/ %%a in (*.bas) do (
        start /wait tools/Disk-Manager/DISKMGR.exe -A -F -C %TARGET_DSK% "%%a")   

    rem añadimos todos los arhivos binarios de la carpeta bin al disco
    rem recuerda que un sc2, sc5, sc8 es también un archivo binario, renombralo
    rem por favor mirar for /?
    for /R bin/ %%a in (*.bin) do (
        start /wait tools/Disk-Manager/DISKMGR.exe -A -F -C %TARGET_DSK% "%%a")   
goto:eof



:crear_rom
    rem esto generará una rom de 32kb
    start /wait tools\dsk2rom\dsk2rom.exe -c 2 -f %TARGET_DSK% %TARGET_ROM% 
goto:eof



:crear_cas
    rem set TYPE=$1
    rem set TAPENAME=$2
    rem set PATHFILE=$3
    rem start /wait tools\mkcas\mkcas.py %TAPENAME% %TYPE% %PATHFILE%
    rem por favor, visita https://github.com/reidrac/mkcas
    if exist %TARGET_CAS% del /f /Q %TARGET_CAS%
    rem start /wait tools\mkcas\mkcas.py %TARGET_CAS% ascii obj\game.bas
    start /wait tools\mkcas\mkcas.py %TARGET_CAS% --add --addr 0x8000 --exec 0x8000  ascii obj\game.bas
    start /wait tools\mkcas\mkcas.py %TARGET_CAS% --add --addr 0x9000 --exec 0x9000  binary bin\sc5-01.bin
goto:eof

:crear_wav:
    start /wait tools\mcp\mcp.exe -e %TARGET_CAS% %TARGET_WAV%
goto:eof














rem ----------------------------------------------------------------
rem Abrir Emulador
rem BlueMSX: http://www.msxblue.com/manual/commandlineargs_c.htm
rem openMSX poner "tools\emulators\openmsx\openmsx.exe -h" en el cmd
rem FMSX: FMSX https://fms.komkon.org/fMSX/fMSX.html
rem para utilizar dir as disk tendrás que crear un directorio dsk/
:abrir_emulador_con_dir_as_disk
    copy main.dsk tools\emulators\BlueMSX
    start /wait tools/emulators/BlueMSX/blueMSX.exe -diska obj/
    rem start /wait emulators/fMSX/fMSX.exe -diska dsk/
    rem start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -diska dsk/
goto:eof

:abrir_emulador_con_dsk
    rem copy %TARGET_DSK% tools\emulators\BlueMSX
    rem start /wait tools/emulators/BlueMSX/blueMSX.exe -diskA %TARGET_DSK%
    rem start /wait tools/emulators/fMSX/fMSX.exe -diska %TARGET_DSK%
    start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -diska %TARGET_DSK%
goto:eof
:abrir_emulador_con_cas
    rem copy %TARGET_CAS% tools\emulators\BlueMSX
    rem start /wait tools/emulators/BlueMSX/blueMSX.exe -cas %TARGET_CAS%
    rem start /wait tools/emulators/fMSX/fMSX.exe -cas %TARGET_CAS%
    start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -cassetteplayer %TARGET_CAS%
goto:eof
:abrir_emulador_con_wav
    rem start /wait tools/emulators/fMSX/fMSX.exe -cas %TARGET_WAV%
    start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -cassetteplayer %TARGET_WAV%
goto:eof
:abrir_emulador_con_rom   
    copy %TARGET_ROM% tools\emulators\BlueMSX
    start /wait tools/emulators/BlueMSX/blueMSX.exe -rom1 %TARGET_ROM%
    rem start /wait tools/emulators/fMSX/fMSX.exe -cas %TARGET_ROM%
    rem start /wait tools/emulators/openmsx/openmsx.exe -machine Philips_NMS_8255 -carta %TARGET_ROM%
goto:eof





:error
    echo "ha habido un error"
goto:eof