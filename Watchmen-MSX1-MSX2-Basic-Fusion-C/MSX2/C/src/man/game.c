#pragma once
#include "../../fusion-c/header/msx_fusion.h"
//Para la función de setSpritePatter y SC5ColorSprite
#include "../../fusion-c/header/vdp_sprites.h"
#include "../../fusion-c/header/pt3replayer.h"
#include "../../fusion-c/header/ayfx_player.h"
#include "../../src/man/entity.c"
#include "../../src/sys/physics.c"
#include "../../src/sys/render.c"
#include "../../src/sys/collider.c"
#include "../../src/sys/ai.c"
#include "../../src/man/files.c"






void man_game_init();
void man_game_play();
void man_game_update();
void man_game_pintarMapa();
//char man_actualizar_tiles();
//void man_game_showBuffer();
void man_game_copy_sprites_definition_to_VRAM();
void man_game_copy_color_sprite_to_VRAM();
void man_game_cargar_buffer_musica();
void man_game_cargar_buffer_efectos_sonido();
void man_game_reproducir_musica_y_efectos();
void man_game_reproducir_efecto_sonido(char effect);
void player_die();
void show_menu_screen();
char sys_entity_get_num_moneys();
void saveLevel();

void wait();
void debug();
void pintar_HUD();
//Efectos
#define SONG_EFFECT_TAM 1207
unsigned char songEffectsBuffer[SONG_EFFECT_TAM]; 
char fileNameSongEffects[]={"effects.afb"};
FCB TFileEffects; 

//Music
#define SONG_BUFFER_TAM 264
unsigned char songBuffer[SONG_BUFFER_TAM];  
char fileNameSong[]={"song1.pt3"};
FCB TFileMusic;


TGame* game;
char game_over;
char gameRecovery;

TEntity* player;
char actual_world;
char world_change;
char enabled_world_change;
char world_money;
char created_enemy2;
//char world_enemy_to_capture;
unsigned int time;
unsigned int count_down;
unsigned int hours,minutes,secunds;
unsigned int memory_space;
unsigned int destiny_x_door;
unsigned int destiny_y_door;
unsigned int destiny_x_phone;
unsigned int destiny_y_phone; 
char collision_divan;
//char permitirPintarTiles;

TEntity* array_enemies;
TEntity* array_objects;
TEntity* array_shots;




void man_game_init(){
    //permitirPintarTiles=1;
    //Encendemos la pantalla que estaba desactiavda desde basic
    ShowDisplay();
    //
    sys_entities_init();
    //Inicializamos la pantalla en screen 5
    sys_render_init();
    //Cargamos la imagen de carga del archivo a la RAM
    //char *image_loader_name[]={"LOADER.S05"};
    load_file_into_buffer_with_structure("MSXSP.S05");
    //Pasamos los datos de la RAM a la VRAM page 0
    HMMC(&buffer[0], 0,0,256,212 ); 
    for(int i=0;i<100;i++){
        wait();
    }
    load_file_into_buffer_with_structure("LOADER.S05");
    //Pasamos los datos de la RAM a la VRAM page 0
    HMMC(&buffer[0], 0,0,256,212 ); 
    //memset(buffer,0,sizeof(buffer));
    //El juego solo tendrá un archivo de tileset con todos los gametiles
    load_file_into_buffer("tileset.s05");
    //Pasamos todos los tileset a la page 1, fijate:
    // 1. que hemos puesto en inicio y: 256.
    // 2. Hemos utilizado LMMC que nos permite introducir la transparencia
    HMMC(&buffer[0], 0,256,256,212); 
    //Los pasamos los psrites a la VRAM
    man_game_copy_sprites_definition_to_VRAM();
    man_game_copy_color_sprite_to_VRAM();
    //Cargamos los efectos de sonido  
    InitPSG(); 
    InitFX();
    man_game_cargar_buffer_efectos_sonido();
    //Cargamos la música
    man_game_cargar_buffer_musica();
    //load_file_into_buffer_with_structure("song1.pt3");
    PT3Init (songBuffer+99, 0);
    //Le quitamos el sonido a las pulsaciones	
    KeySound(0);
    //creamos al player
    player=sys_entity_create_player();
    //Obtenemos las referencias de los arrays globales
    array_enemies=sys_entity_get_array_structs_enemies();
    array_objects=sys_entity_get_array_structs_objects();
    array_shots=sys_entity_get_array_structs_shots();
    //le decimos que no hemos creado el 2 enemigo hasta que el tiempo sea menor que 100
    created_enemy2=0; 
    //Comprobamos si hay datos guardados en el disco
    checkPreferences();
    game=sys_entity_create_game();
    gameRecovery=0;
}

void man_game_play(){
    while(1){
        /*
        unsigned int prev_count=0;
        InitInterruptHandler();
        SetInterruptHandler( man_actualizar_tiles );
        */

        show_menu_screen();

        while(game_over==0 && player->lives>0){
            if( IsVsync() == 1 ) continue;
            //Game
            man_game_update();
            //Musica y efectos
            man_game_reproducir_musica_y_efectos();
            //Player
            sys_physics_update(player);
            sys_render_update(player);

            //BoxFill (player->x, player->y, player->x+8, player->y+8, 6, LOGICAL_IMP );

            //Enemigos
            for (char i=0;i<sys_entity_get_num_enemies();++i){
                TEntity *enemy=&array_enemies[i];
                //Le aplicamos un comportamiento a los enemigos según el tipo de enemigo que sea
                sys_ai_update(enemy);
                sys_render_update(enemy);
                if (sys_collider_entity1_collider_entity(player, enemy) && player->collider==0){
                    if(player->dir==3 && enemy->dir==3 || player->dir==7 && enemy->dir==7) {
                        man_game_reproducir_efecto_sonido(4);
                        sys_entity_erase_enemy(i);
                        pintar_HUD();
                        if(enemy->type==entity_type_enemy2) created_enemy2=0;
                    }
                    else player_die();
                }
                //Rollo disparos
                if(enemy->dir==7 && player->x < enemy->x || enemy->dir==3 && player->x > enemy->x){
                    if(sys_entity_get_num_shots()==0 && player->collider==0 && player->y<enemy->y+16 && player->y>=enemy->y ){
                        man_game_reproducir_efecto_sonido(3);
                        TEntity *shot=sys_entity_create_shot();
                        if(enemy->dir==3)shot->x=enemy->x+20;
                        else shot->x=enemy->x-20;
                        shot->y=enemy->y+8;
                        shot->dir=enemy->dir;
                        shot->plane+=sys_entity_get_num_shots();
                    }
                }
            }
           
            //Shots
            for (char i=0;i<sys_entity_get_num_shots();++i){
                TEntity *shot=&array_shots[i];
                //shot->plane=shot_plane+sys_entity_get_num_shots();
                sys_physics_update(shot);
                //Colisión del disparo con el player
                if (sys_collider_entity1_collider_shot(player, shot)){
                    player_die();
                    sys_entity_erase_shot(i);
                }else{
                    sys_render_update(shot);
                    //Cuando se sale el disparo de la pantalla
                    if(shot->x<0 || shot->x>255) sys_entity_erase_shot(i); 
                }
            }
            


            
            //Objetos
            for (char i=0;i<sys_entity_get_num_objects();++i){
                TEntity *object=&array_objects[i];
                //Los objetos solo se pintan cuando se crean ya que son estáticos
                //Colisión de objetos con player
                    if (sys_collider_entity1_collider_entity(player, object)){
                        if(object->type==entity_type_object_divan1 || object->type==entity_type_object_divan2){
                            player->collider=1;    
                        }else{
                            player->collider=0;
                            man_game_reproducir_efecto_sonido(5);
                            player->points+=10;
                            world_money-=1;
                            sys_entity_erase_object(i);
                            pintar_HUD();
                        } 
                    }   
            }
            


            if (sys_entity_get_num_moneys()==0 && sys_entity_get_num_enemies()==0){
                //Esto es el parapdeo del teléfono que indica que hay que cogerlo
                //HMMM(posicion_x_en_tilset, posicion_y_en_tileset, posicion_x_n_escenario,posicion_y_n_escenario,ancho_a_copiar,alto_a_copiar)
                if (time % 3==0 && enabled_world_change==0)HMMM(0,256+(4*8),destiny_x_phone,destiny_y_phone,16,16);
                else HMMM(8*2,256+(4*8),destiny_x_phone,destiny_y_phone,16,16);
                if (sys_collider_get_tile_array(player)==tile_phone1 || sys_collider_get_tile_array(player)==tile_phone2){
                    enabled_world_change=1;
                }
                if (enabled_world_change==1){
                    //Pintamos la puerta abierta
                    HMMM(6*8,256+(3*8),destiny_x_door,destiny_y_door,16,24);
                    //Si el player colisiona con la puerta aumentamos el nuvel
                    if (sys_collider_get_tile_array(player)==tile_end_level1 || sys_collider_get_tile_array(player)==tile_end_level2 ){
                        //Con el world change hacemos que se creen los obejtos y nemigos correspodientes
                        world_change=1;
                        actual_world+=1;
                    }
                }
            }
            //Mostramos el temporizador
            time=RealTimer();
            count_down=99-(time/60);
            if(count_down % 99==0 && created_enemy2==0 && actual_world>3) {
                TEntity *enemy2=sys_entity_create_enemy1();
                enemy2->x=256/2;
                enemy2->y=16;

                if( actual_world>3 && actual_world<8){
                    enemy2->type=entity_type_enemy2;
                    enemy2->plane=enemy2_plane;
                } 
                if(actual_world>7 && actual_world<11){
                    enemy2->type=entity_type_enemy3;
                    enemy2->plane=enemy3_plane;
                }
                enemy2->plane+=sys_entity_get_num_enemies();
                enemy2->dir=3;
                
                created_enemy2=1;
                pintar_HUD();
            }

            
            /*
            if(count_down % 2==0 ) man_actualizar_tiles();
            else permitirPintarTiles=1;
            */
            



            if(count_down<=0) player_die();
            PutText(200,192,Itoa(count_down,"      ",10),0);
            //debug();

            //Pausa
            wait();
        }
    //EndInterruptHandler();
    }

}




void player_die(){
    //KillKeyBuffer();
    if(player->vy<0)player->vy*=-1;
    player->lives-=1;
    player->collider=0;
    player->jump=0;
    player->dir=3;
    man_game_reproducir_efecto_sonido(4);
    //saveLevel();
    //Ponemos el tiempo a cero
    SetRealTimer(0);
    //FreeFX();
    //Hacemos una pausa
    for (int i=0;i<30000;i++){
        man_game_reproducir_musica_y_efectos();
    };

    
    

    if(player->lives<=0){
        //saveLevel();
        game_over=1;
        SpriteOff();
    }
    world_change=1;
    pintar_HUD();  
    
}



char sys_entity_get_num_moneys(){
    return sys_entity_get_num_objects()-2;
}






void man_game_update(){
    if (world_change==1){
        /*
        char buffer[11]="level";
        //48=0 , 57=9
        buffer[4]=48;
        buffer[5]=50;
        buffer[6]='.';
        buffer[7]='b';
        buffer[8]='i';
        buffer[9]='n';
        buffer[10]='\0';
        */
        char *actual_world_string="";
        //TCoordinate_object player_coordinates;
        Cls();
        sys_entity_erase_all_objects();
        sys_entity_erase_all_enemies();
        //Si el mundo ha cambiado, creamos los enemigos del mundo correspondiente
        //Cargamos las coordenadas de los enemigos en el buffer
        load_file_into_buffer("e-coord.bin");
      
        for (int i=0;i<3*3;i+=3){ 
             char numWorld=actual_world*9;
             TEntity *enemy=sys_entity_create_enemy1();
             enemy->x=buffer[numWorld+i];
             enemy->y= buffer[numWorld+i+1];
             enemy->type= buffer[numWorld+i+2];
             enemy->plane+=sys_entity_get_num_enemies();
        }
        /*if(created_enemy2==1){
            TEntity *enemy2=sys_entity_create_enemy1();
            enemy2->x=256/2;
            enemy2->y=16;
            enemy2->type=entity_type_enemy2;
            enemy2->dir=3;
            enemy2->plane+=sys_entity_get_num_enemies();
        }*/
     
        //Creamos los objetos del mundo correspondiente
        //Son 3 datos(x,y,tipo por 5 obetos por mundo), 3 monedas y 2 dibanes
        load_file_into_buffer("o-coord.bin");
        for (int i=0; i<(3*5);i+=3){
            char numWorld=actual_world*15;
            TEntity *object=sys_entity_create_object();
            object->x=buffer[numWorld+i];//x
            object->y=buffer[numWorld+i+1];//y
            object->type=buffer[numWorld+i+2];//type
            object->plane+=sys_entity_get_num_objects()-1;   
            if( object->type==entity_type_object_divan1) object->plane=divan1_plane;
            if( object->type==entity_type_object_divan2) object->plane=divan2_plane;


            sys_render_update(object);
        }
        
        //Ponemos el player, la puerta y el teléfono en su sitio
        load_file_into_buffer("g-coord.bin");
        char numWorld=actual_world*6; //Son 6 bytes por mundo
        player->x=buffer[numWorld+0];
        player->y=buffer[numWorld+1];
        destiny_x_door=buffer[numWorld+2];
        destiny_y_door=buffer[numWorld+3];
        destiny_x_phone=buffer[numWorld+4];
        destiny_y_phone=buffer[numWorld+5];
    


        SpriteOff();

        //Seleccionamos el archivo a cargar el mapa
        
 
        switch (actual_world)
        {
            case 0:
                HMMM(0,72+256, 100,40,70,70);
                PutText(30,100,"Level 1: Dinosaur room\n",8);
                WaitKey();
                actual_world_string="level0.bin";
                break;
            case 1:
                actual_world_string="level1.bin";
                break;
            case 2:
                actual_world_string="level2.bin";
                break;
            case 3:
                actual_world_string="level3.bin";
                break;
            case 4:
                HMMM(68,68+256, 100,40,40,70);
                PutText(30,120,"Level 2: Statues room",8);
                WaitKey();
                actual_world_string="level4.bin";
                break;
            case 5:
                actual_world_string="level5.bin";
                break;
            case 6:
                actual_world_string="level6.bin";
                break;
            case 7:
                actual_world_string="level7.bin";
                break;
            case 8:
                HMMM(110,68+256, 100,40,100,60);
                PutText(30,120,"Level 3: Science room",8);
                WaitKey();
                actual_world_string="level8.bin";
                break;
            case 9:
                actual_world_string="level9.bin";
                break;
            case 10:
                actual_world_string="level10.bin";
                break;
            case 11:
                game_over=1;
                SpriteOff();
                PutText(100,8,"Final",8);
                PutText(10,50,"You have protected the museum",8);
                HMMM(14*8,256+(16*8),8*8,12*8,144,48);
                //PutText(10,160,"Development: Kike Madrigal",8);
                //PutText(10,170,"Music: Kike Madrigal",8);
                //PutText(10,180,"Graphics: Kike Madrigal",8);
                //PutText(70,200,"Press space",8);
                while(Inkey()!=32){}
                break;
            default:
                actual_world_string="level11.bin";
                break;
        }
        
        if(game_over==0){
            //cargamos el mapa en un array, es decir en una posición de la memoria "Buffer"
            load_file_into_buffer_with_structure(actual_world_string);
            //Pintamos en la pantalla según los datas
            man_game_pintarMapa();
            //Mostramos los sprites (si los hemos desactivado antes)
            SpriteOn();
            //Ponemos esto para que no vuelva a pedir esta función
            world_change=0;
            //Esto deshabilita la puerta para cambiar de mundo hasta que no se cojan las mondas y se capturen los enemigos
            enabled_world_change=0;
            //Pintamos la puntuacón una vez que hemos creado el numEnmeies
            pintar_HUD();
            SpriteOn();
        }
        //Ponemos para que se ppueda crear el enemigo malo 
        created_enemy2=0;
    }
}










void man_game_pintarMapa(){
    unsigned int posicionX;
    char numeroColumnas=32;
    char numeroFilas=23;
    //char filaEnTileset=0;
    unsigned char posicionY;
    for (char f=0; f<numeroFilas;f++){
        for (char c=0; c<numeroColumnas;c++){
            //para tiles de 32*8 de ancho 23*8 de alto
            //posicionY=(((buffer[c+(f*numeroColumnas)]/32)+1)*32)-(buffer[c+(f*numeroColumnas)]);
            posicionY=(((buffer[c+(f*numeroColumnas)]/32)+1)*32)-(buffer[c+(f*numeroColumnas)]);
            posicionX=(32-posicionY)*8;
            HMMM(posicionX,(buffer[c+(f*numeroColumnas)]/32)*8+256, c*8,f*8,8,8);
        }
    }
}

/*char man_actualizar_tiles(){
    if(count_down % 2!=0 || permitirPintarTiles==0 ) return 0;
    unsigned int posicionX;
    char numeroColumnas=32;
    char numeroFilas=23;
    unsigned char posicionY;
    int position=0;
    char tile=0;
    for (char f=0; f<numeroFilas;f++){
        for (char c=0; c<numeroColumnas;c++){
            tile=buffer[position];
           if(tile==tile_fire || tile==tile_fire2 || tile==tile_swipe_left || tile==tile_swipe_left2){
                if(tile==tile_fire) buffer[position]=tile_fire2;
                else if(tile==tile_fire2) buffer[position]=tile_fire;
                else if(tile==tile_swipe_left) buffer[position]=tile_swipe_left2;
                else if(tile==tile_swipe_left2) buffer[position]=tile_swipe_left;
                posicionY=(((buffer[c+(f*numeroColumnas)]/32)+1)*32)-(buffer[c+(f*numeroColumnas)]);
                posicionX=(32-posicionY)*8;
                HMMM(posicionX,(buffer[c+(f*numeroColumnas)]/32)*8+256, c*8,f*8,8,8);
           }
           position++;
        }
    }
    permitirPintarTiles=0;
    return 1;
}*/

/*void man_game_showBuffer(){
    Cls();
    Screen(1);
    unsigned int dir=0;
    //printf("%d",&buffer[0]);
    //printf("\r\n");
    int numeroColumnas=32;
    int numeroFilas=6;
    int columnaEnTileset=0;
    for (int f=4; f<numeroFilas;f++){
        //printf("\r\nFila %d\r\n  ",f);
        for (int c=0; c<numeroColumnas;c++){
            columnaEnTileset=(((buffer[c+(f*numeroColumnas)]/32)+1)*32)-(buffer[c+(f*numeroColumnas)]);
            resultado=(32-columnaEnTileset)*8;
            //printf("%d ",((buffer[c+(f*numeroColumnas)]/32)+1)*32);
            
        } 
    }
}*/
void man_game_copy_sprites_definition_to_VRAM(){
    load_file_into_buffer("sprites.bin");
	for (char i=0; i<total_patterns; i++) {		
		SetSpritePattern(i*4, &buffer[i*32],32);
        //También es posible cargar los sprites como datos, si antes hemos sacado
        // los datos del spritedevtool, habilita el include
		//SetSpritePattern(sprite, &SPRITE_DATA[siguiente],32);
	}
    //Screen(1);
    //printf("%d", &buffer[0]);
	//Tablas patrones	
    //CopyRamToVram (&tab_sprites_from_fichero[0], dirBaseTablaSpritesPatrones, TAM_SpritesPatrones);
}
void man_game_copy_color_sprite_to_VRAM(){
    load_file_into_buffer("sprcol.bin");
    //Del sprite 0 al 7 le ponemos el color del player
    //Los demás colores serán asignados en tiempo de ejecución
    /*for (char i=0; i<8; i++) {		
        SC5SpriteColors(i, &COLOR_DATA_PLAYER[0]);
    }*/

    for (char i=0; i<total_patterns; i++) {	
        SC5SpriteColors(i, &buffer[i*16]);
    }

}

void wait(){
    #ifdef __SDCC
        __asm
            halt
            halt
            halt
        __endasm;
    #endif
}
void man_game_cargar_buffer_musica(){
    enter_name_and_extension_in_structure( &TFileMusic, &fileNameSong[0]);
    fcb_open( &TFileMusic );
    fcb_read( &TFileMusic, &songBuffer[0], SONG_BUFFER_TAM );  
    fcb_close( &TFileMusic );
}
void man_game_reproducir_musica_y_efectos(){
    //Musica
    //DisableInterupt();
    //PT3Rout();
    //PT3Play();
    //Si se está reproduciendo un efecto se actualizará
    //2 es un Beep
    if (TestFX()==1){
      if (JIFFY!=0){
        JIFFY=0;
        UpdateFX();
      }
    }
    //EnableInterupt();
}

void man_game_cargar_buffer_efectos_sonido(){
   //afbdb es un puntero que está definido en ayfx_player.h
    afbdata=MMalloc(SONG_EFFECT_TAM);
    enter_name_and_extension_in_structure( &TFileEffects, "effects.afb");
    fcb_open( &TFileEffects );
    fcb_read( &TFileEffects, afbdata, SONG_EFFECT_TAM );  
    fcb_close( &TFileEffects );
}

void man_game_reproducir_efecto_sonido(char effect){
  //El 1 es un ruido flojo y corto
  // 2 dos ruidos cortos y flojos
  // 3 un rebote
  // 4 son 5 captanillas que van desapareciendo
  // 5 3 captanillas cortas
  // 6 rayo laser pistola
  // 7 laser que va desapareciendo
  // 8 explosión que va desapareciendo
  // 9 golpe con explosión
  // 10 una especie de robot
  //man_game_sincronizaFX(150);
  PlayFX(effect);
}

void debug(){
    TEntity *enemy3=&array_enemies[3];
    //TEntity *shot=&array_shots[0];
    TEntity *object2=&array_objects[2];
    TEntity *object3=&array_objects[3];
    TEntity *object4=&array_objects[4];
    BoxFill (0, 23*8, 256, 210, 6, LOGICAL_IMP );
    /*
    PutText(20,192,Itoa(enemy3->type," ",10),8);
    PutText(40,192,Itoa(enemy3->plane," ",10),8);
    PutText(80,192,Itoa(enemy3->dir," ",10),8);
    PutText(150,192,Itoa(sys_collider_get_tile_down_array(enemy3)," ",10),8);
    */
    PutText(20,192,Itoa(sys_collider_get_tile_down_array(player)," ",10),8);
    PutText(80,192,Itoa(sys_collider_get_tile_array(player)," ",10),8);
}

void pintar_HUD(){
    //Borramos todo el HUD
    BoxFill (0, 23*8, 256, 210, 0, LOGICAL_IMP );
    //Copiamos la casita
    HMMM(0,256+16,0,23*8,16,16);
    //Copiamos al personaje gris
    HMMM(2*8,256+16,5*8,23*8,16,16);
    //Copiamos el dibujo de puntuación
    //HMMM(4*8,256+(2*8),12*8,24*8,16,8);
    //Copiamos las monedas
    HMMM(3*8,256,19*8,23*8,16,16);
    //Copiamos la flecha de las monedas
    //HMMM(6*8,256+(2*8),21*8,24*8,8,8);

    PutText(20,192,Itoa(actual_world+1," ",10),8);
    PutText(60,192,Itoa(player->lives," ",10),8);
    //Dibujamos los capturados
    HMMM(8*8,256+(3*8),15*8,23*8,16,16);
    PutText(140,192,Itoa(sys_entity_get_num_enemies()," ",10),8);
    PutText(172,192,Itoa(sys_entity_get_num_moneys()," ",10),8);   
}

void show_menu_screen(){
    Cls();
    KillKeyBuffer();
    
    PutText(80,0, "The watchmen",0);
    PutText(0,16, "Eres un vigilante y como siempre estas durmiendo te han robado.",0);
    PutText(0,42, "Recoge las monedas que han ido perdiendo, atrapa a los ladrones por la espalda.",0);
    HMMM(160,256+32,8,76,16,16);
    PutText(40,76, "Escondete en los biombos",0);
    HMMM(64,256+48,8,96,16,8);
    PutText(40,96, "El fuego te mata",0);
    HMMM(200,256+56,8,116,16,8);
    PutText(40,116, "Este suelo se deshace",0);
    HMMM(168,256+56,8,136,16,8);
    PutText(40,136, "Esto te hace ir mas rapido o mas lento, tambien te puede    bloquear",0);

    //HMMM(14*8,256+(16*8),8*8,12*8,144,48);
    PutText(20,180, "Press any key to continue",0);
    WaitForKey();
    SpriteOn();
    //le ponemos que el mundo actual sea el 0
    if(gameRecovery==1)actual_world=game->level;
    else actual_world=0;
    //else actual_world=8;
    //Le ponemos que aplique que el mapa ha cambiado para que ponga
    // los objetos, enemigos y la posición del player del mundo correspondiente
    // Esto se aplica en el método man_game_update
    world_change=1;
    //Inicializamos la variable game_over
    game_over=0;
    player->lives=5;
}

void saveLevel(){
    /*Cls();

    PutText(10,100, "Deseas guardarla los avances? s/n",0);

    while(Inkey()!=115 && Inkey()!=83 && Inkey()!=110 && Inkey()!=78){
        if(Inkey()==115 || Inkey()==83 ){
            gameRecovery=1;
            game->level=actual_world;
            saveGame();
        }else if(Inkey()==110 || Inkey()==78){
            gameRecovery=0;
        }
    }*/
}