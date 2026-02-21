#pragma once
// Para el memcpy
#include <string.h>
//rand y srand http://cplusplus.com/reference/cstdlib/rand/
#include <stdlib.h>


typedef struct {
    char number;
    char letter;
    char color;
    char **definition;
    //char rotation;
    char **rotations;
} TPiece;


TPiece* create_piece_sprite();
void init_pieces(void);
char get_piece_Letter(char piece_in_array);
char** get_piece_definition(char piece_number);
char*** get_piece_rotations(char piece_number);
char get_piece_color(char piece_number);
const TPiece piece_template={0,'0',0};


//                                      0   1   2   3   4   5   6   7
//unsigned char array_letter_pieces[]={' ','L','J','Z','S','T','O','I'};
unsigned char array_number_pieces[]={0,1,2,3,4,5,6,7,8};
TPiece array_sprites_pieces[4];
char count_pieces;


void init_pieces(void){
    count_pieces=0;
    //Creamos 4 piezas y las metemos en el array
    for(char i=0;i<4;i++){
        char rand_piece=rand()%(8-1)+1;
        TPiece* piece=create_piece_sprite();
        piece->number=rand_piece;
        piece->color=get_piece_color(rand_piece);
        piece->definition=get_piece_definition(rand_piece);
        //piece->rotations=get_piece_rotations(rand_piece);
        piece->letter=get_piece_Letter(rand_piece);
    }
}


TPiece* create_piece_sprite(){
    //Desplazamos todas las piezas una posión menos
    for (char i=0;i<4;i++){
        array_sprites_pieces[i]=array_sprites_pieces[i+1];
    }
    TPiece* piece3=&array_sprites_pieces[3];
    TPiece* piece0=&array_sprites_pieces[0];
    //Modificamos la pieza 3
    char rand_piece=rand()%(8-1)+1;
    piece3->number=rand_piece;
    piece3->color=get_piece_color(rand_piece);
    //piece3->rotations=get_piece_rotations(rand_piece);
    piece3->letter=get_piece_Letter(rand_piece);
    //Devolvemos la 1
    return piece0;
}

unsigned char sprite_piece_zero[]={
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0
};
/*
N                           
N                            
NN                                                           
Pieza L color naranja 
*/

/*unsigned char lPiece[4][2]={
    {0,0},
    {1,0},
    {2,0},
    {2,1}
};*/ 
/*
unsigned char lPieceString[4][10]={
    {' ',' ',' ',' ','0',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','0',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','0','0',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};
*/
unsigned char lPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_l[]={
	0,0,0,0,240,144,176,176,
	240,144,176,176,255,153,187,255,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0
};
/*
 J
 J  
JJ   
Pieza J color azul  
*/
/*unsigned char jPiece[4][2]={
    {0,1},
    {1,1},
    {2,1},
    {2,0}
};*/
/*unsigned char jPieceString[4][10]={
    {' ',' ',' ',' ','2',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','2','2','2',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};*/
unsigned char jPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 2, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 2, 2, 2, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_j[]={
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,15,9,13,15,
	15,9,13,15,255,153,221,255
};


/*
 RR
  RR   
Pieza Z color rojo
*/
/*unsigned char zPiece[4][2]={
    {0,0},
    {0,1},
    {1,1},
    {1,2}
};*/
/*unsigned char zPieceString[4][10]={
    {' ',' ',' ','Z','Z',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','Z','Z',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};*/
unsigned char zPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 3, 3, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 3, 3, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_z[]={
	0,0,0,0,0,0,0,0,
	15,9,13,15,0,0,0,0,
	0,0,0,0,0,0,0,0,
	240,144,208,240,255,153,221,255
};
/*
 VV
VV
Pieza S color verde
*/
/*unsigned char sPiece[4][2]={
    {0,1},
    {0,2},
    {1,0},
    {1,1}
};*/
/*unsigned char sPieceString[4][10]={
    {' ',' ',' ',' ','S','S',' ',' ',' ',' '},
    {' ',' ',' ','S','S',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};*/
unsigned char sPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 4, 4, 0, 0, 0, 0},
    { 0, 0, 0, 4, 4, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_s[]={
	0,0,0,0,0,0,0,0,
	15,9,13,15,255,153,221,255,
	0,0,0,0,0,0,0,0,
	240,144,208,240,0,0,0,0
};

/*
 M                     
MMM  
Pieza T color Morado        
*/
/*unsigned char tPiece[4][2]={
    {0,1},
    {1,0},
    {1,1},
    {1,2}
};*/
/*unsigned char tPieceString[4][10]={
    {' ',' ',' ',' ','T',' ',' ',' ',' ',' '},
    {' ',' ',' ','T','T','T',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};*/
unsigned char tPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 5, 0, 0, 0, 0, 0},
    { 0, 0, 0, 5, 5, 5, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_t[]={
	0,0,0,0,0,0,0,0,
	3,2,3,3,63,38,55,63,
	0,0,0,0,0,0,0,0,
	192,64,64,192,252,100,116,252
};
/*
AA
AA
Pieza O color amarillo
*/
/*unsigned char oPiece[4][2]={
    {0,0},
    {0,1},
    {1,0},
    {1,1}
};*/
/*unsigned char oPieceString[4][10]={
    {' ',' ',' ',' ','O','O',' ',' ',' ',' '},
    {' ',' ',' ',' ','O','O',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
};*/
unsigned char oPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 6, 6, 0, 0, 0, 0},
    { 0, 0, 0, 0, 6, 6, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_o[]={
	0,0,0,0,0,0,0,0,
	15,9,13,15,15,9,13,15,
	0,0,0,0,0,0,0,0,
	240,144,208,240,240,144,208,240
};
/*
 C
 C
 C
 C
Pieza I color Cyan
*/
/*unsigned char iPiece[4][2]={
    {0,0},
    {1,0},
    {2,0},
    {3,0}
};*/
/*unsigned char iPieceString[4][10]={
    {' ',' ',' ',' ','I',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','I',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','I',' ',' ',' ',' ',' '},
    {' ',' ',' ',' ','I',' ',' ',' ',' ',' '}
};*/
unsigned char iPiece[5][10]={
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 7, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 7, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 7, 0, 0, 0, 0, 0},
    { 0, 0, 0, 0, 7, 0, 0, 0, 0, 0}
};
unsigned char sprite_piece_i[]={
	3,2,3,3,3,2,3,3,
	3,2,3,3,3,2,3,3,
	192,64,64,192,192,64,64,192,
	192,64,64,192,192,64,64,192
};
/*****************ROTATIONS**************/
//PIECE J
/*    
    - 1 - - - - - - - - -
    - 2 3 4 - - - - - - - 
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,1},{-1,0},{0,-1},{1,-2}
    - 2 1 - - - - - - - -
    - 3 - - - - - - - - -
    - 4 - - - - - - - - -

    - 1 2 - - - - - - - -
    - 3 - - - - - - - - -
    - 4 - - - - - - - - -
    Movimiento 2
    {0,2},{1,1},{-1,1},{-2,0}
    - 4 3 2 - - - - - - -
    - - - 1 - - - - - - -
    - - - - - - - - - - -
    Movimiento 3
    {0,1},{1,0},{2,-1},{1,-2}
    - - - 4 - - - - - - -
    - - - 3 - - - - - - -
    - - 1 2 - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {1,1},{0,0},{-2,0},{-1,-1}    
    - 1 - - - - - - - - -
    - 2 3 4 - - - - - - - 
    - - - - - - - - - - -
*/
signed char jRotations[4][4][2]={
    {
        {1,1},{0,0},{-2,0},{-1,-1}
    },
    {
        {0,1},{-1,0},{0,-1},{1,-2}
    },
    {
        {0,2},{1,1},{-1,1},{-2,0}
    },
    {
        {0,1},{1,0},{2,-1},{1,-2}
    }
};
//PIECE L
/*   
    - 1 - - - - - - - - -
    - 2 - - - - - - - - - 
    - 3 4 - - - - - - - -
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,2},{-1,1},{-2,0},{-1,-1}
    - 3 2 1 - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -

    - 1 2 3 - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 2
    {2,2},{1,1},{1,0},{1,2}
    - - 4 3 - - - - - - -
    - - - 2 - - - - - - -
    - - - 1 - - - - - - -
    - - - - - - - - - - -

    - - 1 2 - - - - - - -
    - - - 3 - - - - - - -
    - - - 4 - - - - - - -
    - - - - - - - - - - -

    Movimiento 3
    {1,1},{2,-2},{1,-1},{0,0}
    - - - - - - - - - - -
    - - - 1 - - - - - - -
    - 2 3 4 - - - - - - -
    - - - - - - - - - - -

    - - - - - - - - - - -
    - - - 1 - - - - - - -
    - 2 3 4 - - - - - - -
    - - - - - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {-1,-2},{-1,0},{0,-1},{0,-1}    
    - 1 - - - - - - - - -
    - 2 - - - - - - - - - 
    - 3 4 - - - - - - - -
    - - - - - - - - - - -
*/
signed char lRotations[4][4][2]={
    {
        {-1,-2},{-1,0},{0,-1},{0,-1}    
    },
    {
        {0,2},{-1,1},{-2,0},{-1,-1}
    },
    {
        {2,2},{1,1},{0,0},{-1,1}
    },
    {
        {1,1},{2,-2},{1,-1},{0,0}
    }
};

//PIECE Z
/*    
    - - - - - - - - - - -
    - 1 2 - - - - - - - -
    - - 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,2},{1,1},{0,0},{1,-1}
    {-1,2},{0,1},{-1,0},{0,-1}
    - - 1 - - - - - - - -
    - 3 2 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -

    - - - - - - - - - - -
    - - 1 - - - - - - - -
    - 3 2 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -

    - - 1 - - - - - - - -
    - 2 3 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 2
    {1,-2},{1,0},{1,-1},{0,1}
    - 1 2 - - - - - - - -
    - - 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 3
    {0,2},{1,1},{0,0},{1,-1}
    {-1,2},{0,1},{-1,0},{0,-1}
    - - 1 - - - - - - - -
    - 2 3 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {0,-2},{-1,0},{0,-1},{-1,1}
    - 1 2 - - - - - - - -
    - - 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
*/
/*signed char zRotations[4][4][2]={
    {
        {0,-2},{-1,0},{0,-1},{-1,1}
    },
    {
        {0,2},{1,1},{0,0},{1,-1}
    },
    {
        //Estas aki en movimiento 2
        {0,-2},{-1,0},{0,-1},{-1,1}
    },
    {
        {0,2},{1,1},{0,0},{1,-1}
    }
};*/

signed char zRotations[4][4][2]={
    {
        {1,-2},{0,0},{1,-1},{0,1}
    },
    {
        {-1,2},{0,1},{-1,0},{0,-1}
    },
    {
        //Estas aki en movimiento 2
        {1,-2},{0,0},{1,-1},{0,1}
    },
    {
        {-1,2},{0,1},{-1,0},{0,-1}
    }
};

//PIECE S
/*    
    - - 1 2 - - - - - - -
    - 3 4 - - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,-1},{1,-2},{0,1},{1,0}
    {-1,-1},{0,-2},{-1,1},{0,0}
    - 1 - - - - - - - - -
    - 2 3 - - - - - - - -
    - - 4 - - - - - - - -
    - - - - - - - - - - -
    Movimiento 2
    {0,2},{-1,1},{0,0},{-1,-1}
    {1,2},{0,1},{1,0},{0,-1}
    - - 2 1 - - - - - - -
    - 4 3 - - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 3
    {0,-1},{1,-2},{0,1},{1,0}
    - 1 - - - - - - - - -
    - 2 3 - - - - - - - -
    - - 4 - - - - - - - -
    - - - - - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {0,2},{-1,1},{0,0},{-1,-1}
    - - 2 1 - - - - - - -
    - 4 3 - - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
*/
signed char sRotations[4][4][2]={
    {
         {1,2},{0,1},{1,0},{0,-1}
    },
    {
        {-1,-1},{0,-2},{-1,1},{0,0}
    },
    {
        //2 movimiento
         {1,2},{0,1},{1,0},{0,-1}
    },
    {
        {-1,-1},{0,-2},{-1,1},{0,0}
    }
};

//PIECE T
/*    
    - - 1 - - - - - - - -
    - 2 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,0},{-2,0},{-1,-1},{0,-2}
    - 2 - - - - - - - - -
    - 3 1 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -

    - 1 - - - - - - - - -
    - 2 3 - - - - - - - -
    - 4 - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 2
    {1,1},{-1,0},{-1,0},{-2,2}
    - 2 3 4 - - - - - - -
    - - 1 - - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -

    - 1 2 3 - - - - - - -
    - - 4 - - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 3
    {0,2},{1,0},{1,0},{1,1}
    {0,3},{1,1},{1,1},{1,2}
    - - 1 - - - - - - - -
    - 2 3 - - - - - - - -
    - - 4 - - - - - - - -
    - - - - - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {1,-1},{1,-1},{1,-1},{0,0}
    - - 1 - - - - - - - -
    - 2 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
*/

signed char tRotations[4][4][2]={
    {
        {1,-1},{1,-1},{1,-1},{0,0}
    },
    {
        {0,0},{-2,0},{-1,-1},{0,-2}
    },
    {
        {1,1},{-1,0},{-1,0},{-2,2}
    },
    {
        {0,2},{1,0},{1,0},{1,1}
    }
};
signed char tRotationsRight[4][4][2]={
    {
        {0,3},{1,1},{1,1},{1,2}
    },
    {
        {0,0},{-2,0},{-1,-1},{0,-2}
    },
    {
        {1,1},{-1,0},{-1,0},{-2,2}
    },
    {
        {0,2},{1,0},{1,0},{1,1}
    }
};
//PIECE I
/*    
    - - 1 - - - - - - - -
    - - 2 - - - - - - - - 
    - - 3 - - - - - - - -
    - - 4 - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {3,-2},{2,-1},{1,0},{0,1}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    1 2 3 4 - - - - - - -
    Movimiento 2
    {-3,2},{-2,1},{-1,0},{0,-1}
    - - 1 - - - - - - - -
    - - 2 - - - - - - - - 
    - - 3 - - - - - - - -
    - - 4 - - - - - - - -
    Movimiento 3
    {3,-2},{2,-1},{1,0},{0,1}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    1 2 3 4 - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {-3,2},{-2,1},{-1,0},{0,-1}
    - - 1 - - - - - - - -
    - - 2 - - - - - - - - 
    - - 3 - - - - - - - -
    - - 4 - - - - - - - -
*/
signed char iRotations[4][4][2]={
    {
        {-3,2},{-2,1},{-1,0},{0,-1}
    },
    {
        {3,-2},{2,-1},{1,0},{0,1}
    },
    {
        {-3,2},{-2,1},{-1,0},{0,-1}
    },
    {
        {3,-2},{2,-1},{1,0},{0,1}
    }
};
//PIECE O
/*    
    - - 1 2 - - - - - - -
    - - 3 4 - - - - - - - 
    - - - - - - - - - - -
    - - - - - - - - - - -
    Para rotarlo
    Movimiento 1
      1      2     3      4
     f c    f c    f c    f c
    {0,0},{0,0},{0,0},{0,0}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 2
    {0,0},{0,0},{0,0},{0,0}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento 3
    {0,0},{0,0},{0,0},{0,0}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    Movimiento4 (volver a la posición inicial)
    {0,0},{0,0},{0,0},{0,0}
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
    - - - - - - - - - - -
*/
signed char oRotations[4][4][2]={
    {
        {0,0},{0,0},{0,0},{0,0}
    },
    {
        {0,0},{0,0},{0,0},{0,0}
    },
    {
        {0,0},{0,0},{0,0},{0,0}
    },
    {
        {0,0},{0,0},{0,0},{0,0}
    }
};
/*typedef struct{
    char number;
    char letter;
    char color;
    char x,y;
    char rotation;
    char *rotations;
} TPiece;
TPiece* create_piece(char piece_letter){
    
    TPiece pieceL={
        1,          //number
        'L',        //letter
        1,          //color
        0,0,        //x,y
        0,        //rotation
        &lRotations[0][0][0]
    };
    TPiece pieceJ={
        2,          //number
        'J',        //letter
        2,          //color
        0,0,        //x,y
        0,         //rotation
        &jRotations[0][0][0]
    };
    TPiece pieceZ={
        3,          //number
        'Z',        //letter
        3,          //color
        0,0,        //x,y
        0,          //rotation
        &zRotations[0][0][0]
    };
    TPiece pieceS={
        4,          //number
        'S',        //letter
        4,          //color
        0,0,        //x,y
        0,          //rotation
        &sRotations[0][0][0]
    };
    TPiece pieceT={
        5,          //number
        'T',        //letter
        5,          //color
        0,0,        //x,y
        0,          //rotation
        &tRotations[0][0][0]
    };
    TPiece pieceO={
        6,          //number
        'O',        //letter
        6,          //color
        0,0,        //x,y
        0,          //rotation
        &oRotations[0][0][0]
    };
    TPiece pieceI={
        7,          //number
        'I',        //letter
        7,          //color
        0,0,        //x,y
        0,        //rotation
        &iRotations[0][0][0]
    };
    TPiece *piece=NULL;
    if(piece_letter=='L')
        piece=&pieceL;
    else if(piece_letter=='J')    
        piece=&pieceJ;
    else if(piece_letter=='Z')    
        piece=&pieceZ;
    else if(piece_letter=='S')    
        piece=&pieceS;
    else if(piece_letter=='T')    
        piece=&pieceT;
    else if(piece_letter=='O')    
        piece=&pieceO;
    else if(piece_letter=='I')    
        piece=&pieceI;
    return piece;   
}*/

char get_piece_Letter(char piece_in_array){
  char letter=' ';
  switch (piece_in_array)
  {
    case 1:
        letter='L';
        break;
    case 2:
        letter='J';
        break;
    case 3:
        letter='Z';
        break;
    case 4:
        letter='S';
        break;
    case 5:
        letter='T';
        break;
    case 6:
        letter='O';
        break;
    case 7:
        letter='I';
        break;
  }
  return letter;
}


char** get_piece_definition(char piece_number){
    char **definition=NULL;
    switch (piece_number)
    {
    //char array_numbre_pieces[]={'L','J','Z','S','O','T','I'};
    //Si es la L
    case 1:
        definition=&lPiece[0];
        break;
    //Si es la J
    case 2:
        definition=&jPiece[0];
    break;
    //Si es la Z
    case 3:
        definition=&zPiece[0];
        break;
    //Si es la S
    case 4:
        //Pieza S color verde
       definition=&sPiece[0];
        break;
    //Si es la O
    case 5:
        //Pieza T color Morado  
        definition=&tPiece[0];
        break;
    //Si es la T
    case 6:
        //Pieza O color amarillo
        definition=&oPiece[0];
        break;
    //Si es la I
    case 7:
        //Pieza I color Cyan
        definition=&iPiece[0];
        break;
    }
    return definition;
}

char*** get_piece_rotations(char piece_number){
    char ***rotation=NULL;
    switch (piece_number)
    {
    //char array_numbre_pieces[]={'L','J','Z','S','O','T','I'};
    //Si es la L
    case 1:
        rotation=&lRotations[0];
        break;
    //Si es la J
    case 2:
        rotation=&jRotations[0];
    break;
    //Si es la Z
    case 3:
        rotation=&zRotations[0];
        break;
    //Si es la S
    case 4:
        //Pieza S color verde
       rotation=&sRotations[0];
        break;
    //Si es la O
    case 5:
        //Pieza T color Morado  
        rotation=&tRotations[0];
        break;
    //Si es la T
    case 6:
        //Pieza O color amarillo
        rotation=&oRotations[0];
        break;
    //Si es la I
    case 7:
        //Pieza I color Cyan
        rotation=&iPiece[0];
        break;
    }
    return rotation;
}



char get_piece_color(char piece_number){
    char color=0;
    switch (piece_number)
    {
        //Si es la L
        case 1:
            //Pieza L color naranja 
            color=9;
            break;
        //Si es la J
        case 2:
        //Pieza J color azul  
            color=4;
            break;
        //Si es la Z
        case 3:
            //Pieza Z color rojo
            color=6;
            break;
        //Si es la S
        case 4:
            //Pieza S color verde
            color=2;
            break;
        //Si es la O
        case 5:
            //Pieza T color Morado  
            color=13;
            break;
        //Si es la T
        case 6:
            //Pieza O color amarillo
            color=11;
            break;
        //Si es la I
        case 7:
            //Pieza I color Cyan
            color=7;
            break;
    }
    return color;
}