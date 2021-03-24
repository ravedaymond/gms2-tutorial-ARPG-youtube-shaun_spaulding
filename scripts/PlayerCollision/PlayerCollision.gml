// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	
	// Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x+hSpeed, y)) {
		x -= x%TILE_SIZE; // Move to left edge of colliding tile
		if(sign(hSpeed) == 1) x += TILE_SIZE-1; // Move to far right of colliding tile
		hSpeed = 0;
		_collision = true;
	 	
	}
	x += hSpeed;
	
	// Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x, y+vSpeed)) {
		y -= y%TILE_SIZE; // Move to top edge sof colliding tile
		if(sign(vSpeed) == 1) y += TILE_SIZE-1;
		vSpeed = 0;
		_collision = true;
	}
	y += vSpeed;
	
	return _collision;
}