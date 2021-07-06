/// @description Fragment movement
if(!global.gamePaused) {
	// Bounce
	if(bounceCount != 0) {
		bounce += (pi*bounceSpeed);
		if(bounce > pi) { 
			bounce -= pi; // Prevent bounce from following sin wave below y=0;
			bounce *= 0.06; // Reduce height every bounce
			bounceCount--;
		}
		z = sin(bounce)*bounceHeight; // abs(sin()) is a way of locking it y positive
	} else z = 0;
	
	// Deteriorate
	deteriorate++;
	if(deteriorate > deteriorateAfter) {
		image_alpha -= 1/deteriorateTime;
		if(image_alpha <= 0) instance_destroy();
	}
	
	// Friction
	fric = 0.05; // Air fric
	if(z == 0) fric = 0.10; // Higher fric when hitting ground
	
	// Move
	x += lengthdir_x(spd, direction);
	y += lengthdir_y(spd, direction);	
	
	// React to tile collision by setting speed to 0
	if(tilemap_get_at_pixel(collisionMap, x, y) > 0) spd = 0;
	
	// Apply Friction
	spd = max(spd-fric, 0);
	
}