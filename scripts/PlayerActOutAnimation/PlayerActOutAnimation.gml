/// @desc Carry out an arbitrary animation and optionally carry out a script when the animation ends
/// @arg sprite
/// @arg endScript
function PlayerActOutAnimation(_sprite){
	state = PlayerStateAct;
	sprite_index = _sprite;
	if(argument_count > 1) animationEndScript = argument[1];
	local_image_index = 0;
	image_index = 0;
	PlayerAnimateSprite();
}