/// @description Entity default drawing
// Draw shadow
if(entityShadow) draw_sprite(sShadow, 0, floor(x), floor(y));

// Assign flash shader
if(flash != 0) {
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

// Draw sprite with z
draw_sprite_ext(
	sprite_index, 
	image_index, 
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);

// Reset shader
if(shader_current() != -1) shader_reset();
