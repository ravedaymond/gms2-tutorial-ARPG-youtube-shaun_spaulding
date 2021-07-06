/// @description Draw Player and Shadow

draw_sprite(sShadow, 0, x, y);
draw_sprite_ext(
	sprite_index, 
	image_index, 
	x,
	y-z,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);