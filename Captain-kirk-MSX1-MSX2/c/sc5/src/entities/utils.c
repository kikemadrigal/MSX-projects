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
void load_into_buffer(char *file_name);
//void mostrarArray();
void row_paint(char row);
void set_level(char level);
//Esto es para asociar un archivo al struct de archivos
void FT_SetName( FCB *p_fcb, const char *p_name );

void recorrerBufferTileMapYPintarPage1EnPage0(char level);
void deRamAVramPage1(void);
void SetAdjust(signed char x, signed char y);
void poner_columna_negra(char* colorBuffer, char level);
char generar_numero_aleatorio (char a, char b);
void copy_sprites_definition_to_VRAM();
void copy_color_sprite_to_VRAM();
char* create_sprite_color_buffer();
void load_buffer_sound_effects();
void load_buffer_music();


//VARIABLES Y ARRAYS
//Nombre del archivo escogido cuando cambiemos de nivel
char *fileNameTileMap;
//En screen5 cada byte define 2 colores, entonces 256px de ancho/2=128 bytes*212 filas=27136 bytes para definir una page
#define tamanobufferTileSet 27136
unsigned char buffer[tamanobufferTileSet];
//El tile map solo son bytes que identifican un valor correpondiente a cada fila y cada columna
//256*13 filas, 3328 bytes, necesitamos 32 valores para identificar los 13 tiles de cada fila de tiles de 16x16px
#define tamanoBufferTileMap 3328
//Son las definiciones de los colores que las almacenamos para depués ir trabajando con ellas
//Son 16 bytes por 32 planos
#define tamanoBufferSpriteColor 32*16
unsigned char bufferSpritesColor[tamanoBufferSpriteColor];

//vaiables necesarias para mover la pantalla y hacer el scroll
unsigned int column=0;
unsigned int modulo16=0;

//Music
#define SONG_BUFFER_TAM 264
unsigned char songBuffer[SONG_BUFFER_TAM];  
char *fileNameSong;
//Efectos
#define SONG_EFFECT_TAM 1207
unsigned char songEffectsBuffer[SONG_EFFECT_TAM]; 
char *fileNameSongEffects;

//unsigned int desplazamiento=0;
#endif
/********FINAL DE DECLARAIONES***********/




/**************DEFINICIONES************/
void load_into_buffer(char *file_name){
  FCB TFile;
  //Cargamos el archivo en la estructura
  FT_SetName( &TFile,file_name );
  fcb_open( &TFile );
  //Sino omitimos los 7 primeros bytes (los que defininen la estructura del binario) aparecen  unas marcas arriba a la derecha
  fcb_read( &TFile, &buffer[0], 7 ); 
  //Cargamos el archivo definido en la estructura y lo ponemos en la RAM (buffer)
  fcb_read( &TFile, &buffer[0], tamanobufferTileSet );  
  fcb_close( &TFile );
}



void copy_sprites_definition_to_VRAM(){
  load_into_buffer("sprites.bin");
	for (char i=0; i<42; i++) {		
		SetSpritePattern(i*4, &buffer[i*32],32);
	}

}
void copy_color_sprite_to_VRAM( ){
    load_into_buffer("sprcol.bin");
    for (char i=0; i<42; i++) {	
        SC5SpriteColors(i, &buffer[i*16]);
    }
}

char* create_sprite_color_buffer(){
    load_into_buffer("sprcol.bin");
    for (int i=0; i<42*16; i++) {	
       bufferSpritesColor[i]=buffer[i];
    }
    return &bufferSpritesColor[0];
}

void load_buffer_sound_effects(){
    FCB TFileEffects; 
    fileNameSongEffects="effects.afb";
      //afbdb es un puntero que está definido en ayfx_player.h
    afbdata=MMalloc(SONG_EFFECT_TAM);
    FT_SetName( &TFileEffects, fileNameSongEffects);
    fcb_open( &TFileEffects );
    fcb_read( &TFileEffects, afbdata, SONG_EFFECT_TAM );  
    fcb_close( &TFileEffects );
}
void load_buffer_music(){
  FCB TFileMusic; 
  fileNameSong="song1.pt3";
  FT_SetName( &TFileMusic, fileNameSong);
  fcb_open( &TFileMusic );
  fcb_read( &TFileMusic, &songBuffer[0], SONG_BUFFER_TAM );  
  fcb_close( &TFileMusic );
}

void deRamAVramPage1(void){
  //HMMC transfiere bloques de RAM a VRAM rápidamente en un area rectangular, ver www.tipolisto.es/files/v9938 página 66
  //HMMM(buffer en RAM, posición_x, posición_Y (256 será la page 1), ancho copia, alto copia)
  HMMC(&buffer[0], 0,256,256,212 ); 
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
    HMMM(0,256+128, 100,40,80,30);
    PutText(0,120,"Level 1: planet SG-22N, Anukaki rebellion.",8);
  }else if(level==1){
    fileNameTileMap="level1.bin";
    HMMM(86,256+128, 100,40,80,30);
    PutText(0,80,"Level 2: planet PK-286, fight for fuel.",8);
  }else if(level==2){
    fileNameTileMap="level2.bin";
    HMMM(160,256+128, 100,40,80,30);
    PutText(0,80,"Level 3: iron planet, fight for the material.",8);
  }
  load_into_buffer(fileNameTileMap);

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
    tile=buffer[(numeroColumnas*row)+column];

    //PutText(column*30,20,Itoa(tile,"    ",10),8);
    posicion_y_tileset=(((tile/16)+1)*16)-(buffer[column+(row*numeroColumnas)]);
    posicion_x_tileset=(16-posicion_y_tileset)*16;
    //HMMM( int XS, int YS, int XT, int YT, int DX, int DY);	
    HMMM(posicion_x_tileset,(buffer[column+(row*numeroColumnas)]/16)*16+256, 256-16,row*16,16,16);
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


