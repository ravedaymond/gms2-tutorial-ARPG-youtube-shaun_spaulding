// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	
	var _totalFrames = sprite_get_number(sprite_index)/4; // Divided by number of animations inside sprite.
	image_index = local_image_index + (CARDINAL_DIR*_totalFrames);
	local_image_index += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	// If animation would loop on next game step
	if(local_image_index >= _totalFrames) {
		animationEnd = true;
		local_image_index -= _totalFrames;
	} else {
		animationEnd = false;	
	}
	
}