#pragma once
#include "../../fusion-c/header/msx_fusion.h"
#include "../../fusion-c/header/vdp_graph2.h"
#include "../../src/man/entity.c"
#include "../../src/sys/anim.c"
//Declarations
void sys_render_init();
void sys_render_update(TEntity *entity);
void sys_render_update_player(TEntity *player);
void sys_render_update_enemy1(TEntity *enemy);
void sys_render_update_enemy2(TEntity *enemy);
void sys_render_update_enemy3(TEntity *enemy);
void sys_render_update_shot(TEntity *fire);
void sys_render_update_object_money(TEntity *object);
void sys_render_update_object_divan1(TEntity *entity);

//Definitions
void sys_render_init(){
  //SetColors( int ForeCol, int BackgrCol, int BorderCol )
  SetColors(1,0,15);
  Screen(5);
  //Ponemos a 0 todos los sprites
  SpriteReset(); 
  // tamaño de sprites 16x16
  Sprite16(); 
  //// tamaño de sprites sin ampliar   
  SpriteSmall(); 
  //Lo desactivamos para que se muestre cuando se cargue el mapa
  SpriteOff();
}


void sys_render_update(TEntity *entity){
    if (entity->type==entity_type_player)sys_render_update_player(entity);
    if (entity->type==entity_type_enemy1)sys_render_update_enemy1(entity);
    if (entity->type==entity_type_enemy2)sys_render_update_enemy2(entity);
    if (entity->type==entity_type_enemy3)sys_render_update_enemy3(entity);
    if (entity->type==entity_type_shot)sys_render_update_shot(entity);
    if (entity->type==entity_type_object_money)sys_render_update_object_money(entity);
    if (entity->type==entity_type_object_divan1 || entity->type==entity_type_object_divan2)sys_render_update_object_divan1(entity);


}
void sys_render_update_player(TEntity *player){
    //void PutSprite( char sprite_n, char pattern_n, char x, char y, char color)
    // 1 El plano o su definición en la tabla de atributos, es donde alamcenará la posición x e y, y su sprite
    // 2 la definición en sprite pattern que va de 4 en 4
    // 3 posición eje x
    // 4 posición eje y
    // 5 color  
    //PutSprite( pplano, psprite, px,py, pcolor );
    //Si se mueve a la derecha
    if (player->dir==1 || player->dir==5){
        PutSprite( player->plane, player_up1_pattern, player->x,player->y,0 );
    }else if (player->dir==2){
        PutSprite( player->plane, player_Jump_right_pattern, player->x,player->y,0 );
    }else if (player->dir==8){
        PutSprite( player->plane, player_jump_left_pattern, player->x,player->y,0 );
    }else if (player->dir==3){
        if(player->andando ==0 ){
            PutSprite( player->plane, player_right_pattern, player->x,player->y,0 );
        } else {
            PutSprite( player->plane, player_right_walking_pattern, player->x,player->y,  0);
        }
    //Si se mueve a la izquierda
    }else if(player->dir==7){
        if (player->jump==1){
            PutSprite( player->plane, player_jump_left_pattern, player->x,player->y,0 );
        }else{
            if(player->andando ==0){
                PutSprite( player->plane, player_left_pattern, player->x,player->y, 0 );
            } else {
                PutSprite( player->plane, player_left_walking_pattern, player->x,player->y,  0 );
            }
        } 
    }
}



void sys_render_update_enemy1(TEntity *enemy){   
    //Sistema de animación
    sys_anim_update(enemy);
    //No queremos qu ecuando se salga de la pantalla pinte a los enemigos
    if (enemy->dir==3 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane,enemy1_right_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane,enemy1_right_walking_pattern,enemy->x,enemy->y,0);
        } 
        //todo poner la ara derecha a los enemigos
    }else if (enemy->dir==7 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane,enemy1_left_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane,enemy1_left_walking_pattern,enemy->x,enemy->y,0);
        } 
    }else{
         PutSprite(enemy->plane,enemy1_left_walking_pattern,0,212,0);
    }
}

void sys_render_update_enemy2(TEntity *enemy){   
 //Sistema de animación
    sys_anim_update(enemy);
    //No queremos qu ecuando se salga de la pantalla pinte a los enemigos
    if (enemy->dir==3 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane,enemy2_right_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane,enemy2_right_walking_pattern,enemy->x,enemy->y,0);
        } 
        //todo poner la ara derecha a los enemigos
    }else if (enemy->dir==5 || enemy->dir==1 && enemy->y<212 && enemy->y>0){
        if (enemy->andando){
            PutSprite(enemy->plane,enemy2_up_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane,enemy2_up_walking_pattern,enemy->x,enemy->y,0);
        } 
    }else if (enemy->dir==7 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane,enemy2_left_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane,enemy2_left_walking_pattern,enemy->x,enemy->y,0);
        } 
    }else{
         PutSprite(enemy->plane,enemy2_left_walking_pattern,0,212,0);
    }
}
void sys_render_update_enemy3(TEntity *enemy){   
 //Sistema de animación
    sys_anim_update(enemy);
    //No queremos qu ecuando se salga de la pantalla pinte a los enemigos
    if (enemy->dir==3 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane+6,enemy3_right_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane+6,enemy3_right_walking_pattern,enemy->x,enemy->y,0);
        } 
        //todo poner la ara derecha a los enemigos
    }else if (enemy->dir==5 || enemy->dir==1 && enemy->y<212 && enemy->y>0){
        if (enemy->andando){
            PutSprite(enemy->plane+6,enemy3_up_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane+6,enemy3_up_walking_pattern,enemy->x,enemy->y,0);
        } 
    }else if (enemy->dir==7 && enemy->x<256 && enemy->x>0){
        if (enemy->andando){
            PutSprite(enemy->plane+6,enemy3_left_pattern,enemy->x,enemy->y,0);
        }else{
            PutSprite(enemy->plane+6,enemy3_left_walking_pattern,enemy->x,enemy->y,0);
        } 
    }else{
         PutSprite(enemy->plane+6,enemy3_left_walking_pattern,0,212,0);
    }
}
void sys_render_update_shot(TEntity *shot){
   PutSprite(shot->plane,shot_pattern,shot->x,shot->y,0);
}

 
void sys_render_update_object_money(TEntity *object){
    //PutSprite(object->plane,object_money_pattern,object->x,object->y,0);
    PutSprite(object->plane,object_money_pattern,object->x,object->y,0);
}

void sys_render_update_object_divan1(TEntity *object){
    //PutSprite(object->plane,object_divan1_pattern,object->x,object->y,0);
    PutSprite(object->plane,object_divan1_pattern,object->x,object->y,0);
}


