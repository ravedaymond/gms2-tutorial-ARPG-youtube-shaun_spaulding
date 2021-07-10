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
	
	// Attack key logic
	if(keyAttack) {
		state = PlayerStateAttack;
		stateAttack = PlayerAttackSlash;
	}
	
	// Activate key logic
	if(keyActivate) {
		// 1. Check for entity to activate
		// 2. If there is nothing, or there is something but something has no script
			// 2a. If we aren't carrying something, roll!
			// 2b. If we are carring something, throw it!
		// 3. Else, there is something and it has a script, activate somethings script
			// 3a. If the something being activated is an npc, turn npc to face player
		var _activateX = x+lengthdir_x(10, direction);
		var _activateY = y+lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize, 
			_activateY - _activateSize, 
			_activateX + _activateSize, 
			_activateY + _activateSize, 
			pEntity, 
			false, 
			true, 
			_activateList, 
			false
		);
		
		// If the first instance we find is either our lifted entity or it has no script: try the next one
		while(_entitiesFound > 0) {
			var _check = _activateList[| --_entitiesFound]; // --var substracts 1 from value before returning, var-- returs the value then subtracts 1
			if(_check != global.iLifted && _check.entityActivateScript != -1) {
				activate = _check;
				break;
			}
		}
		ds_list_destroy(_activateList);
		
		if(activate == noone) {
			if(global.iLifted == noone) {
				state = PlayerStateRoll;
				moveDistanceRemaining = distanceRoll;	
			} else {
				PlayerThrow();
			}
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