void initialize_sprites(void);


const char PatternBall[]={
	60,90,189,255,255,189,90,60,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0
};



const char PatternPad[]={
	255,63,31,15,9,9,9,9,
	9,9,9,9,9,31,63,255,
	240,192,128,0,0,0,0,0,
	0,0,0,0,0,128,192,240
};

void initialize_sprites(void){
    SetSpritePattern(0, PatternBall,32);
	SetSpritePattern(1*4, PatternPad,32);
	SetSpritePattern(2*4, PatternPad,32);
	SetSpritePattern(3*4, PatternPad,32);
	SetSpritePattern(4*4, PatternPad,32);
	SetSpritePattern(5*4, PatternPad,32);
}