function CalcAttack(hitbox) {
	mask_index = hitbox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	if(hits > 0) {
		for(var i = 0; i < hits; i++) {
			// If this instance has not yet been hit by this attack, then hit it
			var hitID = hitByAttackNow[| i];
			// If this hitID was not already hit, add it to the list
			if(ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with(hitID) {
					if(object_is_ancestor(object_index, pEnemy)) {
						PlayerHurtEnemy(id, 5, other.id, 10);
					} else if(entityHitScript != -1) script_execute(entityHitScript);
						// Process hit logic with object being hit
				}
			}
		}
	}
	// Cleanup local ds list
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer;
}

function PlayerHurtEnemy(_enemy, _damage, _source, _knockback) {
	with(_enemy) {
		if(state != ENEMYSTATE.DIE) {
			enemyHP -= _damage;
			flash = 1;
			
			// Hurt or dead?
			if(enemyHP <= 0) {
				state = ENEMYSTATE.DIE;
			} else {
				if(state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if(_knockback != 0) {
				var _knockDirection = point_direction(x, y, _source.x, _source.y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}

function PlayerAttackSlash() {

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

function PlayerAttackSpin() {

}