// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAttackSlash(){

	if(sprite_index != sPlayerAttackSlash) {
		sprite_index = sPlayerAttackSlash;
		local_image_index = 0;
		image_index = 0;
	}
	
	// Update Sprite
	PlayerAnimateSprite();
	// Exit Attack State after animationEnd is set to true by PlayerAnimateSprite();
	if(animationEnd) { 
		state = PlayerStateFree;
		animationEnd = false;
	}
	
}