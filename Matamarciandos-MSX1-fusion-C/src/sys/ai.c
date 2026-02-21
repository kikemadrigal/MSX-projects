#pragma once
//rand
#include <stdlib.h>
#include "./src/man/entity.c"

//Declarations
void sys_ai_init();
void sys_ai_update(TEntity *entity);
void sys_ai_behaviour_mothership(TEntity *entity);


//Definitions
void sys_ai_init(){

}
//La nave nodriza solo rebotará contra las paredes
void sys_ai_behaviour_mothership(TEntity *entity){
    if(entity->x<10)
        entity->vx=1;
    if(entity->x>200 && entity->x<255 )
        entity->vx=-1;
}

void sys_ai_behaviour_enemy(TEntity *entity){
    if(entity->x<20){
        entity->vy=1;
        entity->vx=0;
    }
       
    if(entity->y>190){
        entity->y=60;
        entity->x=rand()%(200-40)+40;
        entity->vy=0;
        entity->vx=1;
    }

}
void sys_ai_update(TEntity *entity){
    if(entity->type==entity_type_mothership)
        sys_ai_behaviour_mothership(entity);
    if(entity->type==entity_type_enemy)
        sys_ai_behaviour_enemy(entity);
}


