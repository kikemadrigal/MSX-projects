#pragma once
#include "../../src/man/entity.c"
//Para el buffer
#include "../../src/man/files.c"

/**************DECLARACIONES************/
//void sys_collider_init();

int sys_collider_get_file_entity(TEntity *entity);
int sys_collider_get_column_entity(TEntity *entity);
int sys_collider_get_tile_array(TEntity *entity);
int sys_collider_get_tile_right_array(TEntity *entity);
int sys_collider_get_tile_left_array(TEntity *entity);
int sys_collider_get_tile_up_array(TEntity *entity);
int sys_collider_get_tile_down_array(TEntity *entity);
void sys_collider_set_tile_down_left_array(TEntity *entity,char tile);
void sys_collider_set_tile_down_right_array(TEntity *entity,char tile);
int get_tile_down_left_array(TEntity *entity);
int get_tile_down_right_array(TEntity *entity);
char sys_collider_entity1_collider_entity(TEntity *entity1, TEntity *entity2);
char sys_collider_entity1_collider_shot(TEntity *entity1, TEntity *shot);

/********FINAL DE DECLARAIONES***********/



/**************DEFINICIONES************/
/*void sys_collider_init(){

}*/

int sys_collider_get_column_entity(TEntity *entity){
  if( entity->type==entity_type_enemy1 || entity->type==entity_type_enemy2 || entity->type==entity_type_enemy3) return (entity->x+8)/8;
  if (entity->dir==3 || entity->dir==2)return entity->x/8;
  else return (entity->x+10)/8;

 
}
int sys_collider_get_file_entity(TEntity *entity){
  //Será la posición y / 8 pixeles
  //if(entity->y % 8!=0) return;
  return (entity->y/8);
}
int sys_collider_get_tile_array(TEntity *entity){
  //Le sumamos 1 a la fila porque es un sprite de 16*16px, para ver el tile del pié
  int tile_pie=buffer[((sys_collider_get_file_entity(entity)+1)*32)+(sys_collider_get_column_entity(entity))];
  return tile_pie;
}
int sys_collider_get_tile_right_array(TEntity *entity){
  //Le sumamos 2 a la fila porque es un sprite de 16*16px, para ver el tile del suelo
  int tile_abajo=buffer[((sys_collider_get_file_entity(entity)+1)*32)+(sys_collider_get_column_entity(entity)+1)];
  return tile_abajo; 
}
int sys_collider_get_tile_left_array(TEntity *entity){
  //Le sumamos 2 a la fila porque es un sprite de 16*16px, para ver el tile del suelo
  int tile_abajo=buffer[((sys_collider_get_file_entity(entity)+1)*32)+(sys_collider_get_column_entity(entity)-1)];
  return tile_abajo; 
}
int sys_collider_get_tile_up_array(TEntity *entity){
  //Le sumamos 2 a la fila porque es un sprite de 16*16px, para ver el tile del suelo
  int tile_abajo=buffer[((sys_collider_get_file_entity(entity))*32)+(sys_collider_get_column_entity(entity))];
  return tile_abajo; 
}
int sys_collider_get_tile_down_array(TEntity *entity){
  //Le sumamos 2 a la fila porque es un sprite de 16*16px, para ver el tile del suelo
  int tile_abajo=buffer[((sys_collider_get_file_entity(entity)+2)*32)+(sys_collider_get_column_entity(entity))];
  return tile_abajo; 
}

int get_tile_down_left_array(TEntity *entity){
  int tile_down_left=buffer[((sys_collider_get_file_entity(entity)+2)*32)+(sys_collider_get_column_entity(entity))-1];
  return tile_down_left; 
}
void sys_collider_set_tile_down_left_array(TEntity *entity,char tile){
  buffer[((sys_collider_get_file_entity(entity)+2)*32)+(sys_collider_get_column_entity(entity))-1]=tile;
}
int get_tile_down_right_array(TEntity *entity){
  int tile_down_right=buffer[((sys_collider_get_file_entity(entity)+2)*32)+(sys_collider_get_column_entity(entity))+1];
  return tile_down_right; 
}
void sys_collider_set_tile_down_right_array(TEntity *entity,char tile){
  buffer[((sys_collider_get_file_entity(entity)+2)*32)+(sys_collider_get_column_entity(entity))+1]=tile;


}





char sys_collider_entity1_collider_entity(TEntity *entity1, TEntity *entity2){
    //if (enemiX < player.x + 16 &&  enemiX + 16 > player.x && enemiY < player.y + 32 && 16 + enemiY > player.y){
    //if (entity2->x < entity1->x + 16 &&  entity2->x + 16 > entity1->x && entity2->y < entity1->y + 16 && 16 + entity2->y > entity1->y){
    if (entity2->x < entity1->x + entity1->w &&  entity2->x + entity2->w > entity1->x && entity2->y < entity1->y + entity1->h && entity2->h + entity2->y > entity1->y){
        return 1;
    }else{
        return 0;
    }
}

char sys_collider_entity1_collider_shot(TEntity *entity1, TEntity *shot){
    //if (enemiX < player.x + 16 &&  enemiX + 16 > player.x && enemiY < player.y + 32 && 16 + enemiY > player.y){
    if (shot->x < entity1->x + entity1->w &&  shot->x + shot->w > entity1->x && shot->y < entity1->y + entity1->h && shot->h + shot->y > entity1->y){
        return 1;
    }else{
        return 0;
    }
}