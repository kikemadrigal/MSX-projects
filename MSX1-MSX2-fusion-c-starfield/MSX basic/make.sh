# Convertimos los archivos de tipo Unix a tipo Dos de este directorio con el comando dos2unix
# ¿Lo has instalado con sudo apt install dos2unix ?
for file in *.bas; do
    unix2dos "$file"
    echo "Archivo $file convertido a formato Linux"
done


openmsx -machine Philips_NMS_8255 -diska .