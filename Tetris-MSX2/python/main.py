from enum import Enum
import keyboard
import os
import time

class Movement(Enum):
    DOWN=1
    RIGHT=2
    LEFT=3
    ROTATE=4


def main():
    screen=[
        [" "," "," "," "," "," "," "," "," "," "],
        ["W","W","W"," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],        
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "],
        [" "," "," "," "," "," "," "," "," "," "]     
    ]
    


    
    rotation=0
    print_screen(screen)
    tiempo_final=time.time()
    while True:
        tiempo=time.time() 
        if tiempo-tiempo_final>=2:
            (screen,rotation)=move_piece(screen,Movement.DOWN,rotation) 
            print_screen(screen)
            tiempo_final=tiempo

        #print (tiempo-tiempo_final)
        if keyboard.is_pressed('esc'):
             break
        elif keyboard.is_pressed('flecha abajo'):
                 (screen,rotation)=move_piece(screen,Movement.DOWN,rotation)
        elif keyboard.is_pressed('flecha derecha'):
                (screen,rotation)=move_piece(screen,Movement.RIGHT,rotation)
        elif keyboard.is_pressed('flecha izquierda'):
                (screen,rotation)=move_piece(screen,Movement.LEFT,rotation)
        elif keyboard.is_pressed('space'):
                (screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)

# movement es la forma en la que moveremeos la pieza
def move_piece(screen:list,movement:Movement, rotation:int)->(list,int):
    #new_screen=[["🔲"]*ancho for _ in range(alto)]
    new_screen=[[" "]*10 for _ in range(20)]
    rotation_item=0
    rotations=[
                [(1,1),(0,0),(-2,0),(-1,-1)],
                [(0,1),(-1,0),(0,-1),(1,-2)],
                [(0,2),(1,1),(-1,1),(-2,0)],
                [(0,1),(1,0),(2,-1),(1,-2)]
            ]
    new_rotation=rotation
    if movement is Movement.ROTATE:
        new_rotation= 0 if rotation==3 else rotation+1       
    #Como hemos puesto enumerate podemos acceder al indice
    for row_index,row in enumerate(screen):
        for column_index,column in enumerate(row):
            if column=="W":
                new_row_index=0
                new_column_index=0
                match movement:
                    case Movement.DOWN:
                        new_row_index=row_index+1
                        new_column_index=column_index
                    case Movement.RIGHT:
                        new_row_index=row_index
                        new_column_index=column_index+1
                    case Movement.LEFT:
                        new_row_index=row_index
                        new_column_index=column_index-1
                    case Movement.ROTATE:
                        new_row_index=row_index+rotations[new_rotation][rotation_item][0]
                        new_column_index=column_index+rotations[new_rotation][rotation_item][1]
                        rotation_item+=1
                if new_row_index>19 or new_column_index>9 or new_row_index<0 or new_column_index<0:
                    #print("\nNo se pude realizar el movimiento\n")
                    return (screen, rotation)
                else:
                    new_screen[new_row_index][new_column_index]="W"
    print_screen(new_screen)
    return (new_screen,new_rotation)

def print_screen(screen:list):
    clear()
    print("\nPantalla tetris:\n")
    print('__________')
    for i in screen:
        print("".join(map(str, i)))
    print('__________')
    

        # define our clear function
def clear():
    # for windows
    if os.name == 'nt':
        _ = os.system('cls')
 
    # for mac and linux(here, os.name is 'posix')
    else:
        _ = os.system('clear')

def capture_events_with_pause():
    event=keyboard.read_event()
    #if event.name=="esc":
    #    break
    if event.event_type==keyboard.KEY_DOWN:
        #print(event.name)
        if event.name=="flecha abajo":
            (screen,rotation)=move_piece(screen,Movement.DOWN,rotation)
        elif event.name=="flecha derecha":
            (screen,rotation)=move_piece(screen,Movement.RIGHT,rotation)
        elif event.name=="flecha izquierda":
            (screen,rotation)=move_piece(screen,Movement.LEFT,rotation)
        elif event.name=="space":
            (screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)


if __name__ == "__main__":
    main()

#rotations=[
#    [(0,0),(1,0),(1,1),(1,2)],
#    '''
#    ["W"," "," ",
#    ["W","W","W",
#    '''
#    [(0,1),(-1,0),(0,-1),(1,-2)]
#    '''
#    ["W","W"," ",
#    ["W"," "," ",
#    ["W"," "," ",
#    '''
#    ]


#(screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)
#(screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)
#(screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)
#(screen,rotation)=move_piece(screen,Movement.ROTATE,rotation)
