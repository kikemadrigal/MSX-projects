#!/bin/bash

#macOS Error: /bin/bash: bad interpreter: Operation not permitted
#Debería ver uno de los atributos listados como com.apple.quarantine. Para eliminarlo del archivo, ejecute:
#Resulta que esto a menudo se debe a que los metadatos del sistema de archivos de 'cuarentena' (atributos extendidos) se configuran para el archivo, lo que impide que se ejecute.
#para ver los metadas
#xattr -l my-file.sh
#Para solucionar el problema:
#xattr -d com.apple.quarantine my-file.sh

#Para trabajar con MAC
#1 .Escribo sudo find / -name "z80.lib"
#    y me responde 
#    Mac-mini-de-kike:test kike$ sudo find / -name "z80.lib"
#    /usr/local/Cellar/sdcc/4.2.0/share/sdcc/lib/z80/z80.lib
#2 . CD /usr/local/Cellar/sdcc/4.2.0/share/sdcc/lib/z80
#sdar -d z80.lib vprintf.rel;
#sdar -d z80.lib getchar.rel; 
#sdar -d z80.lib putchar.rel; 
#sdar -d z80.lib sprintf.rel;
#sdar -d z80.lib printf.rel



APP="tetris"

#  echo Creando el programa para la depuración en WSL o gitbash
SDCC --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -Lfusion-c/lib/ fusion-c/include/crt0_msxdos.rel ${APP}.c
./tools/hex2bin/windows/hex2bin.exe -e com ${APP}.ihx
mv ${APP}.com dsk/
./tools/emulators/openMSX/openmsx.exe -machine Philips_NMS_8255  -diska dsk/ &









# echo Creando el programa para la depuración en linux en una carpeta
# sdcc --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -Lfusion-c/lib/ fusion-c/include/crt0_msxdos.rel ${APP}.c
# ./Tools/Hex2bin/linux/hex2bin -e com ${APP}.ihx
# mv ${APP}.com dsk/
# openmsx -machine Philips_NMS_8255 -diska dsk/ &


# echo Creando el programa para la depuración en linux en rom
# sdasz80 -o ./fusion-c/include/crt0msx_rom.rel ./fusion-c/source/crt0msx_rom.s
# sdcc -mz80 --debug --constseg DUMMY -c ${APP}.c -o ${APP}.rel
# sdcc -mz80 --debug --constseg DUMMY --no-std-crt0 --code-loc 0x4100 --data-loc 0xc000 --out-fmt-ihx -o ${APP}.ihx fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0msx_rom.rel ${APP}.rel 
# ./Tools/Hex2bin/linux/hex2bin -e rom -s 0x4000 -l 0x8000 ${APP}.ihx
# openmsx -machine Philips_NMS_8255 -carta ${APP}.rom




# echo Creando el programa para MAC
# problemas de compilación? https://www.msx.org/forum/msx-talk/development/fusion-c-and-sdcc-420
# sdcc --sdcccall 0 --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib  -L ./Fusion-c/lib/ ./fusion-c/include/crt0_msxdos.rel ${APP}.c
# ./Tools/Hex2bin/mac/hex2bin -e com ${APP}.ihx
# mv ${APP}.com dsk/
# /Applications/openMSX.app/Contents/MacOS/openMSX -machine Philips_NMS_8255 -script ./Tools/openMSX/emul_start_config.txt &







rm -rf *.ihx
rm -rf *.adb
rm -rf *.cdb
rm -rf *.rom
rm -rf *.asm
rm -rf *.lk
rm -rf *.lst
rm -rf *.map
rm -rf *.map
rm -rf *.noi
rm -rf *.rel   
rm -rf *.sym

# dos2unix capkirk.c 
# dos2unix ./fusion-c/source/crt0msx_rom.s
# sdcc -mz80 --debug --constseg DUMMY --no-std-crt0 --code-loc 0x106 --data-loc 0x0 --out-fmt-ihx -o main.ihx fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0_msxdos.rel main.rel
# sdcc --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size  fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0_msxdos.rel main.rel -o main.ihx
#SDCC --debug --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -L fusion-c/lib/ fusion-c/include/crt0_msxdos.rel capkirk.c -o capkirk.ihx
# sdcc -mz80 --no-std-crt0 --code-loc 0x4100 --data-loc 0xc000 --out-fmt-ihx -o capkirk.ihx fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0msx_rom.rel capkirk.rel
# ./tools/hex2bin/hex2bin.exe -e rom -s 0x4000 -l 0x8000 ${APP}.ihx
# unix2dos capkirk.com
#wine ./Tools/Hex2bin/hex2bin.exe -e bin capkirk.ihx
# wine ./tools/hex2bin/hex2bin.exe -e rom -s 0x4000 -l 0x8000 capkirkihx
# mv capkirk.bin dsk/ 
#/Applications/openMSX.app/Contents/MacOS/openMSX -script ./Tools/openMSX/emul_start_config.txt
#/Applications/openMSX.app/Contents/MacOS/openMSX -machine Philips_NMS_8255  -carta capkirk.rom &
#./tools/hex2bin/hex2bin.exe -e rom ${APP}.ihx
#gcc -g fusion-c/lib/fusion.lib -I. ${APP}.c -o ${APP}
# ./tools/openMSX/openmsx.exe -carta ${APP}.rom -machine Philips_NMS_8255 &
#ddd& --trace --debugger ./openmsxgdb.py ${APP} 2> ddd_openmsx.log