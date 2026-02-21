//#pragma once
//#include "../fusion-c/header/msx_fusion.h"
//#include "src/entities/enemies.c"

/*TEnemy *enemy1=&array_structs_enemigos[0];
TEnemy *enemy2=&array_structs_enemigos[1];
TEnemy *enemy3=&array_structs_enemigos[2];
TEnemy *enemy4=&array_structs_enemigos[3];
*/
TFire *fire1=&array_structs_fires[0];
TFire *fire2=&array_structs_fires[1];
TFire *fire3=&array_structs_fires[2];
TFire *fire4=&array_structs_fires[3];
void debug(){
    
    BoxFill(0,0,255,40,1,8);


    TPlayer *player1=&array_structs_players[0];
 

    PutText(0,0,Itoa(player1->plane,"      ",10),8);
    PutText(20,0,Itoa(player1->x,"      ",10),8);
    PutText(40,0,Itoa(player1->y,"      ",10),8);
    PutText(100,0,Itoa(num_players,"      ",10),8);
    

   


    /*
    PutText(0,0,Itoa(enemy1->plane,"      ",10),8);
    PutText(30,0,Itoa(enemy1->pattern,"      ",10),8);
    PutText(60,0,Itoa(enemy1->active,"      ",10),8);
    PutText(90,0,Itoa(enemy1->x,"      ",10),8);
    PutText(120,0,Itoa(enemy1->y,"      ",10),8);
    PutText(180,0,Itoa(count_enemies_actives,"      ",10),8);
    PutText(210,0,Itoa(count_enemies_planes,"      ",10),8);

   
   PutText(0,10,Itoa(enemy2->plane,"      ",10),8);
    PutText(30,10,Itoa(enemy2->pattern,"      ",10),8);
    PutText(60,10,Itoa(enemy2->active,"      ",10),8);
    PutText(90,10,Itoa(enemy2->x,"      ",10),8);
    PutText(120,10,Itoa(enemy2->y,"      ",10),8);


    PutText(0,20,Itoa(enemy3->plane,"      ",10),8);
    PutText(30,20,Itoa(enemy3->pattern,"      ",10),8);
    PutText(60,20,Itoa(enemy3->active,"      ",10),8);
    PutText(90,20,Itoa(enemy3->x,"      ",10),8);
    PutText(120,20,Itoa(enemy3->y,"      ",10),8);


    PutText(0,30,Itoa(enemy4->plane,"      ",10),8);
    PutText(30,30,Itoa(enemy4->pattern,"      ",10),8);
    PutText(60,30,Itoa(enemy4->active,"      ",10),8);
    PutText(90,30,Itoa(enemy4->x,"      ",10),8);
    PutText(120,30,Itoa(enemy4->y,"      ",10),8);
    */
  



    /*PutText(0,0,Itoa(fire1->plane,"      ",10),8);
    PutText(30,0,Itoa(fire1->pattern,"      ",10),8);
    PutText(60,0,Itoa(fire1->x,"      ",10),8);*/
    //PutText(90,0,Itoa(fire1->y,"      ",10),8);
    /*PutText(180,0,Itoa(count_fire_active,"      ",10),8);
    PutText(220,0,Itoa(count_fire_planes,"      ",10),8);

    PutText(0,10,Itoa(fire2->plane,"      ",10),8);
    PutText(30,10,Itoa(fire2->pattern,"      ",10),8);*/
    //PutText(60,10,Itoa(fire2->x,"      ",10),8);
    /*PutText(90,10,Itoa(fire2->y,"      ",10),8);

    PutText(0,20,Itoa(fire3->plane,"      ",10),8);
    PutText(30,20,Itoa(fire3->pattern,"      ",10),8);*/
    //PutText(60,20,Itoa(fire3->x,"      ",10),8);
    /*PutText(90,20,Itoa(fire3->y,"      ",10),8);*/

    
}

void showTime(){
    BoxFill(0,0,255,40,1,8);
    PutText(0,0,Itoa(column,"      ",10),8);
}
