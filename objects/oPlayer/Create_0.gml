/// @description 
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
image_speed = 0;

state = PlayerStateFree;
lastState = state;
stateAttack = PlayerAttackSlash;
hitByAttack = -1;

hSpeed = 0;
vSpeed = 0;

speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;

invulnerable = 0;

flash = 0;
flashShader = shWhiteFlash

animationEndScript = -1;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
local_image_index = 0;

// Handle room transition placement
if(global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}