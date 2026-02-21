//
// MSX Murcia 2023
// @author:kikemadrigal
// 
/*
*1 star game
*2 die
*3 game over
*4 change level
*5 fire player
*6 fire enemy
*7 colisiones
*/
/**************DECLARACIONES************/

#include "fusion-c/header/msx_fusion.h"
//Para los sprites de todas las entidades
#include "fusion-c/header/vdp_sprites.h"
//Para el HMMC de pantalla.c
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/io.h"
#include "fusion-c/header/ayfx_player.h"
// Para el memset de pantalla.c, ver http://cplusplus.com/reference/cstring/
#include <string.h>
//itoa, ver http://cplusplus.com/reference/cstdlib/itoa/?kw=itoa
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>

//#include "src/sprites.c"
#include "src/entities/utils.c"
#include "src/entities/player.c"
#include "src/entities/fire.c"
#include "src/entities/enemies.c"
//#include "src/debug.c"

//información del juego, Graphics User interface, también llamado HUD 
void gui(void);
void pintar_marco_gui();
// Consiguración del VDP
void inicializar_sprites();
//Input system
void procesar_entrada(TPlayer *player);
//Colision system
void check_colision();
//Colisiones
char sys_collider_player_collider_enemy(TPlayer *entity1, TEnemy *entity2);
char sys_collider_fire_collider_enemy(TEnemy *entity2,TFire *entity1);
char sys_collider_player_collider_fire(TPlayer *entity1, TFire *entity2);
//Para ir poniendo los sprites de los players del 1 al 4
void asignar_sprites(TPlayer *player, char group);
//Para reproducir los efectos
void FT_CheckFX (void);
void wait_for_space_key(void);

int time;
int counter;
int old_counter;
char* colorBuffer;
char offset_ship;
char fire_ship;
char score;
char offset_tanks;
char level;
char next_level;
char game_over;
char select_num_players;
//variable para seleccionar un número de players en el menú principal
char k=0;
//para las explosiones
char x_explison;
char y_explison;
char enable_explosion;
char create_boss;
char showing_boss;
char total_energy_boss, boss_x,boss_y,boss_w, boss_h,boss_vY,boss_vX;
//Para mostrar estrellas en moviemiento
/*typedef struct {
  signed int x,y;
  signed char old_x; 
} TStar;
TStar array_stars[10];*/

/*********FIN DE LAS DECLARACIONES************/











/*********DEFINICIONES************************/
void main(void){
  //Ponemos a 0 todos los bytes de la page 0 de la VRAM
  //FillVram(0,0,65535); 
  SetColors(15,1,1);
  Screen(5);   
  SetColors(15,1,1);
  PutText(60,100,"Loading...",8);
  //Le quitamos el sonido a las pulsaciones	
  KeySound(0);
  load_into_buffer("tileset.sc5");
  deRamAVramPage1();
  //Configuramos los parámteros de los sprites en el VDP
  inicializar_sprites();
  //Cargamos los sprites en VRAM
  SpriteOff();
  copy_sprites_definition_to_VRAM();
  copy_color_sprite_to_VRAM();
  SetAdjust(-7,0);
  colorBuffer= create_sprite_color_buffer();  
  //Cargamos los efectos de sonido  
  InitPSG(); 
  InitFX();
  load_buffer_sound_effects();
  //inicializamos el array de estrellas que después moveremos
  /*for (char w=0; w<10; w++) {
    TStar *star=&array_stars[w];
    star->x=generar_numero_aleatorio(0,240);
    star->y=generar_numero_aleatorio(90,150);
    star->old_x=star->x+1;
  }*/
game_over:
  Cls();
  eliminar_todos_los_enemigos();
  offset_ship=0;
  offset_tanks=0;
  old_counter=0;
  fire_ship=4;
  level=0;
  next_level=0;
  game_over=0;
  k=0;
  enable_explosion=0;
  create_boss=0;
  boss_vY=1;
  boss_vX=1;
  /*******Pantalla de biendenida y salón de la fama****/
  //Copiamos la imagen que aparece en el menu principal
  HMMM(0,256+156,60,20,128,64);
  PutText(60,100,"Space police Kirk",8);
  PutText(0,150,"Type the number of players",8);
  PutText(60,170,"1 to 4 players",8);



  inicilizar_players();
  signed int rotulo=0;
  //k!=97 && k!=98
  while(k!=49 && k!=50 && k!=51 && k!=52){
    if(rotulo>=255)rotulo=0;
    HMMM(72,256+64,rotulo,70,24,24);
    rotulo++;
    k=Inkey();
    FT_CheckFX();
    //PutText(0,0,Itoa(k,"  ",10),8);
    switch (k)
    {
      //El 1:
      case 49:
          select_num_players=1;
      break;
      //El 2:
      case 50:
          select_num_players=2;
      break;  
      //El 3:
      case 51:
          select_num_players=3; 
      break;  
      //El 4:
      case 52:
          select_num_players=4;
      break;  
    }

  }

  for(char se=0;se<select_num_players;se++){
    TPlayer *player=crear_player(&colorBuffer[0]);
  }
  Cls();
  set_level(level);
  /*************Fin pantalla de bienvenida**************/
  



  /******************PANTALLA 1**********************/
  go_next_level:
  next_level=0;
  showing_boss=0;
  total_energy_boss=0;
  inicializar_disparos();
  inicilizar_enemigos(); 
  //Mostramos la vida y puntuaciones
  gui();
  //hacemos un rectángulo rojo sin relleno
  BoxLine(0,0,240,31,6,8);
  //Iremos copiando los dibujos de los players en el marcador
  for(char s=0;s<num_players;s++){
    HMMM(s*16,256+(4*16), 26+(50*s),1,14,14);
  }

  poner_columna_negra(&colorBuffer[0], level);
  //Ponemos el tiempo a cero
  SetRealTimer(0);
  SpriteOn();
  //Reproducimos el sonido de empezar el juego
  PlayFX(1);  

  //Main loop 
  while(next_level==0 && game_over==0){
  //while(column<20 && game_over==0){
    //if( IsVsync() == 1 ) continue;

    //Actualizar música y efectos
    FT_CheckFX();
    if(column<254)recorrerBufferTileMapYPintarPage1EnPage0(level);
    else{
      if(count_enemies_planes==0 && showing_boss==0){
        create_boss=1;
        showing_boss=1;
      }
      /*************************BOSS******************/    
      if(create_boss==1){
        create_boss=0;
        Cls();
        pintar_marco_gui();
        PlayFX(3);
        //eliminar_todos_los_enemigos();
        boss_w=64;
        boss_h=40;
        boss_x=100;
        boss_y=100;
        for(char i=0;i<4;i++){
          crear_enemigos(&bufferSpritesColor[0],2,0);
        }
      }
      if(count_enemies_planes==0){
        showing_boss=0;
        next_level=1;
      }
    } 

    if(showing_boss==1) {
      total_energy_boss=0;
      for(char i=0;i<4;i++){
        TEnemy *enemy=&array_structs_enemigos[i];
        total_energy_boss+=enemy->active;
      }
      if(boss_y>100|| boss_y<=20)boss_vY=-boss_vY;
      if(boss_x>140|| boss_x<=20)boss_vX=-boss_vX;
      boss_y-=boss_vY;
      boss_x-=boss_vX;
      for(char i=0;i<4;i++){
          TEnemy *enemy=&array_structs_enemigos[i];
          if(i==0){
              enemy->x=boss_x;
              enemy->y=boss_y;
          } if(i==1){
              enemy->x=boss_x+boss_w;
              enemy->y=boss_y;
          } if(i==2){
              enemy->x=boss_x+boss_w;
              enemy->y=boss_y+boss_h;
          } if(i==3){
              enemy->x=boss_x;
              enemy->y=boss_y+boss_h;
          }   
      }
      if(level==0)HMMM(0,256+88,boss_x,boss_x,boss_w,boss_h);
      if(level==1)HMMM(70,256+88,boss_x,boss_y,boss_w,boss_h);
      if(level==2)HMMM(142,256+88,boss_x,boss_x,boss_w,boss_h);
    }
    if(num_active_players<=0 )game_over=1;
    
    /********************FINAL BOSS***********************/

  for(char pl=0;pl<num_players;pl++){
    TPlayer *player=&array_structs_players[pl];
    procesar_entrada(player);
    render_player(player);  
  }

    
  /***********
   * Shots
  *************/
    for (int i=0; i<count_fire_planes; i++){
      TFire *fire=&array_structs_fires[i];
      update_fire(fire);
      PutSprite(fire->plane, fire->pattern, fire->x,fire->y, 0 );
      if( fire->x<0 || fire->x>224 || fire->y<0 || fire->y>255 ) eliminar_disparos(&colorBuffer[0],i);
      else{        
          for(char w=0;w<count_enemies_planes;w++){
            TEnemy *enemy=&array_structs_enemigos[w];
              if(sys_collider_fire_collider_enemy(enemy,fire)==1){
                if(fire->type==0){
                  if(enemy->active<=0){
                    enable_explosion=1;
                    x_explison=enemy->x;
                    y_explison=enemy->y;
                    eliminar_enemigos(&bufferSpritesColor[0],w);
                  }else{
                    enemy->active--;
                    if(showing_boss==1){
                      total_energy_boss--;
                    }
                  }
                  eliminar_disparos(&colorBuffer[0],i);
                  PlayFX(7);
                  gui();
                }
              }
          }
          for(char pl=0;pl<num_players;pl++){
            TPlayer *player=&array_structs_players[pl];
            if(sys_collider_player_collider_fire(player,fire)){
              eliminar_disparos(&colorBuffer[0],i);
              delete_player(player);
              PlayFX(7);
              gui();
            }
          }

      }

    }
  /***********
   *  Fin Disparos
  *************/




   /***********
   * Enemigos
  *************/
    for (int i=0; i<count_enemies_planes;i++){
      TEnemy *enemy=&array_structs_enemigos[i];
      //Actualizar posición enemigo
      if(enemy->x<0 || enemy->x>240  || enemy->y<0 || enemy->y>212) eliminar_enemigos(&bufferSpritesColor[0],i);
      else{
        update_enemy(enemy);
        //Render enemeigo
        PutSprite(enemy->plane,enemy->pattern,enemy->x,enemy->y,0);
        //Comprobar si hay colisión con los player
        for(char pl=0;pl<num_players;pl++){
            TPlayer *player=&array_structs_players[pl];
            if(sys_collider_player_collider_enemy(player, enemy)){
              enable_explosion=1;
              x_explison=enemy->x;
              y_explison=enemy->y;
              eliminar_enemigos(&bufferSpritesColor[0],i);
              delete_player(player);
              PlayFX(7);
              gui();
          }
        }
        

        //El enemigo dispara
        if(enemy->x>=120 && enemy->x<128 ||  enemy->x>=190 && enemy->x<200){
            TPlayer *player1=&array_structs_players[0];
            TFire *fire=crear_disparos(&bufferSpritesColor[0],fire_ship);
            fire->type=1;
            if(player1->x>enemy->x){
              fire->vx=-fire->vx;
              fire->x=enemy->x+20;
            }else
              fire->x=enemy->x-20;
              fire->y=enemy->y;
              //Mandaremos el disparo al primero que esté activo
              if(player1->y<enemy->y)fire->vy=-fire->vy;
              PlayFX(6);
        } 
    }
  }
  /***********
   * Fin Enemigos
  *************/


  /***********
    * Explosiones
  *************/
   if(enable_explosion>=1 && enable_explosion<10 ){
     PutSprite(26,14*4,x_explison,y_explison,0);
     enable_explosion++;
     SC5SpriteColors(26, &colorBuffer[(14/4)*16]);
   }else if(enable_explosion>=10 && enable_explosion<20 ){
     PutSprite(26,15*4,x_explison,y_explison,0);
     enable_explosion++;
   }else if(enable_explosion==20 && enable_explosion<30){
     PutSprite(26,16*4,x_explison,y_explison,0);
     enable_explosion++;
   }else{
      //PutSprite(26,17*4,x_explison,y_explison,0);
      PutSprite(26,17*4, 255,240,0 );
      enable_explosion=0;
   }


    /***********
    * Crear enemigos aleatoriamente
    *************/
    time=RealTimer();
    counter=time/60;

    //cada segundo se creará una nave aleatoria
    if(old_counter!=counter && counter%2==0 && showing_boss==0){
      if(offset_ship>9)offset_ship=0;
      TEnemy *enemy=crear_enemigos(&bufferSpritesColor[0],3,offset_ship++);
      //Fire_ship es una variable global que puede ir del 4 al 7 que son los posibles patterns que puede tener el disparo enemigo
      fire_ship=generar_numero_aleatorio(4,7);
      offset_tanks++;
      if(offset_tanks>4)offset_tanks=0;
      if(level==0){
        TEnemy *tank=crear_enemigos(&bufferSpritesColor[0],0,offset_tanks);
        tank->y+=generar_numero_aleatorio(0,12);
      }
      else if(level==1){
        TEnemy *tank=crear_enemigos(&bufferSpritesColor[0],1,offset_tanks);  
        tank->y+=generar_numero_aleatorio(0,12);  
      }
      else if(level==2){
        char tank_or_tower=0;
        if(offset_tanks%2==0)tank_or_tower=0;
        else tank_or_tower=1;
        TEnemy *tank_tower=crear_enemigos(&bufferSpritesColor[0],tank_or_tower,offset_tanks);
        tank_tower->y+=generar_numero_aleatorio(0,12);
      }
      old_counter=counter;
    }


    /***********
    * GUI tiempo
    *************/
    if(old_counter!=counter){
      //BoxFill(230,4,254,12,1,0);
      PutText(210,4,Itoa(256-column,"   ",10),8);
    } 
/*
  //movemos las estrellas
    if(modulo16%16==0){
      for (char i=0; i<10; i++) {
        TStar *star=&array_stars[i];
        if(star->x<=0) {
          Pset(star->x,star->y,1,0);
          star->x=240;
          star->y=generar_numero_aleatorio(100,150);
        }
        star->old_x=star->x;
        star->x--;
        //Pset dibuja un pixel con el color especificado
        Pset(star->old_x,star->y,1,0);
        Pset(star->x,star->y,15,0);
      }
    }
*/



    //debug();
  }//Final del while o mainloop
  eliminar_todos_los_enemigos();
  InitFX();

  if(game_over==1){
    PlayFX(2);
    SpriteOff();
    Cls();
    PutText(0,100,"Game over, press space to         continue",8);
    wait_for_space_key();
    goto game_over;
  }else{
    level++;
    if(level==3){
      PutText(100,80,"The end.",8);
      PlayFX(2);
      wait_for_space_key();
      goto game_over;
    }else{
      PlayFX(1);
      PutText(0,100,"Mission complete, press space to continue",8);
      wait_for_space_key();
      set_level(level);
      goto go_next_level;
    }
  }

 
}

void wait_for_space_key(){
  KillKeyBuffer();
  for(long q=0;q<60000;q++);
  while(Inkey()!=32){
      FT_CheckFX();
  }
}



void inicializar_sprites(){
  //Ponemos a 0 todos los sprites
  SpriteReset(); 
  // tamaño de sprites 16x16
  Sprite16(); 
  // tamaño de sprites sin ampliar   
  SpriteSmall(); 
  // Los datas del sprites los cargamos con SetSpritePattern, SC5SpriteColors y PutSprite que debería estar en el update
  SpriteOn();
}
 

//Sistema de input
void procesar_entrada(TPlayer *player){
  if(player->is_active==0) return;
  //Cada player leer n joyStick distinto
  for(char joy=0;joy<2;joy++){
    if(player->player_id==joy){
        // 0 son cursores teclado
        // 0=inactive  1=up 2=up & right 3=right 4=down & right 5=down 6=down & left 7=left 8=up & left 
        char key = JoystickRead(joy);
        switch (key)
        {
          //Movimiento arriba, ponemos el sprite girando
          case 1:
              player->y-=player->velocity;
              player->y-=player->velocity;
              asignar_sprites(player, 1); 
              break;
          //Movimiento hacia arriba derecha
          case 2:
              player->y-=player->velocity;
              player->x+=player->velocity;
              asignar_sprites(player, 1);    
            break;
          //Moviemiento hacia delante
          case 3:
              player->x+=player->velocity;
              asignar_sprites(player, 0);  
              break;
          case 4:
              player->y+=player->velocity;
              player->x+=player->velocity;
              asignar_sprites(player, 1);  
              break;
          case 5:
              player->y+=player->velocity;
              asignar_sprites(player, 1);  
              break;
          case 6:
              player->x-=player->velocity;
              player->y+=player->velocity;
              asignar_sprites(player, 1);  
              break;
          case 7:
              player->x-=player->velocity;
              asignar_sprites(player, 0);  
              break;
          case 8:
              player->x-=player->velocity;
              player->y-=player->velocity;
              asignar_sprites(player, 1);  
              break;
          default:
              break;
        } 
        //Leemos el disparo
        char trigger = TriggerRead(joy);
        if (trigger!=0) {
          if(player->enable_shot==1){
            TFire* fire_player=crear_disparos(&bufferSpritesColor[0],2);
            fire_player->x=player->x+20;
            fire_player->y=player->y+8;
            fire_player->player_id=player->player_id;
            //fire_player->vx=6;
            PlayFX(5);
            player->enable_shot=0;
          }
        }else{
          player->enable_shot=1;
        }
      }
  }
  //Manejo player con el teclado
  /*if(player->player_id==1){
    char key = Inkey();
    switch (key){
      case 'q':
        move_player_up=1;
        break;
      case 'a':
        move_player_down=1;
        break;
      case 'p':
        move_player_right=1;
        break;
      case 'o':
        move_player_left=1;
        break;
      default:
        move_player_up=0;
        move_player_down=0;
        move_player_right=0;
        move_player_left=0;
        break;
    }
  if(key=='m'){
      TFire* fire=crear_disparos(&bufferSpritesColor[0],2);
      fire->x=player->x+20;
      fire->y=player->y+8;
      PlayFX(7);
  }
    move_up(player);
    move_down(player);
    move_right(player);
    move_left(player);
  }*/





  if(player->x<=0)player->x+=player->velocity;
  if(player->x>=240)player->x-=player->velocity;
  if(player->y<=0)player->y+=player->velocity;
  if(player->y>=196)player->y-=player->velocity;
}

void asignar_sprites(TPlayer *player, char group){
  if(group==0){
    if(player->player_id==0)player->sprite=0*4;
    else if(player->player_id==1)player->sprite=2*4;
    else if(player->player_id==2)player->sprite=4*4;
    else if(player->player_id==3)player->sprite=6*4;    
  }else if(group==1){
    if(player->player_id==0)player->sprite=1*4;
    else if(player->player_id==1)player->sprite=3*4;
    else if(player->player_id==2)player->sprite=5*4;
    else if(player->player_id==3)player->sprite=7*4;  
  }
}

/*void move_up(TPlayer *player){
  if(move_player_up==1) player->y-=player->velocity;
}
void move_down(TPlayer *player){
  if(move_player_down==1)player->y+=player->velocity;
}
void move_right(TPlayer *player){
  if(move_player_right==1)player->x+=player->velocity;
}
void move_left(TPlayer *player){
  if(move_player_left==1)player->x-=player->velocity;
}*/


//Sistema de colisiones
void check_colision(){
  /********COLISION CON EL MAPA***********/
  /*
  //Point devuelve el color del pixel que se encuentra en x e y
  char color=0;
  //Colision superior
  color=Point(player1->x, player1->y);
  //Si el color es gris (el 14) o el color es amarillo(el 10)
  if (color!=1 && color!=0){
    Beep();
  }
  //Colision inferior
  color=Point(player1->x, player1->y+16);
  if (color!=1 && color!=0){
    Beep();
  }
  */
  /******FIN DE COLISION CON EL MAPA******/

  /********COLISION CON LOS SPRITES*******/
  /*
  char colision=SpriteCollision();
  if(SpriteCollision()==1){
    Beep();
    colisionX=SpriteCollisionX();
    colisionY=SpriteCollisionY();
    gui();
  }
  */
  /*******FIN DE COLOSION CON LOS SPRITES****/
  //Colision disparos con enemigos
  //sys_collider_entity1_collider_entity2();
}



char sys_collider_player_collider_enemy(TPlayer *entity1, TEnemy *entity2){
    if (entity2->x < entity1->x + entity1->w &&  entity2->x + entity2->w > entity1->x && entity2->y < entity1->y + entity1->h && entity2->h + entity2->y > entity1->y){
        return 1;
    }else{
        return 0;
    }
}
char sys_collider_player_collider_fire(TPlayer *entity1, TFire *entity2){
    if (entity2->x < entity1->x + entity1->w &&  
        entity2->x + entity2->w > entity1->x && 
        entity2->y < entity1->y + entity1->h && 
        entity2->h + entity2->y > entity1->y){
        return 1;
    }else{
        return 0;
    }
}

char sys_collider_fire_collider_enemy(TEnemy *entity2,TFire *entity1){
    if (entity2->x < entity1->x + entity1->w &&  entity2->x + entity2->w > entity1->x && entity2->y < entity1->y + entity1->h && entity2->h + entity2->y > entity1->y){
        return 1;

    }else{
        return 0;
    }
}


void pintar_marco_gui(){
  //hacemos un rectángulo rojo sin relleno
  BoxLine(0,0,240,31,6,8);
  //Iremos copiando los dibujos de los players en el marcador
  for(char s=0;s<num_players;s++){
    HMMM(s*16,256+(4*16), 26+(50*s),1,14,14);
  }
}


//HUD
void gui(){
  for(char i=0;i<num_players;i++){
    TPlayer *player=&array_structs_players[i];
    PutText(20+(50*i),20,Itoa(player->lives,"  ",10),8);
    PutText(40+(50*i),20,Itoa(player->score,"  ",10),8);
  }
  if(showing_boss==1)PutText(180,20,Itoa(total_energy_boss,"  ",10),8);
}




void FT_CheckFX (void)
{ 
    EnableInterupt();
    Halt();
    DisableInterupt();
    UpdateFX();
    EnableInterupt();
}














































