
set APP=tetris
echo Creando el programa con docker windows en command pront
rem  1. En el formato (en vscode abajo a la derecha) cambia CRLF(windows) por LF(linux)
rem  2 Se crea la imagen modificada con un nombre
rem  docker build -t nombre_contenedor:etiqueta(para indicar el nombre del contenedor)  directorio_donde_esta_dockerfile(en el que se sule poner un punto)
rem  docker build -t sdcc-image .
rem  3 En run cambia la ruta de la carpeta a compartir /c/Users/casa/Desktop/tetris-MSX-C-python/MSX-C por ejemplo
rem  4 Se crea y arranca con docker run --rm(lo borra si existía previamente) --name nombre_contenedor(que lo hemos puesto con docker build):etiqueta -v directorio_donde_esta_dockerfile(en el que se sule poner un punto) image_base
rem  docker run --rm --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image
rem  interactuar: docker run --rm -it --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image
if exist src\tetris.com del /f /Q src\tetris.com
if exist dsk\tetris.com del /f /Q dsk\tetris.com

docker run --rm -it --name sdcc -v /c/Users/casa/Desktop/sdcc-docker-test/src:/usr/src/sdcc_test sdcc-image
move src\%APP%.com dsk
.\src\tools\emulators\openmsx\openmsx.exe -machine Philips_NMS_8255 -diska dsk