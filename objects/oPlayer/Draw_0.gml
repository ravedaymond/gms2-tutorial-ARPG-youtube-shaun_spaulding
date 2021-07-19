/// @description Draw Player and Shadow
draw_sprite(sShadow, 0, x, y);
// Every 8 frames invulnerable will be 0 and will countdown from 8 -> 0 every 8 frames. 
// For every 3 frames every 8, 2,1,0 becomes true
// Mod ensures it follows a specific pattern. 
// Mod 8 ==> 0,7,6,5,4,3,2,1,0,7,6,5,4,3,2,1,0
// Mod 4 ==> 0,3,2,1,0,3,2,1,0
// Mod 2 ==> 0,1,0,1,0,1,0,1,0
// Mod pattern allows you to setup a repeating value
if(invulnerable != 0 && (invulnerable % 8 < 2) == 0 && flash == 0) {
	// skip draw
} else {
	if(flash != 0) {
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
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
	
	if(shader_current() != -1) shader_reset();
}