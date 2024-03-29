/// @description 
randomize();

global.gamePaused = false;

global.textSpeed = 0.75;

// Room transitions
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

// Player Globals
global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;

// Quests
global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

// Entiy Globals
global.iLifted = noone;

global.iCamera = instance_create_layer(0, 0, layer, oCamera);
global.iUI = instance_create_layer(0, 0, layer, oUI);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);