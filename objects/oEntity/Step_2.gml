/// @description Global Entity Loop - Control Pause, Flashing, and Liftable
if(!global.gamePaused) {
	depth = -bbox_bottom;
	if(lifted && instance_exists(oPlayer)) {
		if(oPlayer.sprite_index != sPlayerLift) {
			x = oPlayer.x;
			y = oPlayer.y;
			z = LIFTED_HEIGHT;
			depth = oPlayer.depth-1;
		}
	}
	
	if(!lifted) {
		if(thrown) {
			// Travel 3 pixels per throw distance every step
			throwDistanceTravelled = min(throwDistanceTravelled+THROWN_SPEED, throwDistance);
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			if(tilemap_get_at_pixel(collisionMap, x, y) > 0) {
				thrown = false;
				grav = 0.1;
			}
			// Value between zero and one minus the starting arc percentage, that is equivalent to travelled distance divided by total distance
			throwPercent = throwStartPercent + lerp(0, 1-throwStartPercent, throwDistanceTravelled/throwDistance);
			z = throwPeakHeight*sin(throwPercent*pi);
			if(throwDistance == throwDistanceTravelled) {
				thrown = false;
				if(entityThrowBreak) instance_destroy();
			}
		} else {
			// Fall back to earth if above zero Z
			if(z > 0) {
				z = max(z-grav, 0);
				grav += 0.1;
				if(z == 0 && entityThrowBreak) instance_destroy();
			} else {
				grav = 0.1;
			}
		}
	}
}

// Reduce flash by 0.04 until smaller than 0, then remain 0.
if(flash > 0) flash = max(flash-0.04, 0);