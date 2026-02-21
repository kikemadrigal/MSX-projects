/**************DECLARACIONES************/
#ifndef __PLAYER_H__
#define __PLAYER_H__
//INCLUDES


//VARIABLES (los arrays y primitos deben de ser ya inicializados)
//unsigned char px=10,py=212/2,pplano=0,psprite=0,pcolor=6,pvelocidad=4,penergia=100;
typedef struct {
    char player_id;
    signed int x,y;
    char w,h;
    char plane;
    char sprite;
    char color;
    char velocity;
    signed char lives; //El signo es para que cuando sea -1 haga game_over
    char is_killable; //Se muede matar o no
    char time_to_put_killable; ////tiempo que se le da para el tiempo de isKallable
    char is_active;
    int score;
    char enable_shot;
} TPlayer;

//FUNCIONES
void inicilizar_players();
TPlayer* crear_player(char *colorBuffer);
char num_players;
signed char num_active_players;
void render_player(TPlayer *player);
void delete_player(TPlayer *player);
#endif
/***********FINAL DE DECLARACIONES************/



/**************DEFINICIONES************/
TPlayer player_template={
    1, //player_id
    10,106, //x,y
    16,16,//w,h
    0, //plano
    0, //pattern
    6, //color
    4, //velocidad
    9, //vidas
    1, //isKillable
    1, //tiempo que se le da para el tiempo de isKallable
    1, //está activo (no lo han matado con menos de 1 vida)
    0, //puntuación
    1 //disparo habilitado
};
TPlayer array_structs_players[4];
//TPlayer* player1=&array_structs_players[1];
//TPlayer* player2=&array_structs_players[0];

void inicilizar_players(){
    num_players=0;
    num_active_players=0;
}

TPlayer* crear_player(char *colorBuffer){
    TPlayer* player=&array_structs_players[num_players];
    memcpy(player,&player_template,sizeof(player_template));
    player->player_id=num_players;
    player->plane=player->player_id;
    player->sprite=(player->player_id*2)*4;
    player->y=106+(20*num_players);
    SC5SpriteColors(player->plane, &colorBuffer[(player->sprite/4)*16]);
    num_players++;
    num_active_players++;
    return player;
}

void render_player(TPlayer *player){
    //Plano, ptron, x, y, color
    if(player->is_active==0)return;


    PutSprite( player->plane, player->sprite, player->x,player->y, 0 );
    PutSprite( player->plane+1, player->sprite+4, player->x,player->y, 0 );
        //Este bloque es un efecto que hace que no puedan matar al player durante los primeros 5 segundos
    if(player->is_killable==0) {
        if(player->time_to_put_killable<100){
            player->time_to_put_killable++;
            if(player->time_to_put_killable%2==0) PutSprite(player->plane,player->sprite, 255,240,0 );
        }else{
            //Ponemos el tiempo a cero
            player->time_to_put_killable=0;
            player->is_killable=1;
        }
    }
}


void delete_player(TPlayer *player){
    if(player->is_killable==1){
        //FreeFX();
        //efecto cambio color borde a rojo 
        SetBorderColor(6);
        player->x=0;
        player->y=212/2;
        player->lives--;
        player->is_killable=0;
        if(player->lives<=0){
            player->is_active=0;
            num_active_players--;
            PutSprite(player->plane , player->sprite, 255,240,0 );
        }
        //pequeña pausa
        for(long i=0;i<5000;i++){UpdateFX();};
        SetBorderColor(1);
    }
}