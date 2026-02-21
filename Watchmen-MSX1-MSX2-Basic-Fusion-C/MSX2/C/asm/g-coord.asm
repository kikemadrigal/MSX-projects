		 output g-coord.bin
	db   #fe
	dw   INICIO 
	dw   FINAL
	dw   INICIO 
	org  #d000 
INICIO: 
    ;level  0
	db 1*8,19*8   ;Player initial position x, y
    db 29*8,2*8   ;door position x, y
    db 1*8,15*8     ;Phone position x, y 
    ;level 1
    db  4*8,20*8
    db 2*8,4*8
    db 28*8,10*8   
    ;wordl 2
    db 3*8,20*8   ;Player initial position
    db 4*8,15*8   ;door position
    db 27*8,11*8  ;Phone position
    ;level 3
    db 2*8,20*8   ;Player initial position
    db 2*8,1*8    ;door position
    db 28*8,20*8  ;Phone position
    ;level 4
    db 20*8,19*8  ;Player initial position
    db 1*8,19*8   ;door position
    db 20*8,2*8  ;Phone position
    ;level 5
    db 15*8,19*8  ;Player initial position
    db 29*8,12*8   ;door position
    db 2*8,13*8  ;Phone position
    ;level 6 (o la 7 vista en el MSX, pon 6 en game_update)
    db 1*8,20*8  ;Player initial position
    db 29*8,19*8   ;door position
    db 29*8,2*8  ;Phone position
    ;level 7
    db 26*8,20*8  ;Player initial position
    db 29*8,3*8 ;door position
    db 1*8,20*8  ;Phone position
    ;level 8
    db 4*8,20*8  ;Player initial position
    db 29*8,10*8   ;door position
    db 16*8,16*8  ;Phone position
    ;level 9
    db 4*8,20*8  ;Player initial position
    db 7*8,3*8  ;door position
    db 5*8,16*8  ;Phone position
    ;level 10
    db 4*8,20*8  ;Player initial position
    db 2*8,19*8  ;door position
    db 28*8,7*8  ;Phone position
    ;level 11
    db 4*8,20*8  ;Player initial position
    db 1*8,20*8   ;door position
    db 28*8,6*8  ;Phone position
FINAL: 
