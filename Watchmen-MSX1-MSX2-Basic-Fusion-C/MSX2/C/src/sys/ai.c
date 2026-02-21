#pragma once
#include "../../fusion-c/header/msx_fusion.h"
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>
#include "../../src/man/entity.c"
#include "../../src/sys/physics.c"
//Declarations
void sys_ai_init();
void sys_ai_update(TEntity *entity);
void sys_ai_update_enemy_behavior_1(TEntity *enemy);
void sys_ai_update_enemy_behavior_2(TEntity *enemy);

//int sys_ai_contador;
TEntity* player;

//Definitions
void sys_ai_init(){
    //sys_ai_contador=0;
    player=sys_entity_create_player();
}


void sys_ai_update(TEntity *entity){
    if (entity->type==entity_type_enemy1)sys_ai_update_enemy_behavior_1(entity);
    if (entity->type==entity_type_enemy2 || entity->type==entity_type_enemy3)sys_ai_update_enemy_behavior_2(entity);
   
}

void sys_ai_update_enemy_behavior_1(TEntity *enemy){
    //Cuando haya un choque con algún objeto pared se cambiará su velocidad para que reste y la dirección
    /*if (man_graphics_get_tile_left_array(enemy)>man_graphics_get_tile_suelo() || man_graphics_get_tile_right_array(enemy)>man_graphics_get_tile_suelo() ){
        if(enemy->dir==7) enemy->dir=3;
        else if(enemy->dir==3) enemy->dir=7;
        //Beep();
    }*/
    //Si el tile de abajo a la derecha es un vacío invertimos la dirección
    if (get_tile_down_right_array(enemy)==tile_empty || get_tile_down_left_array(enemy)==tile_empty || sys_collider_get_tile_right_array(enemy)==tile_wall || sys_collider_get_tile_left_array(enemy)==tile_wall) {
        if(enemy->dir==7) enemy->dir=3;
        else if(enemy->dir==3) enemy->dir=7;
    }
    if(enemy->dir==7){
        enemy->x-=enemy->vx;
    }else if(enemy->dir==3){
        enemy->x+=enemy->vx;
    }

    if(enemy->x<=8) enemy->dir=3;
    if(enemy->x>=256-16) enemy->dir=7;

}

void sys_ai_update_enemy_behavior_2(TEntity *enemy){
    //Si la distancia horizontal es mayor que 0 es que el player está en la derecha
    int horizontal_distance=player->x-enemy->x;
    //Si la distancia vertical es mayor que cero es que el player está abajo
    int vertical_distance=player->y-enemy->y;
    if (enemy->x<8 || enemy->x>256-16) {
        if(enemy->dir==7) enemy->dir=3;
        else if(enemy->dir==3) enemy->dir=7;
    }
    if(enemy->type==entity_type_enemy2){
        if (get_tile_down_right_array(enemy)==tile_empty || get_tile_down_left_array(enemy)==tile_empty || sys_collider_get_tile_right_array(enemy)==tile_wall || sys_collider_get_tile_left_array(enemy)==tile_wall) {
            if(enemy->dir==7) enemy->dir=3;
            else if(enemy->dir==3) enemy->dir=7;
        }
    }
 
    if(enemy->dir==1){
        if(sys_collider_get_tile_down_array(enemy)!=tile_stairs1){
            if(horizontal_distance>0) enemy->dir=3;
            else enemy->dir=7;
        }
    }else if(enemy->dir==3 || enemy->dir==7){
        /**/
        // si se encuentra abajo un tile vacío..
       if(sys_collider_get_tile_down_array(enemy)==tile_empty){
            if(vertical_distance>0) enemy->dir=5;
        } 
         //Si lo que tiene en los pies es una escalera, comprobará la distancia con el player u subirá o seguirá izquireda o dercha
        else if (sys_collider_get_tile_down_array(enemy)==tile_stairs1){
          if(vertical_distance>0) {
            enemy->dir=5;
          }else{
            enemy->dir=1;
          }
        }else if (sys_collider_get_tile_array(enemy)==tile_stairs1){
            if(vertical_distance<0) enemy->dir=1;
        }

    //Si el enemigo está bajando o cayendo
    }
    else if(enemy->dir==5){
        if(sys_collider_get_tile_down_array(enemy)>=tile_floor_tile){
            if(horizontal_distance>0) enemy->dir=3;
            else enemy->dir=7;
        } 
    }


    if(enemy->dir==1 ){
        enemy->y-=enemy->vy;
    }else if(enemy->dir==3 ){
        enemy->x+=enemy->vx;
    }else if(enemy->dir==5){
        enemy->y+=enemy->vy;
    }else if(enemy->dir==7 ){
        enemy->x-=enemy->vx;
    }
}






