#pragma once
#include "../fusion-c/header/msx_fusion.h"

void load_file_into_buffer_with_structure(char *filename);
void enter_name_and_extension_in_structure(FCB *p_fcb, const char *p_name) ;
#define BUFFER_SIZE 27142
char buffer[BUFFER_SIZE];



//Cargamos archivo en RAM
void load_file_into_buffer_with_structure(char *filename){
  FCB struct_fcb;
  //Le metemos el nombre y la extensión a la estructura
  enter_name_and_extension_in_structure(&struct_fcb, filename);
  fcb_open(&struct_fcb);
  //Si no omitimos los 8 primeros bytes (los que defininen la estructura del binario) aparecen  unas marcas arriba a la derecha
  fcb_read( &struct_fcb, &buffer[0], 7 ); 
  //Cargamos el archivo definido en la estructura y lo ponemos en la RAM (buffer)
  fcb_read( &struct_fcb, &buffer[0], BUFFER_SIZE );  
  fcb_close( &struct_fcb );
}

void enter_name_and_extension_in_structure(FCB *p_fcb, const char *p_name)  // Routine servant à vérifier le format du nom de fichier
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