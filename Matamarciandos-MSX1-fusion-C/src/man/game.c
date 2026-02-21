#pragma once
#include "src/man/entity.c"
#include "src/man/sprites.c"
#include "src/sys/render.c"
#include "src/sys/physics.c"
#include "src/sys/ai.c"
//=================Declarations
//Members

//Functions
void man_game_init();
void man_game_play();
void scoreboard();
void wait();
TEntity* array_entities;
//==============End declarations

//==============Definitions
void man_game_init(){
    sys_render_init();
    sys_entity_init();
    man_sprites_init();
    man_sprites_load();
    sys_create_player();
    sys_create_mothership();
    sys_create_enemy();
}
void man_game_play(){
    array_entities=sys_entity_get_array_structs_entities();
    while(1){
        for (char i=0;i<sys_entity_get_num_entities();++i){
            TEntity *entity=&array_entities[i];
            sys_ai_update(entity);
            sys_physics_update(entity);
            sys_render_update(entity);
            //wait();
            //scoreboard();
        }
    }
}

void scoreboard(){
    //0->player, 1->Mothership, 2->enemy
    TEntity *entity=&array_entities[1];
    PutText(0,180, Itoa(entity->x,"   ",10),0);
    PutText(0,100,"               ",0);
}

void wait(){
    __asm
      halt
      halt
  __endasm;
}