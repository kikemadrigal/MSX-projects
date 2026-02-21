//
// MSX Murcia 2023
// @author:MSX spain
// 

/**************DECLARACIONES************/

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/vdp_sprites.h"
#include "src/definitions.c"
//#include "src/pieces.c"
#include<stdio.h>
// Para el memcpy
#include <string.h>
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>

#define RIGHT 3
#define LEFT 7
#define UP 1
#define DOWN 5
#define ROTATE 10


void print_table(void);
void inicializar_sprites(void);
char procesar_entrada_joyStick(char movement);
char procesar_entrada_teclado(char movement);
void move_piece(char movement,char rotation);
void debug(char word1,char word2);
void pintar_escenario(void);
void insert_piece_into_table(void);
char is_peace(char piece_letter);

//La tabla y los tamaños de la tabla está definidos en src/definitions.c
char new_rotation=0;
char piece_letter='J';

void main(void) 
{
  char movement=0;
  char rotation=0;
  int time=0;
  int counter=0;
  int old_counter=0;
  int counter_letter=0;
  int old_counter_letter=0;

  Screen(1);
  KeySound(0);
  SetColors(15,1,1);
  SetRealTimer(0);
  inicializar_sprites();
  /**********Menú de bienvenida *********/
  Locate(9,5);
  Print("Titris");
  Locate(7,7);
  Print("by MSX spain");
  Locate(0,12);
  Print("Type the number of players");
  Locate(6,14);
  Print("1 to 2 players");
  Locate(7,15);
  for(char i=11;i<14;i++){
    Locate(i,17);
    //printf("%c",255);
    PrintChar(255);
  }
  Locate(12,18);
  WaitKey();
  Cls();
  /********Final menú bienvenida*********/



  //Kitamos el dibujo del cuadrado del cursor
  #ifdef __SDCC
    __asm
        ld a,#0
        ld (#0xFCA9),a
    __endasm; 
  #endif
  pintar_escenario();
  insert_piece_into_table();
  print_table();

  while (1)
  {
    //movement=procesar_entrada_teclado(movement);
    movement=procesar_entrada_joyStick(movement);
    time=RealTimer();
    counter=time/60;
    //counter_letter=time/60;
    //int result=counter-old_counter;
    //int result_new_piece=counter_letter-old_counter_letter;
    // Si el contadoir es mayor que 2 bajamos la pieza una posición
    //if ((counter-old_counter)>2){
      move_piece(DOWN,rotation);
      //old_counter=counter;
    //}
    //if (result_new_piece>10){
    //    //piece_letter=rand()%sizeof(arrayPieces);
    //    Locate(22,11);
    //    PrintChar(piece_letter);
    //    old_counter_letter=counter_letter;
    //}




    if (movement==ROTATE){
      if (rotation>2){
        rotation=0;
      }else{
        rotation++;
      } 
    }
    if(movement!=0){
      move_piece(movement,rotation);
    }


    //Locate(22,13);
    //Print("    ");
    //Locate(22,13);
    //PrintDec(result);
  }
  
}


void print_table(void){
  printf("\n\n\r");
  for(int f=0;f<NUMERO_FILAS;f++){
    Locate(2,f+1);
    for(int c=0;c<NUMERO_COLUMNAS;c++){  
      if(is_peace(piece_letter)){
        printf("%c",table[f][c]);
      }
    }
    printf("\n\r");
  }
}
char is_peace(char piece_letter){
  if(piece_letter=='J'||piece_letter=='L'||piece_letter=='Z'||piece_letter=='S'||piece_letter=='O'||piece_letter=='T'||piece_letter=='I')
    return 1;
  else
    return 0;
}






char procesar_entrada_joyStick(char movement){
  //Leemos el disparo
  movement=0;
  char joy=JoystickRead(0);
  switch (joy)
  {
    //Movimiento arriba
    case 1:
        movement=UP;
        break;
    //Moviemiento derecha
    case 3:
        movement=RIGHT;
        break;
    //Mociemiento abajo
    case 5:
        movement=DOWN;
        break;
    //Moviemiento izquierda
    case 7:
        movement=LEFT;
        break;
    //default:
        //movement=0;
       // break;
  } 
  char trigger = TriggerRead(0);
  if (trigger!=0) {
    movement=ROTATE;
  }
  return movement;
}

char procesar_entrada_teclado(char movement){
  char key=WaitKey();
  switch (key)
  {
    //Movimiento arriba
    case 30:
        movement=UP;
        break;
    //Moviemiento derecha
    case 28:
        movement=RIGHT;
        break;
    //Mociemiento abajo
    case 31:
        movement=DOWN;
        break;
    //Moviemiento izquierda
    case 29:
        movement=LEFT;
        break;
    default:
        movement=0;
        break;
  } 
  return movement;
}


void move_piece(char movement,char rotation){
  signed char new_row_index=0;
  signed char new_column_index=0;

  new_rotation=rotation;
  char rotation_item=0;
  char find=0;
  char indezex[4][2];
  char new_indezex[4][2];
  char permitido=0;
  //Recorremos todo el tablero en busca de los 4 itms de la pieza
  for(int f=0;f<NUMERO_FILAS;f++){
    for(int c=0;c<NUMERO_COLUMNAS;c++){
      if(table[f][c]==piece_letter){
        if (movement==UP){
          new_row_index=f-1;
          new_column_index=c;
        }else if(movement==RIGHT){
          new_row_index=f;
          new_column_index=c+1;
        }else if(movement==DOWN){
          new_row_index=f+1;
          new_column_index=c;
        }else if(movement==LEFT){
          new_row_index=f;
          new_column_index=c-1;
        }else if(movement==ROTATE){
          switch (piece_letter)
          {
            case 'J':
                new_row_index=f+jRotations[new_rotation][rotation_item][0];
                new_column_index=c+jRotations[new_rotation][rotation_item][1];
                break;
            case 'L':
                new_row_index=f+lRotations[new_rotation][rotation_item][0];
                new_column_index=c+lRotations[new_rotation][rotation_item][1];
                break;
            case 'Z':
                new_row_index=f+zRotations[new_rotation][rotation_item][0];
                new_column_index=c+zRotations[new_rotation][rotation_item][1];
                break;
            case 'S':
                new_row_index=f+sRotations[new_rotation][rotation_item][0];
                new_column_index=c+sRotations[new_rotation][rotation_item][1];
                break;
            case 'T':
                new_row_index=f+tRotations[new_rotation][rotation_item][0];
                new_column_index=c+tRotations[new_rotation][rotation_item][1];
                break;
            case 'I':
                new_row_index=f+iRotations[new_rotation][rotation_item][0];
                new_column_index=c+iRotations[new_rotation][rotation_item][1];
                break;
            case 'O':
                new_row_index=f+oRotations[new_rotation][rotation_item][0];
                new_column_index=c+oRotations[new_rotation][rotation_item][1];
                break;
          }
          rotation_item+=1;
        }
        indezex[find][0]=f;
        indezex[find][1]=c;
        new_indezex[find][0]=new_row_index;
        new_indezex[find][1]=new_column_index;
        char letter_down=table[new_row_index][new_column_index];
        if(find==3 && is_peace(letter_down) ){
          insert_piece_into_table();
          return;
        }
        if(NUMERO_FILAS==new_row_index){
          insert_piece_into_table();
        }

        if(new_row_index<0 || new_row_index>=NUMERO_FILAS || new_column_index<0 || new_column_index>=NUMERO_COLUMNAS){
          return;
        }
        find++;
      }//Fin del if='X'
    }//Fin del for c
  }//Fin del for f
  
  for(char i=0;i<find;i++){
    table[indezex[i][0]][indezex[i][1]]=' ';
  }
  for(char i=0;i<find;i++){
    table[new_indezex[i][0]][new_indezex[i][1]]=piece_letter;

    //if (i==3){
    //  char letter_down=table[new_row_index][new_column_index];
    //  if(is_peace(letter_down)){
    //    insert_piece_into_table();
    //  }
    //}
  }
  
 
  print_table();
}


void debug(char word1,char word2){
  Locate(0,17);
  Print("Debug: ");
  PrintDec(word1);
  Print(" , ");
  PrintDec(word2);
  Print(" \n");
}

void pintar_escenario(void){
  Locate(4,0);
  Print("TETRIS by MSX spain");
  Locate(14,7);
  Print("Player: ");
  Locate(14,9);
  Print("Score: ");
  Locate(14,11);
  Print("Piece: ");
  Locate(14,13);
  Print("Time: ");
  for(int i=2;i<NUMERO_FILAS+2;i++){
    Locate(1,i);
    Print("|");
    Locate(12,i);
    Print("|");
  }
  for(int i=2;i<NUMERO_COLUMNAS+2;i++){
    Locate(i,21);
    Print("-");
  }
  
 
}

void insert_piece_into_table(void){
  //Obtenemos la letra que vamos a soltar
  int rand_piece=rand()%sizeof(arrayPieces);
  piece_letter=arrayPieces[rand_piece];
  Locate(22,11);
  PrintChar(piece_letter);
  switch (piece_letter)
  {
    //char arrayPieces[]={'L','J','Z','S','O','T','I'};
    case 'J':
        memcpy(table,jPieceString,sizeof(jPieceString));
        break;
    case 'L':
        memcpy(table,lPieceString,sizeof(lPieceString));
        break;
    case 'Z':
        memcpy(table,zPieceString,sizeof(zPieceString));
        break;
    case 'S':
        memcpy(table,sPieceString,sizeof(sPieceString));
        break;
    case 'O':
        memcpy(table,oPieceString,sizeof(oPieceString));
        break;
    case 'T':
        memcpy(table,tPieceString,sizeof(tPieceString));
        break;
    case 'I':
        memcpy(table,iPieceString,sizeof(iPieceString));
        break;
  }
  //print_table();
  //Le metemos la pieza "jPiece" al tablero
}



void inicializar_sprites(void){
  //Ponemos a 0 todos los sprites
  SpriteReset(); 
  // tamaño de sprites 8x8
  Sprite8(); 
  // tamaño de sprites sin ampliar   
  SpriteSmall(); 
}

































