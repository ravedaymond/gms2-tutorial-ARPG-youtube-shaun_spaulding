// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Player tilebased collision. Entity collision designed with constraint in mind: Collideable entities will not overlap
function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	// Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x+hSpeed, y)) {
		x -= x%TILE_SIZE; // Move to left edge of colliding tile
		if(sign(hSpeed) == 1) x += TILE_SIZE-1; // Move to far right of colliding tile
		hSpeed = 0;
		_collision = true;
	 	
	}
	
	// Check for horizontal entities
	var _entityCount = instance_position_list(x+hSpeed, y, oEntity, _entityList, false);
	var _snapX;
	while(_entityCount > 0) {
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision) {
			// Move as close as we can to the entity
			if(sign(hSpeed) == -1) _snapX = _entityCheck.bbox_right+1;
			else _snapX = _entityCheck.bbox_left-1;
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		} else {
			ds_list_delete(_entityList, 0);
			_entityCount--;
		}
	}
	// Commit horizontal movement
	x += hSpeed;
	
	ds_list_clear(_entityList);
	
	// Vertical Tiles
	if(tilemap_get_at_pixel(collisionMap, x, y+vSpeed)) {
		y -= y%TILE_SIZE; // Move to top edge of colliding tile
		if(sign(vSpeed) == 1) y += TILE_SIZE-1; // Move to t he bottom edge of colliding tile
		vSpeed = 0;
		_collision = true;
	}
	
	// Check for vertical entities
	_entityCount = instance_position_list(x, y+vSpeed, oEntity, _entityCount, false);
	var _snapY;
	while(_entityCount > 0) {
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision) {
			// Move as close as we can to the entity
			if(sign(vSpeed) == -1) _snapY = _entityCheck.bbox_bottom+1;
			else _snapY = _entityCheck.bbox_top-1;
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		} else {
			ds_list_delete(_entityList, 0);
			_entityCount--;
		}
	}
	
	// Commit vertical movement
	y += vSpeed;
	
	ds_list_destroy(_entityList);
	
	return _collision;
}