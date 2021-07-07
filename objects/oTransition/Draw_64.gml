/// @description 

// Could condense to switch statement
if(type == TRANSITION_TYPE.SLIDE) {
	draw_set_color(c_black);
	// As percent increases, get closer from height of 0
	// to being half our screen height.
	// Top of screen to middle.
	draw_rectangle(0, 0, width, percent*heightHalf, false);
	// As percent increases, get further from the height
	// to being half our screen height.
	// Bottom of screen to middle
	draw_rectangle(0, height, width, height-(percent*heightHalf), false);
}

if(type == TRANSITION_TYPE.FADE) {
	//draw_set_alpha()
}