
@echo off
echo -------- Compilation of : 
echo %1
echo .


SET ASM=sdasz80 
SET CC=sdcc 
SET DEST=dsk\


SET INCLUDEDIR=fusion-c\include\
SET LIBDIR=fusion-c\lib\

SET program=watchmen


rem cogemos los tmx generados con el programa tiled y los pasamos a asm
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level0.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level1.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level2.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level3.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level4.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level5.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level6.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level7.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level8.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level9.tmx 
rem java -jar tools\MSXTools\MSXTools.jar -m=a -o=assets\level10.tmx 



rem move /y assets\level0.asm .\asm  
rem move /y assets\level1.asm .\asm  
rem move /y assets\level2.asm .\asm  
rem move /y assets\level3.asm .\asm  
rem move /y assets\level4.asm .\asm  
rem move /y assets\level5.asm .\asm  
rem move /y assets\level6.asm .\asm  
rem move /y assets\level7.asm .\asm  
rem move /y assets\level8.asm .\asm  
rem move /y assets\level9.asm .\asm  
rem move /y assets\level10.asm .\asm  


rem sjasm (http://www.xl2s.tk/) es un compilador de ensamblador z80 que puedo convertir tu código ensamblador en los archivos binarios.rom y .bin
rem necesitamos el .bin de la pantalla de carga y del reproductor de música


rem java -jar tools\MSXTools\MSXTools.jar -m=c -o=assets\sprites.spr
rem start /wait sjasm sprites.asm
rem call tools\trim\trim.bat sprites.bin 50
rem rem start /wait sjasm asm/sprcol.asm

rem start /wait sjasm asm/level0.asm
rem start /wait sjasm asm/level1.asm
rem start /wait sjasm asm/level2.asm
rem start /wait sjasm asm/level3.asm
rem start /wait sjasm asm/level4.asm
rem start /wait sjasm asm/level5.asm
rem start /wait sjasm asm/level6.asm
rem start /wait sjasm asm/level7.asm
rem start /wait sjasm asm/level8.asm
rem start /wait sjasm asm/level9.asm
rem start /wait sjasm asm/level10.asm

rem start /wait sjasm asm/e-coord.asm
rem start /wait sjasm asm/g-coord.asm
rem start /wait sjasm asm/o-coord.asm

rem move /y sprites.bin .\dsk
rem move /y sprcol.bin .\dsk

rem move /y level0.bin .\dsk
rem move /y level1.bin .\dsk
rem move /y level2.bin .\dsk
rem move /y level3.bin .\dsk
rem move /y level4.bin .\dsk
rem move /y level5.bin .\dsk
rem move /y level6.bin .\dsk
rem move /y level7.bin .\dsk
rem move /y level8.bin .\dsk
rem move /y level9.bin .\dsk
rem move /y level10.bin .\dsk

rem move /y e-coord.bin .\dsk
rem move /y g-coord.bin .\dsk
rem move /y o-coord.bin .\dsk

SET INC1=%INCLUDEDIR%crt0_msxdos.rel
REM SET INC2=%INCLUDEDIR
REM SET INC3=%INCLUDEDIR
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



SDCC --code-loc %ADDR_CODE% --data-loc %ADDR_DATA% --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -L %LIBDIR% %INC1% %INC2% %INC3% %INC4% %INC5% %INC6% %INC7% %INC8% %INC9% %INCA% %INCB% %INCC% %INCD% %INCE% %INCF% %program%.c



SET cpath=%~dp0


IF NOT EXIST %program%.ihx GOTO _end_
echo ... Compilation OK
@echo on

..\..\..\tools\Hex2bin\hex2bin -e com %program%.ihx

@echo off

copy %program%.com DSK\%program%.com /y

del %program%.com
del %program%.asm
del %program%.ihx
del %program%.lk
del %program%.lst
del %program%.map
del %program%.noi
del %program%.sym
del %program%.rel

echo Done.

rem if exist %program% del /f /Q %program%
rem copy tools\Disk-Manager-v0.17\main.dsk .\disco.dsk

rem for /R dsk/ %%a in (*.*) do (
rem     start /wait tools\Disk-Manager\DISKMGR.exe -A -F -C disco.dsk "%%a")   






:Emulator
rem Set MyProcess=openmsx.exe
rem tasklist | find /i "%MyProcess%">nul  && (echo %MyProcess% Already running) || start tools\emulators\openMSX-16.0\openmsx.exe -script tools\emulators\openMSX-16.0\emul_start_config.txt





:Emulator
rem copy disco.dsk tools\BlueMSX
rem start /wait tools\emulators\BlueMSX\blueMSX.exe -diska %program%.dsk
rem Set MyProcess=openmsx.exe
rem tasklist | find /i "%MyProcess%">nul  && (echo %MyProcess% Already running) || start tools\openMSX-16.0\openmsx.exe -script tools\openMSX-16.0\emul_start_config.txt
start ..\..\..\tools\emulators\openmsx\openmsx.exe -script ..\..\..\tools\emulators\openmsx\emul_start_config.txt
:_end_