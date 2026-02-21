#pragma once
//para el memset
#include <string.h>



//================================Declarations
#define entity_type_invalid      0x00  
#define entity_type_player       0x01  
#define entity_type_enemy        0x02  
#define entity_type_mothership   0x04  
#define entity_type_shot         0x08  
#define entity_type_boxFill      0x10  
#define entity_type_dead         0x80  
#define entity_type_default      entity_type_enemy

#define entity_cmp_render    0x01  //en binario=0000 0001- Renderable entity, entidad dibujable 
#define entity_cmp_movable   0x02  //en binario=0000 0010- Movable entidad, entidad movible (podemos hacerla no moverla para las vidas) 
#define entity_cmp_input     0x04  //en binario=0000 0100- Entity controllable by input
#define entity_cmp_ai        0x08  //en binario=0000 0100- Entity controllable by ai
#define entity_cmp_animated  0x10  //Animated entity
#define entity_cmp_default   0x00  //DEfault components(all bits =0)
//Members
typedef struct t_entity TEntity;
struct t_entity{
    char type;          //Invalid, player,enemy, fire, etc
    char cmpts;         //
    char x,y;
    char w, h;           //width, heigh
    char vx,vy;
    char pattern;
    char sprite;
    char color;
};
#define MAX_ENTITIES 10
TEntity array_structs_entities[MAX_ENTITIES];
char zero_type_at_the_end;
char num_entities;
//Functions
void sys_entity_init();
TEntity* sys_create_entity();
void sys_create_player();
void sys_create_enemy();
TEntity* sys_entity_get_array_structs_entities();
char sys_entity_get_num_entities();
char sys_entity_get_max_entities();
//============================End declarations





//=======================================Definitions
const TEntity player_template={
    entity_type_player, // Type
    entity_cmp_movable | entity_cmp_render | entity_cmp_input, //Components 0b=11=0000 1011
    100,170,             //x,y  
    16, 16,             //width, heigh
    0,0,               //speed X,speed Y 
    0,                  //patrón
    0,                  //Sprite
    10                   //Color
};
const TEntity mothership_template={
    entity_type_mothership, // Type
    entity_cmp_movable | entity_cmp_render | entity_cmp_ai, //Components
    0,0,                //x,y  
    16, 16,             //width, heigh
    1,0,                //speed X,speed Y 
    1*4,                  //patrón
    1,                  //Sprite
    3                   //Color
};

const TEntity enemy_template={
    entity_type_enemy, // Type
    entity_cmp_movable | entity_cmp_render | entity_cmp_ai, //Components
    100,60,             //x,y  
    16, 32,             //width, heigh
    -1,0,               //speed X,speed Y 
    3*4,                  //patrón
    3,                  //Sprite
    3                  //Color
};
void sys_entity_init(){
    //Ponemos a 0 todos los valores del array de estructuras
    //void * memset ( void * ptr, int value, size_t num );
    memset(array_structs_entities,0,sizeof(array_structs_entities) );
    num_entities=0;
}




TEntity* sys_create_entity(){
    TEntity *entity=&array_structs_entities[num_entities];
    ++num_entities;
    return entity;
}

void sys_create_player(){
    TEntity* entity=sys_create_entity();
    memcpy(entity,&player_template,sizeof(TEntity));
}
void sys_create_mothership(){
    TEntity* entity=sys_create_entity();
    memcpy(entity,&mothership_template,sizeof(TEntity));
}
void sys_create_enemy(){
    TEntity* entity=sys_create_entity();
    memcpy(entity,&enemy_template,sizeof(TEntity));
}

TEntity* sys_entity_get_array_structs_entities(){
    return array_structs_entities;
}

char sys_entity_get_num_entities(){
    return num_entities;
}

char sys_entity_get_max_entities(){
    return MAX_ENTITIES;
}