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
}