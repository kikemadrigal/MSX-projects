@echo off
set PROGRAMA=collect.bas

rem del /f /Q dsk
copy src\autoexec.bas dsk
copy src\%PROGRAMA% dsk

start ..\..\tools\emulators\openmsx\openmsx.exe -script ..\..\tools\emulators\openmsx\emul_start_config.txt