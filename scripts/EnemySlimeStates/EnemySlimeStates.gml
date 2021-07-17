// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemySlimeWander(){
	sprite_index = sprMove;
	
	// At destination or given up?
	if((x == xTo && y == yTo) || (timePassed > enemyWanderDistance / enemySpeed)) {
		hSpeed = 0;
		vSpeed = 0;
		// End our move animation after it's next loop
		if(image_index < 1) {
			image_speed = 0.0;
			image_index = 0;
		}
		
		// Set new target destination
		if(++wait >= waitDuration) {
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + random_range(-45, 45); // Point towards new direction and add variation of -45 to 45 deg
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	} else { // Move towards new destination
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if(_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo; // If the distance left is less than speed, prevent overshooting the distance by setting speed to distanceleft
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if(hSpeed != 0) image_xscale = sign(hSpeed); // Control x flip based on dir
		
		// Collide & move
		EnemyTileCollision();
		
	}
	
	// Check for aggro
	if(++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if(instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) <= enemyAggroRadius) {
			state = ENEMYSTATE.CHASE;
			target = oPlayer; // For the tutorial, is pretty much never used. Was added for flexibility
			// with the entity system that isn't really needed for the purpose of the tutorial
		}
	}
}

function EnemySlimeChase(){
	sprite_index = sprMove;
	
	if(instance_exists(target)) {
		xTo = target.x;
		yTo = target.y;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if(_distanceToGo > enemySpeed) {
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		} else {
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		// Collide & Move
		EnemyTileCollision();
	}
	
	
	// Check if close enough to attack
	if(instance_exists(target) && point_distance(x, y, target.x, target.y) <= enemyAttackRadius) {
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		// Set xTo and yTo prior to entering attack state
		// Overshoot through player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
	}
	
}

function EnemySlimeAttack(){
	// How fast to move
	var _spd = enemySpeed;
	
	// Don't move while getting ready to jump
	if (image_index < 2) _spd = 0;
	
	// Freeze animation while in mid-air and also after landing finishes
	if(floor(image_index) == 3 || floor(image_index) == 5) image_speed = 0;
	
	// How far we have to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	// Begin landing and end of animation once we're nearly done
	if(_distanceToGo < 4) {
		image_speed = 1.00;	
	}
	
	// Move
	if(_distanceToGo > _spd) {
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if(hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Commit to move and stop moving if we hit a wall
		if(EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if(floor(image_index) == 5) {
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}

function EnemySlimeHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if(_distanceToGo > enemySpeed) {
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if(hSpeed != 0) image_xscale = -sign(hSpeed); // Face opposite of bounce/knockback direction
		
		// Collide & Move
		if(EnemyTileCollision()) {
			xTo = x;
			yTo = y;
		}
	} else {
		x = xTo;
		y = yTo;
		if(statePrevious != ENEMYSTATE.ATTACK) state = statePrevious;
		else state = ENEMYSTATE.CHASE;
	}
}

function EnemySlimeDie(){

}