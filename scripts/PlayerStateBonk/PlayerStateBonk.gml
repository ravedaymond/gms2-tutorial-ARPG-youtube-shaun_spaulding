// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	// Update sprite
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR+2; // Does it this way for later on -- add -2
	
	// Change height
	z = sign(((moveDistanceRemaining/distanceBonk)*pi))*distanceBonkHeight;
	
	
	// Change state
	if(moveDistanceRemaining <= 0) {
		state = PlayerStateFree;	
	}
	
}