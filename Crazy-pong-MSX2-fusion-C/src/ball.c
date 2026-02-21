#pragma once
#include "fusion-c/header/msx_fusion.h"
//memcpy
#include <string.h>


typedef struct {
    signed int x,y;
    char w,h;
    signed char vX, vY;
    unsigned char plane;  //or sprite
    unsigned char pattern;
    unsigned char color;
}TBall;

const TBall ball_template={
    256/2,212/2,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    8,8,
    3,4,           //velocidadX, y
    5,             //plane or sprite
    0,             //pattern
    15
};
void inicialize_balls(void);
TBall* create_ball(void);
void update_ball(TBall* ball);
void delete_ball(int i);

TBall array_structs_balls[10];

char count_balls_planes;
int count_balls_actives;

void inicialize_balls(void){
  count_balls_planes=0;
  count_balls_actives=0;
}

TBall* create_ball(void){
  if(count_balls_planes>5){
    if(count_balls_planes==0){
      count_balls_actives=0;
      count_balls_planes=0;
    }
    return NULL; 
  }
  TBall* ball=&array_structs_balls[count_balls_planes];
  memcpy(ball,&ball_template,sizeof(ball_template));
  ball->plane+=count_balls_planes;
  ++count_balls_planes;
  ++count_balls_actives;
  return ball;
}

void update_ball(TBall* ball){
    ball->x+=ball->vX;
		ball->y+=ball->vY;
    if (ball->y>=210 || ball->y<5) ball->vY*=-1;
}

void delete_ball(int i){
  --count_balls_planes;  
  TBall *ball=&array_structs_balls[i];
  ball->x=0;
  ball->y=0;
  PutSprite(ball->plane , ball->pattern, 255,240,0 );
  TBall *lastBall=&array_structs_balls[count_balls_planes];
  memcpy(ball,lastBall,sizeof(TBall));      
}