#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_sprites.h"
#include "fusion-c/header/vdp_graph2.h"
#include "src/ball.c"
#include "src/pad.c"
#include "src/sprites.c"
#include "src/files.c"
#include <stdlib.h>
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>
//memcpy
#include <string.h>


TBall *ball0;
			




// Function declarations
void game_init (void);
void game_play(void);
void DrawSprite(void);
void FT_Wait(int cicles);
void new_game(void);

void drawGUI(void);
char collider_pad_collider_ball(TBall *ball, TPad *pad);
void wait(void);


signed char DirY;						
char num_jugadores;
char PlyScore,player2_score,player3_score,player4_score,CpuScore;


int time;





void game_init (void)
{
	num_jugadores=0;
	PlyScore=0;
	player2_score=0;
	player3_score=0;
	player4_score=0;
	CpuScore=0;
	//Ponemos el tiempo a cero
  	SetRealTimer(0);
	SetColors(1,1,15);
	Screen(5);
	Sprite16();
	SpriteSmall(); 
	KeySound(0);
	SetColor(255);

	inicialize_balls();
	initialize_sprites();

	//Cargamos la imagen de carga del archivo a la RAM
	load_file_into_buffer_with_structure("loader.s05");
	//Pasamos los datos de la RAM a la VRAM page 0
    HMMC(&buffer[0], 0,0,256,212 ); 
	PutText(4,100,"Number of players: 1,2 or 4",0);
	char key=0;
	while (key!=49&&key!=50&&key!=52){
		key=Inkey();
		if(key==49)num_jugadores=1;
		else if(key==50)num_jugadores=2;
		else if(key==52)num_jugadores=4;
	}

	//Cargamos la imagen de carga del archivo a la RAM
    load_file_into_buffer_with_structure("level0.S05");
    //Pasamos los datos de la RAM a la VRAM page 0
    HMMC(&buffer[0], 0,0,256,212 ); 
	//pasamos tambien a la page 1 para el repintado
	HMMC(&buffer[0], 0,256,256,212 );
	game_play();
}
void game_play(void){
	new_game();

	while (Inkey()!=27) 			
	{
		input_system();
		DrawSprite();

		
		/***************************************
		 * 				Balls
		************************************** */
		for (int i=0; i<count_balls_planes; i++){
			TBall *ball=&array_structs_balls[i];
			update_ball(ball);
			// Check Ball Outside Game field
			if (ball->x<10)				// Player is on The Left Side
			{
				CpuScore++;
				delete_ball(i);		
				drawGUI();	
			}
			if (ball->x>250)
			{
				PlyScore++;
				delete_ball(i);
				drawGUI();	
			}

			if (collider_pad_collider_ball(ball, &CpuPad)){
				//drawGUI();
				if(ball->vX<6){
					// Si choca por la parte superior de la raqueta, sale hacia arriba
					//if(CpuPad.y-8>ball->y)ball->vY=-1;
					// Si choca por la parte inferior de la raqueta, sale hacia abajo
					//else if(CpuPad.y<ball->y)ball->vY=1;
					//Si choca por la parte central de la raqueta, sale en horizontal
					//else ball->vY=0;
					ball->vX+=1;
				}
					
				ball->vX=ball->vX*-1;
				TBall *ball2=create_ball();
				ball2->x=ball->x;
				ball2->y=ball->y+5;
				ball2->vX=ball->vX;
				CpuPad.collable=0;
			}else{
				CpuPad.collable=1;
			}

			if (collider_pad_collider_ball(ball, &PlyPad)){
				if(ball->vX>-6){
					// Si choca por la parte superior de la raqueta, sale hacia arriba
					//if(PlyPad.y>ball->y)ball->vY=-1;
					// Si choca por la parte inferior de la raqueta, sale hacia abajo
					//else if(PlyPad.y<ball->y)ball->vY=1;
					//Si choca por la parte central de la raqueta, sale en horizontal
					//else ball->vY=0;
					ball->vX+=-1;
				}
				ball->vX=ball->vX*-1;
				PlyPad.collable=0;


				TBall *ball2=create_ball();
				ball2->x=ball->x;
				ball2->y=ball->y+5;
				ball2->vX=ball->vX;
				CpuPad.collable=0;
			}else{
				PlyPad.collable=1;
			}
		
			
		}

		if(count_balls_planes==0){
			new_game();
		}
		
		/***************************************
		 * 			Fin de balls
		************************************** */
		if(num_jugadores==1){
			TBall *ball0=&array_structs_balls[0];
			if(ball0->y<CpuPad.y){
				CpuPad.y-=CpuPad.vY;
			}else{
				CpuPad.y+=CpuPad.vY;
			}
		}




		FT_Wait(170);
		//BoxFill(0,160,100,190,9,0);
		//TBall *ball0=&array_structs_balls[0];
		//TBall *ball1=&array_structs_balls[1];
		//PutText(0,160,Itoa(PlyPad.collable,"    ",10),8);
		//PutText(50,160,Itoa(CpuPad.collable,"    ",10),8);
		//PutText(0,170,Itoa(ball1->plane,"    ",10),8);
		//PutText(50,170,Itoa(ball1->pattern,"    ",10),8);*/
		//PutText(50,180,Itoa(count_balls_planes,"    ",10),8);
	}
	// Ending program, and return to DOS
	//Screen(0);
	//KeySound(1);
	//Exit(0);
	game_init();

}

// Put all sprite on. screen
void DrawSprite(void)
{

	for (int i=0; i<count_balls_planes; i++){
		TBall *ball=&array_structs_balls[i];
		PutSprite(ball->plane, ball->pattern, ball->x,ball->y, 0 );
	}


	PutSprite(0, 1*4, PlyPad.x,PlyPad.y, 0 );
	if(num_jugadores==1) PutSprite(1, 2*4, CpuPad.x,CpuPad.y, 0 );
	else if(num_jugadores==2)PutSprite(2, 3*4, PlyPad2.x,PlyPad2.y, 0 );
	else if(num_jugadores==4){
		PutSprite(2, 3*4, PlyPad2.x,PlyPad2.y, 0 );
		PutSprite(3, 4*4, PlyPad3.x,PlyPad3.y, 0 );
		PutSprite(4, 5*4, PlyPad4.x,PlyPad4.y, 0 );
	}		
}


void new_game(void){
	initialize_pads( &PlyPad, &CpuPad, &PlyPad2, &PlyPad3,&PlyPad4);
	//Cls();
	ball0=create_ball();
	drawGUI();
	DrawSprite();	
	PutText(80,100,"Press any key",0);
	WaitKey();
	//PutText(80,100,"             ",0);
	HMMM(80,100+256,80,100,110,20);
}


// Wait Routine
void FT_Wait(int cicles) {
  unsigned int i;

  for(i=0;i<cicles;i++)
  {
    while(Vsynch()==0)
    {}
  }
}







void drawGUI(void){
	PutText(10,4,"Player",0);	
	PutText(20,14,Itoa(PlyScore,"  ",10),0);
	if(num_jugadores==1){
		PutText(225,4,"CPU",0);	
		PutText(235,14,Itoa(CpuScore,"  ",10),0);	
	}else if(num_jugadores==2){
		PutText(190,4,"opponent",0);	
		PutText(225,14,Itoa(player2_score,"  ",10),8);	
	}
	//BoxFill(100,8,120,24,1,0);
	//PutText(100,14,Itoa(abs(ball0->vX),"  ",10),8);	
	
}

char collider_pad_collider_ball(TBall *ball, TPad *pad){
	if(pad->collable==1){
		if (pad->x < ball->x + ball->w &&
		  	pad->x + pad->w > ball->x &&
		   	pad->y < ball->y + ball->h &&
		    pad->h + pad->y > ball->y){
			return 1;
		}else{
			return 0;
		}
	}else{
		return 0;
	}
}

void wait(void){
    #ifdef __SDCC
        __asm
            halt
            halt
            halt
        __endasm;
    #endif
}