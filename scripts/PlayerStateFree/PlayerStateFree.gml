// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	// Movement
	hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection);

	PlayerCollision();

	// Update Sprite Index
	var sprite_current = sprite_index;
	if(inputMagnitude != 0) {
		direction = inputDirection;
		sprite_index = spriteRun;
	} else {
		sprite_index = spriteIdle;
	}
	if(sprite_current != sprite_index) local_image_index = 0;

	// Update Image Index
	PlayerAnimateSprite();
	
	// Activate key logic
	if(keyActivate) {
		// 1. Check for entity to activate
		// 2. If there is nothing, or there is something but something has no script
		// 2a. Roll
		// 2b. Else, there is something and it has a script, activate somethings script
		// 2c. If the something being activated is an npc, turn npc to face player
		
		var _activateX = lengthdir_x(10, direction);
		var _activateY = lengthdir_y(10, direction);
		activate = instance_position(x+_activateX, y+_activateY, oEntity);
		
		if(activate == noone || activate.entityActivateScript == -1) {
			state = PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;
		} else {
			script_execute_array(activate.entityActivateScript, activate.entityActivateArgs);
			
			if(activate.entityNPC) {
				with(activate) {
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
		
	}
}