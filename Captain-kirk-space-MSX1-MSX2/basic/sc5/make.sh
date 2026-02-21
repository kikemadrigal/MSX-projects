#!/bin/bash

# Copiando todos los archivos.bas de la carpeta src
# los pegamos en objects y mostramos un mensajito
for file in src/*.bas; do
    cp "$file" obj/
    echo "Archivo $file copiado a objects/"
done

# Le quitamos los comentarios a game.bas
sed -i "/^\s*1 \'/d" objects/main.bas
echo "Comentarios eliminados de main.bas"

# Convertimos los archivos de tipo Unix a tipo Dos con el comando dos2unix
# ¿Lo has instalado con sudo apt install dos2unix ?
for file in obj/*.bas; do
    unix2dos "$file"
    echo "Archivo $file convertido a formato Linux"
done

# si no existe creamos el directorio disk
if [ ! -d "disk" ]; then
    mkdir disk
    echo "Directorio disk creado"
fi
# añadimos todos los .bas de la carpeta obj al disco
for file in obj/*.bas; do
    cp "$file" disk/
    echo "Archivo $file copiado a disk/"
done

# Añadimos todos los archivos de la carpeta bin al disco
for file in bin/*; do
    cp "$file" disk/
    echo "Archivo $file copiado a disk/"
done

# Abrimos el emulador con el disco
echo "Abriendo el emulador con el disco..."
openmsx -machine Philips_NMS_8255 -diska disk/


# Borramos los archivos de obj
rm obj/*.*
echo "Archivos .bas eliminados de objects/"
# borramos los archivos de la carpta disk
rm disk/*.*
echo "Archivos eliminados de disk/"