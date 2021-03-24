/// @description 
randomize();

global.gamePaused = false;
global.camera = instance_create_layer(0,0, layer, oCamera);


room_goto(ROOM_START);