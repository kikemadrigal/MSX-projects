/**************DECLARACIONES************/
#ifndef __FIRE_H__
#define __FIRE_H__

//INCLUDES

//VARIABLES Y ARRAYS
//char fireX=100, fireY=100, fireVelocidad=4, firePlano=6, fireSprite=4*6, fireColor=15;
typedef struct {
    unsigned char type;
    signed int x,y;
    unsigned char w,h;
    signed char vx,vy;
    unsigned char plane;
    unsigned char pattern;
    unsigned char active;
    char player_id;
}TFire;
const TFire fire_template={
    0,                //0 pertenece a player, 1 pertenece a enemigo
    50,50,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    16,16,             //width, heigh
    4,4,                //speed X,speed Y 
    5,                  //plane
    6*4,                //pattern   
    1,                   //Active
    0
};

//FUNCIONES
//void actualizar_disparos();
void inicializar_disparos();
TFire* crear_disparos(char* colorBuffer,char pattern);
void update_fire(TFire* fire);
void eliminar_disparos(char* colorBuffer,int i);
#endif
/***********FINAL DE DECLARACIONES*********/

/**************DEFINICIONES************/
//TFire fire_prueba={100,100,4,6,4*6,15};
TFire array_structs_fires[10];

char count_fire_planes;
int count_fire_active;

void inicializar_disparos(){
  count_fire_planes=0;
  count_fire_active=0;
}
TFire* crear_disparos(char* colorBuffer,char pattern){
  if(count_fire_planes>9){
    if(count_fire_planes==0){
      count_fire_active=0;
      count_fire_planes=0;
    }

    return NULL; 
  }
  TFire* fire=&array_structs_fires[count_fire_planes];
  memcpy(fire,&fire_template,sizeof(fire_template));
  char cont_pattern=(6*4)+(pattern*4);
  fire->pattern=cont_pattern;
  fire->plane+=count_fire_planes;

  ++count_fire_planes;
  ++count_fire_active;
  SC5SpriteColors(fire->plane, &colorBuffer[(fire->pattern/4)*16]);
  //if(numero_disparo>4)numero_disparo=0;
  return fire;
}
void update_fire(TFire* fire){
    //Di el disparo es del player (0) lo movemos a la derecha
    if(fire->type==0){
      fire->x+=8;
    }
    //Si es del enemigo
    else if(fire->type==1){
      fire->x-=fire->vx;
      fire->y+=fire->vy;      
    }

}


void eliminar_disparos(char* colorBuffer,int i){
  --count_fire_planes;  
  TFire *fire=&array_structs_fires[i];
  fire->x=0;
  fire->y=0;
  PutSprite(fire->plane , fire->pattern, 255,240,0 );
  TFire *lastFire=&array_structs_fires[count_fire_planes];
  //Conservamos el plano para asignarselo cuando corramos el ultimo
  //char plane=fire->plane;
  
  memcpy(fire,lastFire,sizeof(TFire));
  //array_structs_fires[i].plane=plane;
  SC5SpriteColors(fire->plane, &colorBuffer[(fire->pattern/4)*16]);
  //PutSprite(lastFire->plane , lastFire->pattern, 200,212,0 );
      
}

