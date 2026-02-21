@echo off

@echo off&cls&call:main %1&goto:EOF

:main
    if [%1]==[] (call :create)
    if [%1]==[clean] (call :clean)

goto:eof

:create
    tools\sjasm\sjasm.exe src\main.s
    move main.bin dsk 
    del  /F /Q src\main.lst

    copy src\autoexec.bas dsk
    copy src\main.bas dsk

    tools\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska dsk
goto:eof


:clean
    echo escogiste borrar dsk
    del /F /Q dsk\*.*
goto:eof