/// @description 
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
image_speed = 0;

state = PlayerStateFree;

hSpeed = 0;
vSpeed = 0;

speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
local_image_index = 0;