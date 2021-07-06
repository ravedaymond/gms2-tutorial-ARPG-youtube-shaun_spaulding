/// @description Use passed hitbox to check for collisions
/// @arg hitbox The sprite hitbox to check for collisions
function CalcAttack(hitbox){
	mask_index = hitbox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oEntity, hitByAttackNow, false);
	if(hits > 0) {
		for(var i = 0; i < hits; i++) {
			// If this instance has not yet been hit by this attack, then hit it
			var hitID = hitByAttackNow[| i];
			// If this hitID was not already hit, add it to the list
			if(ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with(hitID) {
					// Process hit logic with object being hit
					image_blend = c_red;
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sPlayer;
}