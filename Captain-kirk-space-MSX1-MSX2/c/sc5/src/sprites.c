/**************DECLARACIONES************/
#ifndef __SPRITES_H__
#define __SPRITES_H__

//INCLUDES


//VARIABLES Y ARRAYS
//Player
unsigned char sprite_nave_derecha1[]={
    0x00,0x00,0x00,0x00,0x00,0x00,0x3E,0xE3,
    0x80,0xE1,0x3C,0x02,0x03,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFC,
    0x04,0xFF,0x02,0x02,0xFF,0x00,0x00,0x00
};
unsigned char sprite_nave_derecha2[]={
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3E,
    0x3F,0x00,0x07,0x03,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0xF8,0x00,0xFE,0xFE,0x00,0x00,0x00,0x00
};
unsigned char sprite_nave_arriba1[]={
    0x00,0x00,0xFF,0x80,0xF3,0x12,0x3E,0xE3,
    0xFF,0xFF,0x12,0x12,0xF3,0x80,0xFF,0x00,
    0x00,0x00,0xF8,0x08,0xF8,0x00,0x00,0xF8,
    0xFC,0xF8,0x00,0x00,0xF8,0x08,0xF8,0x00
};
unsigned char sprite_nave_arriba2[]={
    0x00,0x00,0x00,0xFF,0x0C,0x0C,0x3E,0xFF,
    0xFF,0xFF,0x0C,0x0C,0x0C,0xFF,0x00,0x00,
    0x00,0x00,0x00,0xF0,0x00,0x00,0x00,0xF8,
    0xFC,0xF8,0x00,0x00,0x00,0xF8,0x00,0x00
};
unsigned char sprite_nave_abajo1[]={
    0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0xC0,0x00,0xC0,0xF8,
    0x80,0xF8,0xC0,0x00,0xC0,0x00,0x00,0x00
};
unsigned char sprite_nave_abajo2[]={
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,
    0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xF8,
    0x80,0xF8,0x00,0x00,0x00,0x00,0x00,0x00
};

unsigned char sprite_disparo1[]={
    0,0,0,0,0,0,0,109,
    118,123,0,0,0,0,0,0,
    0,0,0,0,0,0,0,182,
    219,110,0,0,0,0,0,0
};
unsigned char sprite_disparo2[]={
    0,0,0,0,117,106,85,0,
    0,109,118,123,0,0,0,0,
    0,0,0,0,86,171,86,0,
    0,182,219,110,0,0,0,0
};
unsigned char sprite_disparo3[]={
    0,0,85,106,117,0,117,106,
    85,0,91,109,118,0,0,0,
    0,0,86,171,86,0,86,171,
    86,0,110,183,218,0,0,0
};
unsigned char sprite_disparo4[]={
    117,106,85,0,85,106,117,0,
    117,106,85,0,91,109,118,0,
    86,171,86,0,86,171,86,0,
    86,171,86,0,110,183,218,0
};
unsigned char sprite_disparo1_enemigo[]={
    0,0,0,0,0,1,1,6,
    6,1,1,0,0,0,0,0,
    0,0,0,0,0,128,128,96,
    96,128,128,0,0,0,0,0
};
unsigned char sprite_disparo2_enemigo[]={
    0,0,0,0,0,1,3,7,
    7,3,1,0,0,0,0,0,
    0,0,0,0,0,128,192,224,
    224,192,128,0,0,0,0,0,
};
unsigned char sprite_disparo3_enemigo[]={
    0,0,0,0,0,1,3,7,
    7,3,1,0,0,0,0,0,
    0,0,0,0,0,128,192,224,
    224,192,128,0,0,0,0,0
};
unsigned char sprite_disparo4_enemigo[]={
    0,0,0,0,0,1,3,7,
    7,3,1,0,0,0,0,0,
    0,0,0,0,0,128,192,224,
    224,192,128,0,0,0,0,0
};




unsigned char sprite_enemigo_tanque1[]={
    0,0,0,0,0,0,0,1,
    1,1,3,63,63,63,60,60,
    0,0,0,0,0,0,0,128,
    128,128,192,252,252,252,60,60
};
unsigned char sprite_enemigo_tanque2[]={
    32,248,112,112,112,112,113,115,
    114,115,115,251,255,255,240,96,
    4,31,14,14,14,14,206,110,
    46,110,110,111,255,255,15,6
};
unsigned char sprite_enemigo_tanque3[]={
    1,1,2,2,2,2,3,3,
    3,3,9,9,15,1,3,2,
    128,128,64,64,64,64,192,192,
    192,192,144,144,240,128,192,64
};
unsigned char sprite_enemigo_tanque4[]={
    0,0,12,12,12,12,12,12,
    30,63,30,255,255,187,40,16,
    0,0,0,0,0,0,0,0,
    112,104,102,255,254,212,40,16
};
unsigned char sprite_enemigo_tanque5[]={
    0,8,28,12,2,1,0,0,
    0,7,15,127,187,17,187,85,
    0,0,0,0,0,0,128,112,
    80,240,248,254,186,17,186,84
};
unsigned char sprite_enemigo_tanque6[]={
    0,0,0,0,0,0,8,28,
    14,7,3,31,15,16,41,16,
    0,0,0,0,0,0,0,0,
    0,12,236,132,28,132,74,138
};



unsigned char sprite_enemigo_nave1[]={
    0,0,1,7,1,0,0,0,
    0,0,1,7,1,0,0,0,
    0,0,224,248,252,62,31,15,
    31,63,254,252,224,0,0,0
};
unsigned char sprite_enemigo_nave2[]={
    0,0,0,0,1,3,127,3,
    3,127,3,1,0,0,0,0,
    0,28,52,116,244,246,252,248,
    248,252,246,244,116,52,28,0
};
unsigned char sprite_enemigo_nave3[]={
    0,0,0,0,1,2,123,187,
    187,123,2,1,0,0,0,0,
    30,32,94,190,126,248,255,255,
    255,255,248,126,190,94,32,30,
};
unsigned char sprite_enemigo_nave4[]={
    0,0,0,0,6,4,30,47,
    47,30,4,6,0,0,0,0,
    30,62,127,255,224,254,254,254,
    254,254,224,255,255,126,62,30
};
unsigned char sprite_enemigo_nave5[]={
    0,15,23,15,0,1,126,191,
    191,126,1,0,15,23,15,0,
    4,255,252,255,228,128,240,64,
    64,240,128,228,255,252,255,4
};
unsigned char sprite_enemigo_nave6[]={
    15,15,1,1,1,1,1,125,
    253,125,1,1,1,1,15,15,
    224,224,128,192,224,240,248,87,
    87,248,240,224,192,128,224,224
};
unsigned char sprite_enemigo_nave7[]={
   0,0,0,63,255,0,0,7,
    15,7,1,0,255,63,0,0,
    4,14,63,254,255,30,238,132,
    128,132,238,31,254,254,15,4
};
unsigned char sprite_enemigo_nave8[]={
    0,0,0,1,3,31,241,44,
    44,241,31,15,7,3,0,0,
    6,102,226,238,240,192,220,28,
    28,220,192,240,238,226,230,102
};
unsigned char sprite_enemigo_nave9[]={
    31,63,31,0,31,7,0,3,
    0,7,31,0,31,63,31,0,
    192,240,216,12,230,243,255,255,
    255,243,230,12,216,240,192,0
};
unsigned char sprite_enemigo_nave10[]={
    0,0,0,0,0,0,31,243,
    31,0,0,0,0,0,0,0,
    224,240,248,252,255,255,255,252,
    252,255,255,252,248,240,224,192
};
unsigned char sprite_explosion1[]={
    128,64,32,50,31,15,15,63,
    31,31,47,15,16,32,0,0,
    0,0,0,144,40,208,224,224,
    248,224,240,248,176,24,8,4
};
unsigned char sprite_explosion2[]={
    0,0,0,0,1,4,1,31,
    11,9,12,7,0,0,0,0,
    0,0,0,0,32,192,224,56,
    40,168,248,224,0,0,0,0
};
unsigned char sprite_explosion3[]={
    0,0,0,0,0,0,1,1,
    1,9,12,0,0,0,0,0,
    0,0,0,0,0,0,32,48,
    32,160,0,0,0,0,0,0
};
unsigned char sprite_explosion4[]={
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0
};












// Colores
unsigned char color_sprite_nave_derecha1[]={
    0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x05,0x05,
    0x08,0x05,0x08,0x08,0x05,0x0F,0x0F,0x0F
};
unsigned char color_sprite_nave_derecha2[]={
    0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0A,
    0x0A,0x0F,0x0A,0x0A,0x0F,0x0F,0x0F,0x0F
};
unsigned char color_sprite_nave_arriba1[]={
    0x0F,0x0F,0x08,0x08,0x08,0x06,0x05,0x05,
    0x0D,0x05,0x06,0x06,0x08,0x08,0x08,0x0F
};
unsigned char color_sprite_nave_arriba2[]={
    0x0F,0x0F,0x08,0x0A,0x0A,0x0A,0x05,0x0A,
    0x0D,0x05,0x0A,0x0A,0x0A,0x0A,0x08,0x0F
};

unsigned char color_sprite_nave_abajo1[]={
    0x0F,0x0F,0x08,0x0A,0x08,0x0A,0x0A,0x05,
    0x0A,0x05,0x0A,0x0A,0x08,0x0B,0x08,0x0F
};
unsigned char color_sprite_nave_abajo2[]={
    0x0F,0x0F,0x08,0x0A,0x08,0x0A,0x0A,0x08,
    0x0A,0x08,0x0A,0x0A,0x08,0x0B,0x08,0x0F
};



//Shots
//Disparo

unsigned char color_sprite_disparo1[]={
    7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7
};


//Enemigos
unsigned char color_sprite_enemigo_tanque1[]={
    0,0,0,0,0,0,0,8,5,5,5,5,5,5,9,9
};
unsigned char color_sprite_enemigo_tanque2[]={
   8,8,4,4,4,4,4,4,4,4,4,9,9,9,9,8
};
unsigned char color_sprite_enemigo_tanque3[]={
    13,13,14,14,14,14,14,14,14,14,14,14,14,14,6,8
};
unsigned char color_sprite_enemigo_tanque4[]={
    0,0,14,14,14,14,14,14,4,4,4,6,6,6,6,6
};
unsigned char color_sprite_enemigo_tanque5[]={
    0,12,12,12,12,12,12,6,6,6,6,6,12,12,12,12
};
unsigned char color_sprite_enemigo_tanque6[]={
    0,0,0,0,0,0,14,14,14,14,14,12,12,12,12,12
};
unsigned char color_sprite_enemigo_nave1[]={
    0,0,9,8,9,9,9,7,9,9,9,8,9,9,9,9
};
unsigned char color_sprite_enemigo_nave2[]={
    0,13,13,13,13,13,10,5,5,10,13,13,13,13,13,13
};
unsigned char color_sprite_enemigo_nave3[]={
    6,6,6,6,6,6,8,7,7,8,6,6,6,6,6,6
};
unsigned char color_sprite_enemigo_nave4[]={
    5,5,5,5,5,5,5,13,13,5,5,5,5,5,5,5
};
unsigned char color_sprite_enemigo_nave5[]={
    13,13,13,13,13,2,12,12,12,12,2,13,13,13,13,13
};
unsigned char color_sprite_enemigo_nave6[]={
    9,9,10,10,10,10,10,9,9,9,10,10,10,10,9,9
};
unsigned char color_sprite_enemigo_nave7[]={
   4,4,4,8,8,4,4,5,5,5,4,4,8,8,4,4
};
unsigned char color_sprite_enemigo_nave8[]={
    13,13,13,13,8,8,9,9,9,8,8,8,13,13,13,13
};
unsigned char color_sprite_enemigo_nave9[]={
    8,8,8,9,7,7,4,4,4,7,7,9,8,8,8,8
};
unsigned char color_sprite_enemigo_nave10[]={
    12,12,12,12,12,12,6,8,6,12,12,12,12,12,12,12
};
unsigned char color_sprite_explosion1[]={
    10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10
};

//FUNCIONES
void cargar_sprites_en_VRAM();
#endif
/***********FINAL DE DECLARACIONES************/


/**************DEFINICIONES************/
void cargar_sprites_en_VRAM(){

    // lo metemos en la tabla de dEfinición de patrones
    // el 1 argumento es la posición en la poisión en la tabla de definición de sprites (sprite pattern),tenemos que ir sumando 4 porque fusion c es asi
    // el 2 argumentos son los datos del sprite
    // el 3 argumento es el numero de bytes del patron
    SetSpritePattern( 0, sprite_nave_derecha1, 32);
    SetSpritePattern( 4, sprite_nave_derecha2, 32);
    SetSpritePattern( 4*2, sprite_nave_arriba1, 32);
    SetSpritePattern( 4*3, sprite_nave_arriba2, 32);
    SetSpritePattern( 4*4, sprite_nave_abajo1, 32);
    SetSpritePattern( 4*5, sprite_nave_abajo2, 32);
    //Le ponemos el color al sprite
    SC5SpriteColors(0, color_sprite_nave_derecha1);
    SC5SpriteColors(1, color_sprite_nave_derecha2);
    SC5SpriteColors(2, color_sprite_nave_arriba1);
    SC5SpriteColors(3, color_sprite_nave_arriba2);
    SC5SpriteColors(4, color_sprite_nave_abajo1);
    SC5SpriteColors(5, color_sprite_nave_abajo2);




    /**
     * @brief 
     * Shots
     * 
     */
    SetSpritePattern(4*6, sprite_disparo1, 32);
    SC5SpriteColors(6, color_sprite_disparo1);
    SetSpritePattern(4*7, sprite_disparo2, 32);
    SC5SpriteColors(7, color_sprite_disparo1);
    SetSpritePattern(4*8, sprite_disparo3, 32);
    SC5SpriteColors(8, color_sprite_disparo1);
    SetSpritePattern(4*9, sprite_disparo4, 32);
    SC5SpriteColors(9, color_sprite_disparo1);

    SetSpritePattern(4*10, sprite_disparo1_enemigo, 32);
    SC5SpriteColors(10, color_sprite_disparo1);
    SetSpritePattern(4*11, sprite_disparo2_enemigo, 32);
    SC5SpriteColors(11, color_sprite_disparo1);
    SetSpritePattern(4*12, sprite_disparo3_enemigo, 32);
    SC5SpriteColors(12, color_sprite_disparo1);
    SetSpritePattern(4*13, sprite_disparo4_enemigo, 32);
    SC5SpriteColors(13, color_sprite_disparo1);

    /**
     * @brief 
     * Enemies
     * 
     */
    //Vamos a meter en la VRAM el sprite de los enemigos
    //El 10 comienzan los tanques, los patrones de los enemigos (asociados al putsprite empiezan en el 20)
    SetSpritePattern( 4*14, sprite_enemigo_tanque1, 32);
    SC5SpriteColors(14, color_sprite_enemigo_tanque1);
    SetSpritePattern( 4*15, sprite_enemigo_tanque2, 32);
    SC5SpriteColors(15, color_sprite_enemigo_tanque2);
    SetSpritePattern( 4*16, sprite_enemigo_tanque3, 32);
    SC5SpriteColors(16, color_sprite_enemigo_tanque3);
    SetSpritePattern( 4*17, sprite_enemigo_tanque4, 32);
    SC5SpriteColors(17, color_sprite_enemigo_tanque4);
    SetSpritePattern( 4*18, sprite_enemigo_tanque5, 32);
    SC5SpriteColors(18, color_sprite_enemigo_tanque5);
    SetSpritePattern( 4*19, sprite_enemigo_tanque6, 32);
    SC5SpriteColors(19, color_sprite_enemigo_tanque6);

    //Los patrones de las naves empiezan en el 30
    SetSpritePattern( 4*20, sprite_enemigo_nave1, 32);
    SC5SpriteColors(20, color_sprite_enemigo_nave1);
    SetSpritePattern( 4*21, sprite_enemigo_nave2, 32);
    SC5SpriteColors(21, color_sprite_enemigo_nave2);
    SetSpritePattern( 4*22, sprite_enemigo_nave3, 32);
    SC5SpriteColors(22, color_sprite_enemigo_nave3);
    SetSpritePattern( 4*23, sprite_enemigo_nave4, 32);
    SC5SpriteColors(23, color_sprite_enemigo_nave4);
    SetSpritePattern( 4*24, sprite_enemigo_nave5, 32);
    SC5SpriteColors(24, color_sprite_enemigo_nave5);
    SetSpritePattern( 4*25, sprite_enemigo_nave6, 32);
    SC5SpriteColors(25, color_sprite_enemigo_nave6);
    SetSpritePattern( 4*26, sprite_enemigo_nave7, 32);
    SC5SpriteColors(26, color_sprite_enemigo_nave7);
    SetSpritePattern( 4*27, sprite_enemigo_nave8, 32);
    SC5SpriteColors(27, color_sprite_enemigo_nave8);
    SetSpritePattern( 4*28, sprite_enemigo_nave9, 32);
    SC5SpriteColors(28, color_sprite_enemigo_nave9);
    SetSpritePattern( 4*29, sprite_enemigo_nave10, 32);
    SC5SpriteColors(29, color_sprite_enemigo_nave10);

}









