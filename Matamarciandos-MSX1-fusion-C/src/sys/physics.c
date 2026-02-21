#pragma once
//#include "fusion-c/header/msx_fusion.h"
#include "./src/man/entity.c"

//Declarations
void sys_physics_init();
void sys_physics_update(TEntity *entity);
void sys_physics_check_keyboard(TEntity *entity);

//Definitions
void sys_physics_init(){

}
void sys_physics_update(TEntity *entity){
    if (entity->type==entity_type_player)
        sys_physics_check_keyboard(entity);
    entity->x+=entity->vx;
    entity->y+=entity->vy;
}


void sys_physics_check_keyboard(TEntity *entity){
    // 0=inactive  1=up 2=up & right 3=right 4=down & right 5=down 6=down & left 7=left 8=up & left 
    entity->vx=0;
    entity->vy=0;
	char joy = JoystickRead(0);
    //if(joy!=0) Beep();
    if(joy==3) entity->vx=1;
    else if(joy==7) entity->vx=-1; 
    else if(joy==1) entity->vy=-1;
    else if(joy==5) entity->vy=1;
 
}
