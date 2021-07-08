/// @description Global Entity Loop - Control Pause, Flashing, and Liftable
if(!global.gamePaused) {
	depth = -bbox_bottom;
	if(lifted && instance_exists(oPlayer)) {
		if(oPlayer.sprite_index != sPlayerLift) {
			x = oPlayer.x;
			y = oPlayer.y;
			z = LIFTABLE_HEIGHT;
			depth = oPlayer.depth-1;
		}
	}	
}

// Reduce flash by 0.04 until smaller than 0, then remain 0.
if(flash > 0) flash = max(flash-0.04, 0);