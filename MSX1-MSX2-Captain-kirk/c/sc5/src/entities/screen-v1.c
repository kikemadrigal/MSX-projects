#pragma once
#include "../../fusion-c/header/msx_fusion.h"
/**
 * Sprites: 
 * Players: del 0 al 5 
 * Fires: del 5 al 15
 * Enemies: del 15 al 25
 * Explosions: el 26
 * blackbox: del 28 al 32
 */

/**************DECLARACIONES************/
#ifndef __PANTALLA_H__
#define __PANTALLA_H__
//FUNCIONES
//Cargar archivos en memoria RAM y VRAM
void cargarTileSetEnRAM();
void cargarTileMapEnRAM();
void mostrarArray();
void row_paint(char row);
void set_level(char level);
//Esto es para asociar un archivo al struct de archivos
void FT_SetName( FCB *p_fcb, const char *p_name );

void recorrerBufferTileMapYPintarPage1EnPage0(char level);
void deRamAVramPage1(void);
void SetAdjust(signed char x, signed char y);
void poner_columna_negra(char* colorBuffer, char level);
char generar_numero_aleatorio (char a, char b);
void load_file_into_buffer(char *filename);
void copy_sprites_definition_to_VRAM();
void copy_color_sprite_to_VRAM();
char* create_sprite_color_buffer();
void man_game_cargar_buffer_efectos_sonido();



//VARIABLES Y ARRAYS
char fileNameTilseSet[]="tileset.sc5";
char *fileNameTileMap;


FCB TFileTileSet;
FCB TFileTileMap;
//En screen5 cada byte define 2 colores, entonces 256px de ancho/2=128 bytes*212 filas=27136 bytes para definir una page
//En el ejemplo de fusion c cada 20 líneas son 2560 bytes
//30720
#define tamanobufferTileSet 27136
unsigned char bufferTileSet[tamanobufferTileSet];
//El tile map solo son bytes que identifican un valor correpondiente a cada fila y cada columna
//256*13 filas, 1024 bytes, necesitamos 32 valores para identificar los 13 tiles de cada fila de tiles de 16x16px
#define tamanoBufferTileMap 3328
unsigned char bufferTileMap[tamanoBufferTileMap];
//Son 16 bytes por 32 planos
#define tamanoBufferSpriteColor 32*16
unsigned char bufferSpritesColor[tamanoBufferSpriteColor];


unsigned int column=0;
unsigned int modulo16=0;


//Efectos
#define SONG_EFFECT_TAM 1207
unsigned char songEffectsBuffer[SONG_EFFECT_TAM]; 
char fileNameSongEffects[]={"effects.afb"};
FCB TFileEffects; 

//unsigned int desplazamiento=0;
#endif
/********FINAL DE DECLARAIONES***********/




/**************DEFINICIONES************/
void cargarTileSetEnRAM(){
    //Cargamos el archivo en la estructura
    FT_SetName( &TFileTileSet, &fileNameTilseSet[0] );
    fcb_open( &TFileTileSet );
    //Sino omitimos los 7 primeros bytes (los que defininen la estructura del binario) aparecen  unas marcas arriba a la derecha
    fcb_read( &TFileTileSet, &bufferTileSet[0], 7 ); 
    //Cargamos el archivo definido en la estructura y lo ponemos en la RAM (buffer)
    fcb_read( &TFileTileSet, &bufferTileSet[0], tamanobufferTileSet );  
    fcb_close( &TFileTileSet );
}
//Cargamos el archivo &fileNameTileMap[0]  en el buffer  &bufferTileMap[0]
void cargarTileMapEnRAM(){
    FT_SetName( &TFileTileMap, &fileNameTileMap[0] );
    fcb_open( &TFileTileMap );
    //Analizando el archivo word0.bin con un editor hexadecimal vemos que hay que saltar 8 bytes que definen al .bin
    //fcb_read( &TFileTileMap, &bufferTileMap[0], 8 );  // Skip 7 first bytes of the file  
    fcb_read( &TFileTileMap, &bufferTileMap[0], 7 );  // Skip 7 first bytes of the file  
    fcb_read( &TFileTileMap, &bufferTileMap[0], tamanoBufferTileMap );  // Read 20 lines of image data (128bytes per line in screen5)
    fcb_close( &TFileTileMap);
}
void man_game_cargar_buffer_efectos_sonido(){
   //afbdb es un puntero que está definido en ayfx_player.h
    afbdata=MMalloc(SONG_EFFECT_TAM);
    FT_SetName( &TFileEffects, "effects.afb");
    fcb_open( &TFileEffects );
    fcb_read( &TFileEffects, afbdata, SONG_EFFECT_TAM );  
    fcb_close( &TFileEffects );
}

void deRamAVramPage1(void){
  //HMMC transfiere bloques de RAM a VRAM rápidamente en un area rectangular, ver www.tipolisto.es/files/v9938 página 66
  //HMMM(buffer en RAM, posición_x, posición_Y (256 será la page 1), ancho copia, alto copia)
  HMMC(&bufferTileSet[0], 0,256,256,212 ); 
}



void FT_SetName( FCB *p_fcb, const char *p_name )  // Routine servant à vérifier le format du nom de fichier
{
  char i, j;
  memset( p_fcb, 0, sizeof(FCB) );
  for( i = 0; i < 11; i++ ) {
    p_fcb->name[i] = ' ';
  }
  for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) {
    p_fcb->name[i] =  p_name[i];
  }
  if( p_name[i] == '.' ) {
    i++;
    for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) {
      p_fcb->ext[j] =  p_name[i + j] ;
    }
  }
}



void recorrerBufferTileMapYPintarPage1EnPage0(char level){
  //HMMM transfiere datos de VRAM a VRAM rápidamente
  //hay que mirralo como coordenadas en pantalla
  //HMMM(coordenadaxinicio,256,coordenadaxancho,16*1,dimensionenpixeles,16);
  //El bufer solo lo utilizamos para obtener su valor y ver desde donde tenemos que copiar
  modulo16+=2;
  if (modulo16>256) modulo16=0;
  if(modulo16 % 16==0){
    column++;
    if(level==0){
      for (char f=9; f<13;f++){
      //for (char f=9; f<10;f++){
       row_paint(f);
      }
    }
    if(level==1){
      for (char f=2; f<6;f++){
        row_paint(f);
      }
    }
    if(level==2){
      for (char f=0; f<2;f++){
        row_paint(f+2);
        row_paint(f+11);
      }
    }



   
  }


  //HMMM(2,16, 0,16,256,64);
  //Copia de la parte inferior
  if(level==0 ) HMMM(2,212-64, 0,212-64,256,64);
  //Copiado de la parte superior
  //if(level==1 ) HMMM(2,24, 0,24,256,64);
  if(level==1 ) HMMM(2,32, 0,32,256,64);
  if(level==2){
    HMMM(2,32, 0,32,256,40);
    HMMM(2,170, 0,170,256,38);
  }
  //Copia de la parte central
  //HMMM(2,60, 0,60,256,120);
  /**
   * Copiar toda la pantalla
   * 
   */
  //copia desde x=2 y=148 con un ancho de 256 y largo 64
  //pégalo en x=0 y=148
  //HMMM(2,0, 0,0,256,212);
}

void set_level(char level){
  SpriteOff();
  Cls();
  level=level;
  column=0;
  modulo16=0;
  if(level==0){
    //En el level 0 solo aparece tierra abajo
    fileNameTileMap="level0.bin";
    //Copiamos la imagen del level 1
    HMMM(90,256+164, 100,60,60,48);
    PutText(0,120,"Level 1: planet SG-22N, Anukaki rebellion.",8);
  }else if(level==1){
    fileNameTileMap="level1.bin";
    PutText(0,80,"Level 2: planet PK-286, fight for fuel.",8);
  }else if(level==2){
    fileNameTileMap="level2.bin";
    PutText(0,80,"Level 3: iron planet, fight for the material.",8);
  }else if(level==3){
    PutText(0,80,"The end.",8);
    level=0;
  }
  cargarTileMapEnRAM();

  for(long q=0;q<60000;q++);
  Cls();
    //Vamos a dibujar un montón de estrellas
  for (int z=0; z<100; ++z) {
    //Pset dibuja un pixel con el color especificado
    Pset(generar_numero_aleatorio(0,240),generar_numero_aleatorio(60,150),15,0);
  }
  SpriteOn();
}

void row_paint(char row){
    int posicion_x_tileset;
    char posicion_y_tileset;
    char tile=0;
    int numeroColumnas=256;
    tile=bufferTileMap[(numeroColumnas*row)+column];

    //PutText(column*30,20,Itoa(tile,"    ",10),8);
    posicion_y_tileset=(((tile/16)+1)*16)-(bufferTileMap[column+(row*numeroColumnas)]);
    posicion_x_tileset=(16-posicion_y_tileset)*16;
    //HMMM( int XS, int YS, int XT, int YT, int DX, int DY);	
    HMMM(posicion_x_tileset,(bufferTileMap[column+(row*numeroColumnas)]/16)*16+256, 256-16,row*16,16,16);
    //LMMM( int XS, int YS, int XT, int YT, int DX, int DY, unsigned char OP );	
    //LMMM(posicion_x_tileset,(bufferTileMap[column+(row*numeroColumnas)]/16)*16+256, 256-16,row*16,16,16,LOGICAL_TOR);
}


  



void SetAdjust(signed char x, signed char y) // x and y must be between -7 and +6
{
    char vx,vy,value;
    vx=x;
    if (x<0)
      vx=16+x;
    vy=y;
    if (y<0)
      vy=16+y;
    value = (vy<<4) | vx ;
    Poke(0xFFF1,value);     // Reg 18 Save
    VDPwrite(18,value);
}

void poner_columna_negra(char* colorBuffer, char level){
    char start_plane=28;
    char y_position1=0;
    char y_position2=0;

    start_plane=28;
    if(level==0){
      y_position1=148;
      y_position2=148;
    }
    if(level==1){
      y_position1=30; 
      y_position2=30; 
    }
    if(level==2){
      y_position1=30; 
      y_position2=142;
    }
    for (char i=0; i<2; i++){
      PutSprite( start_plane+i,40*4,240,y_position1+(16*i),0);
      SC5SpriteColors(start_plane+i, &colorBuffer[40*16]); 
    }
    for (char i=2; i<4; i++){
      PutSprite( start_plane+i,40*4,240,y_position2+(16*i),0);
      SC5SpriteColors(start_plane+i, &colorBuffer[40*16]); 
    }
      /*//162
      PutSprite( 28,40*4,240,148,1);
      //178
      PutSprite( 29,40*4,240,164,1);
      //194
      PutSprite( 30,40*4,240,180,1);
      //210
      PutSprite( 31,40*4,240,196,1);

      SC5SpriteColors(28, &colorBuffer[39*16]);
      SC5SpriteColors(29, &colorBuffer[39*16]);
      SC5SpriteColors(30, &colorBuffer[39*16]);
      SC5SpriteColors(31, &colorBuffer[39*16]);*/


      
      /*for (char i=0; i<4; i++){
        PutSprite( start_plane+i,40*4,240,16+(16*i),0);
        SC5SpriteColors(start_plane+i, &colorBuffer[40*16]);
      } */

}
char generar_numero_aleatorio (char a, char b){
  //Time es un struct + typedef con 3 enteros para las horas, minutos y segundos
    //TIME tm;
    char random; 
    //GetTime obtiene la hora del MSDOS y se la asigna al struct TIME
    //GetTime(&tm); 
    //srand utiliza los segundos como semilla para generar un número aleatorio  
    //srand y rand forman parte de la librería stdlib.h normalmente utilizada para castear strings y manejar memoria dinámica         
    //srand(tm.sec);
    random = rand()%(b-a)+a;  
    return(random);
}
//Intenta crear el nombre de los archivos menor de 8 letras
void load_file_into_buffer(char *filename) {
  int file;	// Set a file handler variable
  //byte buffer[Cabecera_Fichero];
  file=Open(filename, O_RDONLY);
  //printf("\n\rFichero %s abierto.", filename);
  // Se salta la cabecera
  Read(file, &bufferTileSet[0], 7);	
  // Leyendo la tabla de patrones	de sprites
  Read(file, &bufferTileSet[0], 3328);
  Close(file);
  //printf("\n\rFichero %s leido.", filename);
}

//Con sprites.c= CC0A pero con 33 sprites
//0000C663
//Enemigos terrestres del 18 al 23
//Enemigos superiores del 24 al 29
//Enemigos naves del 30 al 39
void copy_sprites_definition_to_VRAM(){
  load_file_into_buffer("sprites.bin");
	for (char i=0; i<42; i++) {		
		SetSpritePattern(i*4, &bufferTileSet[i*32],32);
	}

}
void copy_color_sprite_to_VRAM( ){
    load_file_into_buffer("sprcol.bin");
    for (char i=0; i<42; i++) {	
        SC5SpriteColors(i, &bufferTileSet[i*16]);
    }
}

char* create_sprite_color_buffer(){
    load_file_into_buffer("sprcol.bin");
    for (int i=0; i<42*16; i++) {	
       bufferSpritesColor[i]=bufferTileSet[i];
    }
    return &bufferSpritesColor[0];
}

