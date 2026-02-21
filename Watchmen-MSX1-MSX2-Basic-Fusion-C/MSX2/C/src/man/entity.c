#pragma once
//para el memset
#include <string.h>



//================================Declarations
#define entity_type_invalid      0x00  
#define entity_type_player       0x01  
#define entity_type_enemy1       0x02  
#define entity_type_enemy2       0x04  
#define entity_type_enemy3       0x08  
#define entity_type_shot         0x10  
#define entity_type_object_money 0x16  
#define entity_type_object_divan1 0x32  
#define entity_type_object_divan2 0x80
#define entity_type_boss         0x128  
#define entity_type_default      entity_type_enemy

#define entity_cmp_render    0x01  //en binario=0000 0001- Renderable entity, entidad dibujable 
#define entity_cmp_movable   0x02  //en binario=0000 0010- Movable entidad, entidad movible (podemos hacerla no moverla para las vidas) 
#define entity_cmp_input     0x04  //en binario=0000 0100- Entity controllable by input
#define entity_cmp_ai        0x08  //en binario=0000 0100- Entity controllable by ai
#define entity_cmp_animated  0x10  //Animated entity
#define entity_cmp_default   0x00  //DEfault components(all bits =0)

/*
#define shot_plane 0
#define player_plane 5
#define enemy1_plane 9
#define object_plane 19
#define divan1_plane 22
#define divan2_plane 23
#define object_any 24
*/

#define divan1_plane 0
#define divan2_plane 1
#define shot_plane 2
#define player_plane 5
#define enemy1_plane 11
#define enemy2_plane 15
#define enemy3_plane 21
#define object_plane 27
#define object_any 29

//Definiendo patrones
#define total_patterns 30
//Esto tiene que seguir el orden exacto en el que hemos metido los datos en la VRAM
//Divan
#define object_divan1_pattern 0*4 //Sprite 0
#define object_divan2_pattern 1*4 //Sprite 1
//Shots
#define shot_pattern 2*4 //Sprite 2
//Player
#define player_left_pattern 3*4 //Sprite 2
#define player_left_walking_pattern 4*4 //Sprite 3
#define player_right_pattern 5*4 //Sprite 4
#define player_right_walking_pattern 6*4 //Sprite 5
#define player_up1_pattern 7*4 //Sprite 6
#define player_up2_pattern 8*4 //Sprite 7
#define player_jump_left_pattern 9*4 //Sprite 8
#define player_Jump_right_pattern 10*4 //Sprite 9

//Enemy 1 (este enemigo tan solo rebota de un lado a otro, ver sys/ai.c->sys_ai_update_enemy_behavior_1)
#define enemy1_right_pattern 11*4 //Sprite 10
#define enemy1_right_walking_pattern 12*4 //Sprite 11
#define enemy1_left_pattern 13*4 //Sprite 12
#define enemy1_left_walking_pattern 14*4 //Sprite 13

//Enemy 2 (este enemigo te persigue bajando por las escaleras)
#define enemy2_right_pattern 15*4 //Sprite 10
#define enemy2_right_walking_pattern 16*4 //Sprite 11
#define enemy2_left_pattern 17*4 //Sprite 12
#define enemy2_left_walking_pattern 18*4 //Sprite 13
#define enemy2_up_pattern 19*4 //Sprite 13
#define enemy2_up_walking_pattern 20*4 //Sprite 13

//Enemiy 3 (este enemigo te persigue lanzándose por el aire)
#define enemy3_right_pattern 21*4 //Sprite 10
#define enemy3_right_walking_pattern 22*4 //Sprite 11
#define enemy3_left_pattern 23*4 //Sprite 12
#define enemy3_left_walking_pattern 24*4 //Sprite 13
#define enemy3_up_pattern 25*4 //Sprite 13
#define enemy3_up_walking_pattern 26*4 //Sprite 13
//Enemy 2
//Objects
#define object_money_pattern 27*4 //Sprite 14
#define object_any_pattern 29*4 //Sprite 14



//Tiles
#define tile_empty 255 // vacio
//Objects
#define tile_phone1 160 // telefono
#define tile_phone2 161 // telefono
#define tile_end_level1 164 // La puerta cerrada
#define tile_end_level2 165 // La puerta cerrada
//Solids
#define tile_stairs1 192 // escalera
#define tile_stairs2 193 // escalera
//#define tile_door_left 228 // muro que te deja pasar a la izquierda
//#define tile_door_right 229 // escalera
#define tile_floor_tile 224 //suelo >224
#define tile_wall 226 //suelo >224
#define tile_desabled_divan 168 //suelo >224
#define tile_fire 200
#define tile_fire2 201
#define tile_disposable1 249
#define tile_disposable2 250
#define tile_swipe_left 245
#define tile_swipe_right 246

typedef struct TGame TGame;
struct TGame{
    char level;
    char lives;
};

typedef struct TEntity TEntity;
struct TEntity{
    unsigned char type;
    unsigned char cmp;
    signed int x,y;
    unsigned char old_x,old_y;
    unsigned char w,h;
    signed char vx,vy;
    unsigned char dir;
    unsigned char andando;
    unsigned char jump;
    unsigned char plane;
    unsigned int points;
    int lives;
    unsigned char collider;
};
typedef struct TTile TTile;
/*struct TTile{
    unsigned char x;
    unsigned char y;
};*/

#define MAX_enemies 4
#define MAX_shots 1
#define MAX_objects 5 //son 3 monedas y 2 divanes
TEntity array_structs_enemies[MAX_enemies];
TEntity array_structs_shots[MAX_shots];
TEntity array_structs_objects[MAX_objects];
char num_enemies;
char num_shots;
char num_objects;



//Functions
void sys_entities_init();
TGame* sys_entity_create_game();
TEntity* sys_entity_create_player();
TEntity* sys_entity_create_enemy1();
TEntity* sys_entity_create_shot();
TEntity* sys_entity_create_object();
void sys_entity_erase_enemy(char i);
void sys_entity_erase_all_enemies();
void sys_entity_erase_shot(char i);
void sys_entity_erase_object(char i);
void sys_entity_erase_all_objects();
TEntity* sys_entity_get_array_structs_enemies();
TEntity* sys_entity_get_array_structs_fires();
TEntity* sys_entity_get_array_structs_objects();
char sys_entity_get_num_enemies();
char sys_entity_get_num_shots();
char sys_entity_get_num_objects();
char sys_entity_get_max_enemies();
char sys_entity_get_max_shots();
char sys_entity_get_max_objects();



//===================================End declarations






//=======================================Definitions
TGame game_template={
    0, //level
    0 //Lives
};


const TEntity player_template={
    entity_type_player, // Type
    entity_cmp_movable | entity_cmp_render | entity_cmp_input, //Components 
    0,0,            //x,y  ,se lo asignamos en el game.c
    8*1,8*16,           //old position
    8,16,             //width, heigh
    4,4,                 //speed X,speed Y 
    3,                   //direction
    0,                   //is it jumpimg?
    0,                   //is it colliding?
    player_plane,        //plano, inutilizado
    0,                   //Points, puntuación
    5,                  //Lives, vidas
    0                   //is it on collider?
};
const TEntity object_template={
    entity_type_object_money, // Type1= el enemigo se cae si encuantra un agujero y rebota con bloque sólido
    entity_cmp_movable | entity_cmp_render, //Components 
    0,0,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    0,0,           //old position
    16,16,             //width, heigh
    0,0,                //speed X,speed Y 
    0,                  //direction
    0,                  //is it jumpimg?
    0,                  //is it colliding?
    object_plane,       //plano,  inutilizado
    0,                  //points, lives
    0,                 //lives, vidas
    0                 //collider
};
const TEntity enemy1_template={
    entity_type_enemy1, // Type1= el enemigo se cae si encuantra un agujero y rebota con bloque sólido
    entity_cmp_movable | entity_cmp_render, //Components 
    0,0,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    0,0,           //old position
    6,16,             //width, heigh
    2,2,                //speed X,speed Y 
    3,                  //direction
    0,                  //is it jumpimg?
    0,                  //is it colliding?
    enemy1_plane,       //plano,  inutilizado
    0,                  //points, puntos
    10,                 //lives
    0                //collider
};

const TEntity shot_template={
    entity_type_shot, // Type1= el enemigo se cae si encuantra un agujero y rebota con bloque sólido
    entity_cmp_movable | entity_cmp_render, //Components 
    0,0,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    0,0,           //old position
    8,2,             //width, heigh
    8,8,                //speed X,speed Y 
    3,                  //direction
    0,                  //is it jumpimg?
    0,                  //is it colliding?
    shot_plane,                  //plano,  inutilizado
    0,                  //points
    4,                 //lives
    0                 //collider
};




//Life cicle
void sys_entities_init(){
    //Ponemos a 0 todos los valores del array de estructuras
    //void * memset ( void * ptr, int value, size_t num );
    memset(array_structs_enemies,0,sizeof(array_structs_enemies) );
    memset(array_structs_objects,0,sizeof(array_structs_objects) );
    memset(array_structs_shots,0,sizeof(array_structs_shots) );

    num_enemies=0;
    num_objects=0;
    num_shots=0;
}
TGame* sys_entity_create_game(){
    return &game_template;
} 


TEntity* sys_entity_create_player(){
    return &player_template;
}
TEntity* sys_entity_create_enemy1(){
    TEntity* enemy=&array_structs_enemies[num_enemies];
    memcpy(enemy,&enemy1_template,sizeof(enemy1_template));
    ++num_enemies;
    return enemy;
}  

TEntity* sys_entity_create_shot(){
    TEntity* shot=&array_structs_shots[num_shots]; 
    memcpy(shot,&shot_template,sizeof(shot_template));
    ++num_shots;
    return shot;
}  

TEntity* sys_entity_create_object(){
    TEntity* object=&array_structs_objects[num_objects];
    memcpy(object,&object_template,sizeof(TEntity));
    ++num_objects;
    return object;
}  

void sys_entity_erase_enemy(char i){ 
   --num_enemies;
   TEntity *enemy=&array_structs_enemies[i];
   PutSprite(enemy->plane , player_Jump_right_pattern, 0,212,0 );
   //array_structs_enemies[i]=array_structs_enemies[num_enemies];
   memcpy(&array_structs_enemies[i],&array_structs_enemies[num_enemies],sizeof(TEntity));
}
void sys_entity_erase_all_enemies(){
  for (char i=0;i<sys_entity_get_num_enemies();++i){
     sys_entity_erase_enemy(i);
  }
  num_enemies=0;
}

void sys_entity_erase_shot(char i){
    --num_shots;
    TEntity *shot=&array_structs_shots[i];
    PutSprite(shot->plane, shot_pattern, 0,212,0 );
    memcpy(&array_structs_shots[i],&array_structs_shots[num_shots],sizeof(TEntity));
}

void sys_entity_erase_object(char i){
    --num_objects;
    TEntity *object=&array_structs_objects[i];
    PutSprite(object->plane, object_money_pattern, 0,212,0 );
    memcpy(&array_structs_objects[i],&array_structs_objects[num_objects],sizeof(TEntity));
}
void sys_entity_erase_all_objects(){
    for (char i=0;i<sys_entity_get_num_objects();++i){
        sys_entity_erase_object(i);
    }
    num_objects=0;
}  
//End life cicle

//Geters & setters
TEntity* sys_entity_get_array_structs_enemies(){
    return array_structs_enemies;
}

TEntity* sys_entity_get_array_structs_shots(){
    return array_structs_shots;
}

TEntity* sys_entity_get_array_structs_objects(){
    return array_structs_objects;
}


char sys_entity_get_num_enemies(){
    return num_enemies;
}

char sys_entity_get_num_shots(){
    return num_shots;
}

char sys_entity_get_num_objects(){
    return num_objects;
}


char sys_entity_get_max_enemies(){
    return MAX_enemies;
}

char sys_entity_get_max_shot(){
    return MAX_shots;
}

char sys_entity_get_max_objects(){
    return MAX_objects;
}
//End getters & setters









