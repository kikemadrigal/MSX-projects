# Makefile para ser ejecutado con gitbash sobre windows
APP:=tetris
# TEXT:=$(shell ls)


app: clean openmsx


openmsx:${APP}.com
	./tools/emulators/openMSX/openmsx.exe -machine Philips_NMS_8255  -diska dsk/ 

# $^=$(APP).ihx
# $@=$(APP).com
${APP}.com: ${APP}.ihx
	./tools/hex2bin/windows/hex2bin.exe -e com ./$^
	cp $@ dsk/
	# $(info ${TEXT})

${APP}.ihx: ${APP}.c
	SDCC --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -Lfusion-c/lib/ fusion-c/include/crt0_msxdos.rel $^

.PHONY:
clean:
	$(shell rm dsk/${APP}.com)
	$(shell rm ${APP}.com)
	$(shell rm ${APP}.asm)
	$(shell rm ${APP}.ihx)
	$(shell rm ${APP}.lk)
	$(shell rm ${APP}.lst)
	$(shell rm ${APP}.map)
	$(shell rm ${APP}.noi)
	$(shell rm ${APP}.sym)
	$(shell rm ${APP}.rel)