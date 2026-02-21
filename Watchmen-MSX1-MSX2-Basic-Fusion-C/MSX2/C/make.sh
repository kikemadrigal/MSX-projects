#!/bin/bash


CCFLAGS="--code-loc  0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size"

function compileLinux() {
   sdcc ${CCFLAGS} fusion.lib -L ./fusion-c/lib/  ./fusion-c/include/crt0_msxdos.rel watchmen.c	
   ./tools/hex2bin/hex2bin -e com watchmen.ihx
   mv watchmen.com dsk/
   openmsx.exe -machine Philips_NMS_8255  -diska dsk/ &

   
   #echo "Creando el programa para la depuración en linux"
   #sdasz80 -o ./fusion-c/include/crt0msx_rom.rel ./fusion-c/source/crt0msx_rom.s
   #sdcc -mz80 --debug --constseg DUMMY -c watchmen.c -o watchmen.rel
   #sdcc -mz80 --debug --constseg DUMMY --no-std-crt0 --code-loc 0x4100 --data-loc 0xc000 --out-fmt-ihx -o watchmen.ihx fusion.lib -L ./fusion-c/lib/ ./fusion-c/include/crt0msx_rom.rel watchmen.rel 
	#./tools/hex2bin/hex2bin -e rom -s 0x4000 -l 0x8000 watchmen.ihx
   #gcc -g fusion-c/lib/fusion.lib -I. watchmen.c -o watchmen
   #openmsx -carta watchmen.rom -machine Philips_NMS_8255 &
	#ddd& --trace --debugger ./openmsxgdb.py watchmen 2> ddd_openmsx.log
  
   echo "hecho"
}

function compileWindowsWithBash() {
   sdcc ${CCFLAGS} fusion.lib -L ./fusion-c/lib/  ./fusion-c/include/crt0_msxdos.rel watchmen.c	
   ./tools/hex2bin/hex2bin.exe -e com watchmen.ihx
   mv watchmen.com dsk/
   ./tools/emulators/openMSX-16.0/openmsx.exe -machine Philips_NMS_8255  -diska dsk/ 
   cleanObjects
}

#--------------------------------------------------------------------------
# Removes all generated compilation objects
# except CDT and DSK generated
#
function cleanObjects() {
    # REMOVE OBJECTS
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

   rm -rf ddd_openmsx.log
}



## Check parameter number
if (( $# != 1 )); then
   clear
   #compileLinux
   compileWindowsWithBash
fi

## Check parameter
PARAM=${1^^}   ## Uppercase
case "$PARAM" in
   "CLEAN")
      cleanObjects
   ;;
esac