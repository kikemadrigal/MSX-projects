<<<<<<< HEAD
# Plantilla profesinal MSX Basic

## Crea la carpeta tools en el directorio raiz y copia estos programas dentro de la carpeta: 

http://msx.tipolisto.es/files/Allprograms.zip


<img src=assets\Platilla-profesional-basic.PNG width=500px/>
=======
# Plantilla professional basic

En este ejemplo se describe como crear un script para ejecutar tus juegos MSX desde un script bast o bash

https://kikemadrigal.github.io/MSX-basic-professional-template/index.html

# Uso

Escriba en la ventana de comandos:

make: para correr su emulador favorito utilizando la función DiskAsDir

make all: para correr su emulador y generar los archivos .dsk, .rom, .cas y .tsx

make dsk: para correr su emulador, utilizando un archivo dsk generado

make rom: para correr su emulador, utilizando un archivo rom generado

make cas: para correr su emulador, utilizando un archivo cas generado

make rsx: para correr su emulador, utilizando un archivo tsx generado


make clean

make clean all: borrar los archivos temporales y los archivos dsk, rom, cas y tsx


# Structure / scafolding

src: están los archivos fuente bas y asm

obj: irán los archivos generados por el compilador

bin: irán los binarios que tienen que ser copiados dentro del directrio de trabajo:

    Screens *.sc2,*.sc5,etc generados con msxviewer, nMSXTIles/MSXTilesdevtool, 

    audios *.pt3,*.wiz,*.mwm, *.mbm creados con vortes tracker, arckos tracker, wiz tracker, moundblaster, etc 

    compiladores xbasic.bin, nbasic.bin turbobasic, nextorbasic

assets: irán los archivos creados con programas que no tienen que ser copiados pero si pueden ser automatizados

    *.xspr son archivos creados con spritedevtools que serán convertidos a .bas o .bin

    *.tmx y *.csv archivos creados con tilemap que serán convertidos a .bin

    *.psd, creados con photoshop

    *.jpg y *.png capturas, fotos descargadas o retocadas

dsk: carpeta que es utilizada para trabajar como DiskAsDir

tools: van todos los programas que necesitemos, para descgar los programas necesarios vaya a la dirección: 

docs: irán los archivos de la documentación, también el index.html con el webMSX y el dsk de prueba
>>>>>>> refs/remotes/origin/main
