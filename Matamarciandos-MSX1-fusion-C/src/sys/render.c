#pragma once
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"

//Declarations
void sys_render_init();
void sys_render_update(TEntity *entity);

//Definitions
void sys_render_init(){
  SetColors(15,1,1);
  SetBorderColor(0x01);
  Screen(5);
}
void sys_render_update(TEntity *entity){
    //char oldX=entity->x-entity->vx;
    //char oldY=entity->y-entity->vy;
    //BoxFill (oldX, oldX,16, 16,0, 0);
    //BoxFill (int X1, int Y1, int X2, int Y22, char color, char OP )
    //Draws a filled rectangle from X1,Y1 (left upper corner) to x2,y2 (right bottom corner) with color and logical operation OP.
    //void PutSprite( char sprite_n, char pattern_n, char x, char y, charcolor)
    if (entity->type==entity_type_boxFill){
      BoxFill (entity->x,entity->y, entity->x+entity->w, entity->y+entity->h, entity->color, 0 );
    }else if(entity->type==entity_type_player){
      PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
    }else if(entity->type==entity_type_mothership){
      PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
      PutSprite(entity->sprite+1, 8, entity->x+16, entity->y, entity->color);
    }else if(entity->type==entity_type_enemy){
      PutSprite(entity->sprite, entity->pattern, entity->x, entity->y, entity->color);
    }
 

}