APP="tetris"

# 1. En el formato (en vscode abajo a la derecha) cambia CRLF(windows) por LF(linux)
# 2 Se crea la imagen modificada con un nombre
# docker build -t nombre_contenedor:etiqueta(para indicar el nombre del contenedor)  directorio_donde_esta_dockerfile(en el que se sule poner un punto)
# docker build -t sdcc-image .
# 3 En run cambia la ruta de la carpeta a compartir /c/Users/casa/Desktop/tetris-MSX-C-python/MSX-C por ejemplo
# 4 Se crea y arranca con docker run --rm(lo borra si existía previamente) --name nombre_contenedor(que lo hemos puesto con docker build):etiqueta -v directorio_donde_esta_dockerfile(en el que se sule poner un punto) image_base
# docker run --rm --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image
# interactuar: docker run --rm -it --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image

sdcc --code-loc 0x106 --data-loc 0x0 --disable-warning 196 -mz80 --no-std-crt0 --opt-code-size fusion.lib -Lfusion-c/lib/ fusion-c/include/crt0_msxdos.rel ${APP}.c
chmod +x ./tools/hex2bin/linux/hex2bin
./tools/hex2bin/linux/hex2bin -e com ${APP}.ihx