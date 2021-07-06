// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAttackSlash(){

	// First step in state
	if(sprite_index != sPlayerAttackSlash) {
		// Set up sprite animation
		sprite_index = sPlayerAttackSlash;
		local_image_index = 0;
		image_index = 0;
		
		// Clear hit list
		if(!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(sPlayerAttackSlashHB);
		
	// Update Sprite
	PlayerAnimateSprite();
	
	// Note: To manage multiple hits in a single sprite animation this is where you would
	// clear the hit list if image_index >= to a reset frame for another hit in the same animation
	
	
	// Exit Attack State after animationEnd is set to true by PlayerAnimateSprite();
	if(animationEnd) { 
		state = PlayerStateFree;
		animationEnd = false;
	}
	
}