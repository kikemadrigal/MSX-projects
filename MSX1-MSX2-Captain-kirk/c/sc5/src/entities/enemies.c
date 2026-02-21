/**************DECLARACIONES************/
#ifndef __ENEMIES_H__
#define __ENEMIES_H__
//INCLUDES

//VARIABLES Y ARRAYS
typedef struct {
    signed int x,y;
    unsigned char w;
    unsigned char h;
    unsigned char vX, vY;
    unsigned char direccion;
    unsigned char plane;
    unsigned char pattern;
    unsigned char color;
    unsigned char type;
    unsigned char active;
    unsigned char behavior;
    unsigned int array_position;
} TEnemy;
//El patron tiene que ser el mismo para los enemigos, el sprite es el que cambia
const TEnemy enemy_template={
    230,160,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    16,16,             //width, heigh
    2,2,                //speed X,speed Y 
    7,                  //direction
    15,                  //plane
    31*4,                //pattern
    3,                  //color
    2,                  //tipo
    0,                   //Activo
    0,                  //Comportamiento
    0                   //posición en array comportamientos
};

//FUNCIONES
void inicializar_enemigos();
//Como nostros vamos a gestionar la memoria 1 definimos el espacio y despues devolvemos un puntero a
// la posición del array donde está el struct
TEnemy* crear_enemigos(char * colorBuffer,char type,char pattern);
void update_enemy(TEnemy *enemy);
//void actualizar_enemigos();
void eliminar_enemigos(char* colorBuffer,char i);
TEnemy* sys_entity_get_array_structs_enemies();
char cont_pattern;



signed char pathsX[10][32]={
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},    //0
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8},                          //1.hace una media luna
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,0,0,0},             //2.viene por arriba, baja y desparece por la izquierda
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,0,0,0},             //3.Viene por abajo, sube y desaparece a laizquierda
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},    //4.hace una montaña
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},    //5. hace una V
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},          //6.En la mitad baja un poco
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8} ,         //7
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},    //8
  {-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8}                           //9
};
//-1 Arriba, +1 abajo
signed char pathsY[10][32]={
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},                                    //0
  {0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0},                                    //1.
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8},                                    //2.
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8,-8},                     //3.
  {0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,-8,-8,-8,-8,-8,-8,-8},                             //4.
  {8,8,8,8,8,8,-8,-8,-8,-8,-8,-8,8,8,8,8,8,8,8,-8,-8,-8,-8,-8,-8,-8,8,8,8,8,8,8},                       //5.
  {0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0},                                    //6.
  {8,8,8,8,8,8,-8,-8,-8,-8,-8,-8,8,8,8,8,8,8,8,-8,-8,-8,-8,-8,-8,-8,8,8,8,8,8,8},                       //7
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},                                    //8
  {0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,8,8,8,8,8,8,8,0,0,0,0,0,0,0,0,0,0}                                     //9
};
char positionPath1=0;
#endif
/***********FINAL DE DECLARACIONES************/

/**************DEFINICIONES****************/
//TEnemy enemigo_prueba={256,160,4,8,8*4,3,0};
TEnemy array_structs_enemigos[10];

char count_enemies_planes;
signed char count_enemies_actives;
void inicilizar_enemigos(){
    //Las variables globales tienen que ser inicializadas dentro de un método
    count_enemies_planes=0;
    count_enemies_actives=0;
}
//Los enemigos son los planos del 20 al 32, en cada plano tiene que meterse su color
TEnemy* crear_enemigos(char* colorBuffer,char type, char offset){
    if(count_enemies_actives>9){
        if(count_enemies_planes==0){
            count_enemies_actives=0;
            count_enemies_planes=0;
        }
        return NULL;
    }
    //if(count_enemies_actives==0)count_enemies_planes=0;
    TEnemy* enemy=&array_structs_enemigos[count_enemies_planes];
    memcpy(enemy,&enemy_template,sizeof(enemy_template));
    //enemy->plane+=count_enemies_planes;
    enemy->plane+=count_enemies_actives;
    //Los tanques son del 18 al 23 y los cañones o trres del techo del 24 al 29, las naves del 30 en adelante
    if(type==0){
         cont_pattern=(18*4)+(offset*4);
         enemy->type=0;
         enemy->y=180;
    //Si es de tipo 1 son las torres del techo
    }else if(type==1){
         cont_pattern=(24*4)+(offset*4);
         enemy->type=1;
         enemy->y=32;
    }else if(type==2){
        cont_pattern=(33*4)+(offset*4);  
        enemy->active=20;
    }else {
        cont_pattern=(30*4)+(offset*4);
        enemy->behavior=offset;
        enemy->y=generar_numero_aleatorio(50,180);
    }
    


    enemy->pattern=cont_pattern;
    //Metemos en el plano del enemy el color adecuado
    SC5SpriteColors(enemy->plane, &colorBuffer[(enemy->pattern/4)*16]);

    count_enemies_planes++;
    count_enemies_actives++;
    return enemy;
}
TEnemy* sys_entity_get_array_structs_enemies(){
    return array_structs_enemigos;
}
void update_enemy(TEnemy *enemy){
    if(enemy->type==0 || enemy->type==1){
        enemy->x-=enemy->vX;
    }else{
        signed int valueX=pathsX[enemy->behavior][enemy->array_position];
        signed int valueY=pathsY[enemy->behavior][enemy->array_position];
        enemy->x+=valueX;
        enemy->y+=valueY;
        if(enemy->array_position>sizeof(pathsX)-1)enemy->array_position=0;
        enemy->array_position++;
    }

}
void eliminar_enemigos(char* colorBuffer,char i){
    //Beep();
    TEnemy *enemy=&array_structs_enemigos[i];
    PutSprite(enemy->plane , enemy->pattern, 255,240,0 );
    count_enemies_planes--;  
    TEnemy *last_enemy=&array_structs_enemigos[count_enemies_planes];
    memcpy(enemy,last_enemy,sizeof(TEnemy));
    SC5SpriteColors(enemy->plane, &colorBuffer[(enemy->pattern/4)*16]);
}
void eliminar_todos_los_enemigos(){
  //poneos todos los sprites fuera de la pantalla
  for(char X=0; X<64;X++){
    PutSprite(X,0,0,240,0);
  }
}
