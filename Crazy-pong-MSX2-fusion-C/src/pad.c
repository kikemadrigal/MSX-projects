

typedef struct {
    float x,y;     	 // X destination of the Sprite 
    char w,h;
    float vX,vY;     	 // Y destination of the sprite
    char plane;        // Sprite ID or sprite
    char pattern;        // Pattern number to use 
    char color;        // Color to use (Not usable with MS2's sprites)
    char collable;
} TPad;
				 
	
const TPad pad_template={
    0,0,            //x,y  ,20*8 es el suelo, 8*16 plataforma
    4,8,
    2,2,           //velocidadX, y
    0,             //plane or sprite
    0,             //pattern
    15,             //color
    1               //colisionable
};
char cursor;
char joy;
char move_player_up3,move_player_down3;
char move_player_up4,move_player_down4;
TPad CpuPad;					
TPad PlyPad;						
TPad PlyPad2;						
TPad PlyPad3;						
TPad PlyPad4;		
void initialize_pads(TPad *PlyPad, TPad *CpuPad, TPad *PlyPad2, TPad *PlyPad3, TPad *PlyPad4);
void input_system(void);
void move_up_player3(TPad *player);
void move_down_player3(TPad *player);
void move_up_player4(TPad *player);
void move_down_player4(TPad *player);





void initialize_pads(TPad *PlyPad, TPad *CpuPad, TPad *PlyPad2, TPad *PlyPad3, TPad *PlyPad4){
  PlyPad->x=15;
	PlyPad->y=100;
	PlyPad->w=16;
	PlyPad->h=16;
	PlyPad->vX=4;
	PlyPad->vY=4;
	PlyPad->plane=0;
	PlyPad->pattern=1;
	PlyPad->color=15;
  PlyPad->collable=1;

  CpuPad->x=240;
  CpuPad->y=100;
  CpuPad->w=16;
  CpuPad->h=16;
  CpuPad->vX=1;
  CpuPad->vY=4;
  CpuPad->plane=1;
  CpuPad->pattern=2;
  CpuPad->color=15;
  CpuPad->collable=1;

  PlyPad2->x=230;
  PlyPad2->y=100;
  PlyPad2->w=12;
  PlyPad2->h=16;
  PlyPad2->vX=PlyPad->vX;
  PlyPad2->vY=PlyPad->vY;
  PlyPad2->plane=2;
  PlyPad2->pattern=3;
  PlyPad2->color=15;
  PlyPad2->collable=1;


  PlyPad3->x=35;
  PlyPad3->y=100;
  PlyPad3->w=12;
  PlyPad3->h=16;
  PlyPad3->vX=PlyPad->vX;
  PlyPad3->vY=PlyPad->vY;
  PlyPad3->plane=3;
  PlyPad3->pattern=4;
  PlyPad3->color=15;
  PlyPad3->collable=1;

  PlyPad4->x=210;
  PlyPad4->y=100;
  PlyPad4->w=16;
  PlyPad4->h=16;
  PlyPad4->vX=PlyPad->vX;
  PlyPad4->vY=PlyPad->vY;
  PlyPad4->plane=4;
  PlyPad4->pattern=1;
  PlyPad4->color=15;
  PlyPad2->collable=4;
}
/*TPad* create_enemy(){
    TPad pad;
    //memcpy(pad,&pad_template,sizeof(pad_template));
    pad.x=240;
    pad.y=100;
    pad.vX=1;
    pad.vY=1;
    pad.plane=1;
    pad.pattern=1;
    pad.color=15;
    return &pad;
}*/
void input_system(void){

	cursor=JoystickRead(0);		
	if(cursor==1){
		PlyPad.y-=PlyPad.vY;	
	}
			
	else if(cursor==5){
		PlyPad.y+=PlyPad.vY;
	}
		

	joy=JoystickRead(1);	
	if(joy==1)	
		PlyPad2.y -=PlyPad2.vY;	
	else if(joy==5)
		PlyPad2.y += PlyPad2.vY;



	char key = Inkey();
    switch (key){
      case 'q':
        move_player_up3=1;
        break;
      case 'a':
        move_player_down3=1;
        break;
      case 'o':
        move_player_up4=1;
        break;
      case 'l':
        move_player_down4=1;
        break;
      default:
        move_player_up3=0;
        move_player_down3=0;
        move_player_up4=0;
        move_player_down4=0;
        break;
    }
	move_up_player3(&PlyPad3);
	move_down_player3(&PlyPad3);
	move_up_player4(&PlyPad4);
	move_down_player4(&PlyPad4);
}

void move_up_player3(TPad *player){
  if(move_player_up3==1) player->y-=player->vY;
}
void move_down_player3(TPad *player){
  if(move_player_down3==1)player->y+=player->vY;
}
void move_up_player4(TPad *player){
  if(move_player_up4==1) player->y-=player->vY;
}
void move_down_player4(TPad *player){
  if(move_player_down4==1)player->y+=player->vY;
}