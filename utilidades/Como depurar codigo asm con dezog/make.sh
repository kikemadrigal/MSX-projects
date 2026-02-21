#!/bin/bash


# <<<<<<<  MAC >>>>>>>>
# glass compiler: http://www.grauw.nl/projects/glass/
#java -jar  tools/glass/glass-0.5.jar src/main.asm main.bin main.lst
# ./tools/sjasmplus/sjasmplus --raw=main.com --sym=main.sym --lst=main.lst src/main.asm 
#sjasmplus: https://github.com/z00m128/sjasmplus
# ./tools/sjasmplus/mac/sjasmplus --raw=main.bin  --sym=main.sym --lst=main.lst src/main.asm 
# mv main.com obj
# mv main.bin obj
# mv main.lst obj
# mv main.sym obj
#./tools/emulators/openmsx/mac/openMSX.app/Contents/MacOS/openmsx -script ./tools/emulators/openmsx/emul_start_config.txt


# <<<<<<<  Linux >>>>>>>>
./tools/sjasmplus/linux/sjasmplus --raw=main.bin  --sym=main.sym --lst=main.lst src/main.asm 
mv main.com obj
mv main.bin obj
mv main.lst obj
mv main.sym obj
openmsx -script ./tools/emulators/openmsx/emul_start_config.txt