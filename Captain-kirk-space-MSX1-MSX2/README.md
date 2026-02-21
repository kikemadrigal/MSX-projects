# DESCRIPCION

Juego de naves espaciales o Shoot'em up (Dispara a todos) para la plataforma retro MSX (microordenador de los años 80), diviertete.

# MSX2

## C

### Juega online

https://kikemadrigal.github.io/?disk=capkirk.dsk

### Echa una partida multijugador

<!-- https://msx.tipolisto.es/webmsx/standalone/?disk=files/capkirk.dsk -->

Mira el manual de como crear o unirte a una partida multijugador: [NetPLay](docs/netplay.md)


### Sprite sheet

He uilizado el famoso gran programa de MSX Spain "MSX tools":

<img src=docs/sprite_sheet1.PNG width=500px/>
<img src=docs/sprite_sheet2.PNG width=500px/>
<img src=docs/sprite_sheet3.PNG width=500px/> 
<img src=docs/sprite_sheet4.PNG width=500px/>
<img src=docs/sprite_sheet5.PNG width=500px/>
<img src=docs/sprite_sheet6.PNG width=500px/>

### Tiled sheet

He utilizado photoshop y el programa imageViewer

<img src=docs/tileset.png width=400px/>


### Maps
 
#### Menu

<img src=docs/menu.PNG width=400px/>


#### Level 1 - planet SG-22N, Anukaki rebellion

<img src=docs/level1-intro.PNG width=400px/>
<img src=docs/level1-ingame.PNG width=400px/>

<img src=docs/level1.PNG width=800px/>


#### Level 2 - planet PK-286, fight for fuel

<img src=docs/level2-intro.PNG width=400px/>
<img src=docs/level2-ingame.PNG width=400px/>

<img src=docs/level2.PNG width=800px/>


#### Level 3 - iron planet, fight for the material

<img src=docs/level3-intro.PNG width=400px/>
<img src=docs/level3-ingame.PNG width=400px/>
    
<img src=docs/level3.PNG width=800px/>

#### Compilación

El resultado son una serie de archivos binarios y de texto que pueden dejarse dentro del directorio dsk o incluirlo dentro de un disco.dsk o cassette.cas o cartucho.rom
Este directorio puede ser abierto con la opción de [OpenMSX+OpenMSX catapult](https://openmsx.org/): DirAsDisk o de [blueMSX](http://bluemsx.msxblue.com/download.html): insertar directorio

**Para la compilación de código C** :  [SDCC](https://sdcc.sourceforge.net/)

**Librería C**: [FUSION-C](https://github.com/ericb59/Fusion-C-v1.2)


**Entorno de desarrollo/editor código**: [VScode](https://code.visualstudio.com/) + extensión C/C++ de Microsoft

**Creación del ejecutable / sistema de build**: script bat para Windows o script bash para Linux-mac


**Conversor de imágenes, tmx y sprites.spr**: [MSXTools](https://github.com/kikemadrigal/Java-desktop-MSXtools/releases/tag/v1.0.3)

**Creación de imágenes para tiles**: Photoshop+[añadir muestra mapa de 16 colores para microsoft](docs/agregar-muestra-photoshop.md)

**Conversor de imagénes a sc5**: [MSXTools.jar](https://github.com/kikemadrigal/Java-desktop-MSXtools/releases/tag/v1.0.3), comando java -jar MSXTools.jar -m=t -o=image.png o si es un bmp java -jar -m=s -o=image.bmp, otra opción es el programa [MSXViewer](http://marmsx.msxall.com/msxvw/msxvw5/download/index_es.php)

**Creación de mapas de tiles**: [Tiled](https://www.mapeditor.org/)

**Conversor de archivos.tsx generados por tiles a asm**: [MSXTools.jar](https://github.com/kikemadrigal/Java-desktop-MSXtools/releases/tag/v1.0.3), interface gráfica  o comando: java -jar MSXTools.jar -m=a -o=tilemap.tmx 

**Creación de sprites y generador de sprites.asm y color-sprites.asm**: interface gráfica [MSXTools](https://github.com/kikemadrigal/Java-desktop-MSXtools/releases/tag/v1.0.3)  o una vez creado el archivo Sprite.spr con el comando java -jar MSXTools.jar -m=c -o=sprites.spr

**Conversor de sprites.asm y Sprite-color.asm a sprites.bin y sprites-color.bin, es decir conversor de archivos asm a binarios o ensamblador**: [sjasm](https://www.xl2s.tk/)

**Efectos**: [AYFXedit](https://github.com/Threetwosevensixseven/ayfxedit-improved/releases/tag/v0.6) 

**Música**: [Vortex tracker 2](https://bulba.untergrund.net/vortex_e.htm)




# Basic


## Screen 2

### Juega

 https://kikemadrigal.github.io/MSX-basic-c-scroll-horizontal-MSX2-captain-kirk/?disk=game-basic-sc2.dsk


<img src=docs/basic-sc2.PNG width="500px" >


## Screen 5

### Juega




<img src=docs/basic-1.PNG width="500px" >





