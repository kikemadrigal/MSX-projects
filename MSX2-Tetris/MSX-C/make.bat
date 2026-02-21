
@echo off
echo -------- Compilation of : 
echo %1
echo .


SET ASM=sdasz80 
SET CC=sdcc 
SET DEST=dsk\


SET INCLUDEDIR=fusion-c\include\
SET LIBDIR=fusion-c\lib\

SET proga=tetris

rem start /wait sjasm assets\sprites.asm
rem rem start /wait sjasm assets/sprcol.asm
rem move /y sprites.bin .\dsk
rem move /y sprcol.bin .\dsk

SET INC1=%INCLUDEDIR%crt0_msxdos.rel
REM SET INC2=%INCLUDEDIR%
REM SET INC3=%INCLUDEDIR%
REM SET INC4=%INCLUDEDIR%
REM SET INC5=%INCLUDEDIR%
REM SET INC6=%INCLUDEDIR%
REM SET INC7=%INCLUDEDIR%
REM SET INC8=%INCLUDEDIR%
REM SET INC9=%INCLUDEDIR%
REM SET INCA=%INCLUDEDIR%
REM SET INCB=%INCLUDEDIR%
REM SET INCC=%INCLUDEDIR%
REM SET INCD=%INCLUDEDIR%
REM SET INCE=%INCLUDEDIR%
REM SET INCF=%INCLUDEDIR%

SET ADDR_CODE=0x106
SET ADDR_DATA=0x0



SDCC --code-loc %ADDR_CODE% --data-loc %ADDR_DATA% --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -L %LIBDIR% %INC1% %INC2% %INC3% %INC4% %INC5% %INC6% %INC7% %INC8% %INC9% %INCA% %INCB% %INCC% %INCD% %INCE% %INCF% %proga%.c



SET cpath=%~dp0


IF NOT EXIST %proga%.ihx GOTO _end_
echo ... Compilation OK
@echo on

..\..\tools\Hex2bin\hex2bin -e com %proga%.ihx

@echo off

copy %proga%.com DSK\%proga%.com /y

del %proga%.com
del %proga%.asm
del %proga%.ihx
del %proga%.lk
del %proga%.lst
del %proga%.map
del %proga%.noi
del %proga%.sym
del %proga%.rel

echo Done.










rem :preparar_mapas_de_tiles
rem java -jar Tools\MSXTools\MSXTools.jar -m=a -o=assets\level0.tmx
rem java -jar Tools\MSXTools\MSXTools.jar -m=a -o=assets\level1.tmx
rem java -jar Tools\MSXTools\MSXTools.jar -m=a -o=assets\level2.tmx
rem start /wait Tools\sjasm42c\sjasm.exe assets\level0.asm
rem start /wait Tools\sjasm42c\sjasm.exe assets\level1.asm
rem start /wait Tools\sjasm42c\sjasm.exe assets\level2.asm
rem move /y level0.bin dsk
rem move /y level1.bin dsk
rem move /y level2.bin dsk
rem if exist assets\level0.asm del /f /Q assets\level0.asm
rem if exist assets\level1.asm del /f /Q assets\level1.asm
rem if exist assets\level2.asm del /f /Q assets\level2.asm
rem if exist assets\level0.lst del /f /Q assets\level0.lst
rem if exist assets\level1.lst del /f /Q assets\level1.lst
rem if exist assets\level2.lst del /f /Q assets\level2.lst





rem rem :preparar_imagenes
rem java -jar Tools\MSXTools\MSXTools.jar -m=t -o=assets\tileset.png 
rem move /y assets\tileset.sc5 dsk






rem :preparar_sprites
rem java -jar MSXTools.jar -m=c -o=sprites.spr 
rem start /wait Tools\sjasm42c\sjasm.exe assets\sprites.asm
rem start /wait Tools\sjasm42c\sjasm.exe assets\sprcol.asm
rem move /y assets\sprites.asm dsk
rem move /y assets\sprcol.asm dsk



rem preparar_efectos:
rem copy /y assets\effects.fx dsk


rem preparar_musica:
rem copy /y assets\song1.pt3 dsk
rem goto:eof



rem rem :crear_dsk
rem if exist MSX2-C.dsk del /f /Q MSX2-C.dsk
rem copy Tools\Disk-Manager-v0.17\main.dsk .\MSX2-C.dsk
rem rem añadimos todos los archivos de la carpeta al disco
rem rem por favor mirar for /?
rem for /R dsk/ %%a in (*.*) do (
rem     start /wait Tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C MSX2-C.dsk "%%a")   
rem move /y MSX2-C.dsk .\..\..\docs









:Emulator
start ..\..\tools\emulators\openmsx\openmsx.exe -script ..\..\tools\emulators\openmsx\emul_start_config.txt




rem rem crear_dsk
rem if exist MSX2-C.dsk del /f /Q MSX2-C.dsk
rem copy tools\Disk-Manager-v0.17\main.dsk .\MSX2-C.dsk
rem rem añadimos todos los .bas de la carpeta  al disco
rem rem por favor mirar for /?
rem for /R dsk/ %%a in (*.*) do (
rem     start /wait tools/Disk-Manager-v0.17/DISKMGR.exe -A -F -C MSX2-C.dsk "%%a")   
rem  move /y MSX2-C.dsk .\..\..\docs



:_end_