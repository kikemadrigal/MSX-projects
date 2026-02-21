#pragma once 
#include "fusion-c/header/vdp_sprites.h"
#include "./src/sprites/mothership.c"
#include "./src/sprites/playership.c"
#include "./src/sprites/enemies.c"
//Declaration
//#ifndef __SPRITES_H__
//#define __SPRITES_H__
  //Data
  #define playership_pattern 0
  #define mothership_left_pattern 4
  #define mothership_right_pattern 8
  #define enemy1_pattern 12
  #define enemy2_pattern 16
  #define scoreboard_pattern 20


  //Funtions
  void man_sprites_init();
  void man_sprites_load();
//#endif

//Definitions
void man_sprites_init(){
  //Ponemos a 0 todos los sprites
  SpriteReset(); 
  // tamaño de sprites 16x16
  Sprite16(); 
  //// tamaño de sprites sin ampliar   
  SpriteSmall(); 
}


//Definition
void man_sprites_load(){
  //// Los datas del sprites los cargamos con SetSpritePattern, SC5SpriteColors y PutSprite que debería estar en el update
  //void SetSpritePattern( char pattern_n, char* p_pattern, char s_size )
  //Sprite 0, patthern 0
  SetSpritePattern( playership_pattern, sprite_playership, 32);
  //Sprite 1, patthern 4
  SetSpritePattern( mothership_left_pattern, sprite_mothership_left, 32);
  //Sprite 2, patthern 8
  SetSpritePattern( mothership_right_pattern, sprite_mothership_right, 32);  
  //Sprite 3, patthern 12
  SetSpritePattern( enemy1_pattern, sprite_enemy1, 32);
  //Sprite 4
  SetSpritePattern( enemy2_pattern, sprite_enemy2, 32);
  //Sprite 5
  SetSpritePattern( scoreboard_pattern, sprite_scoreboard, 32);
  //SC5SpriteColors( int spriteNumber, unsigned char *data)
  SC5SpriteColors(0, color_sprite_playership);
  SC5SpriteColors(1, color_sprite_mothership_left);
  SC5SpriteColors(2, color_sprite_mothership_right);
  SC5SpriteColors(3, color_sprite_enemy1);
  SC5SpriteColors(4, color_sprite_enemy2);
  SC5SpriteColors(5, color_sprite_scoreboard);

}