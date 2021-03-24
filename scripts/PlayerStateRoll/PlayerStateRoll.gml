// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	
	if(PlayerCollision()) {
		// Bonk animation / screen shake
	}
	
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	// Set image index based on how much left of the roll is there
	// Programatic animation of rolling. Min prevents 6th index frame from showing start of next animation.
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1-(moveDistanceRemaining / distanceRoll)) * _totalFrames), _totalFrames-1);
	
	// Change state
	if(moveDistanceRemaining <= 0) {
		state = PlayerStateFree;	
	}
}