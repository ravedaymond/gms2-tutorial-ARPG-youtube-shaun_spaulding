// Must be fairly simple for the stretch to work.
function NineSliceBoxStretched(sprite, x1, y1, x2, y2, index) {
	
	var size = sprite_get_width(sprite) / 3;
	var w = x2-x1;
	var h = y2-y1;
	
	// Middle
	draw_sprite_part_ext(sprite, index, size, size, 1, 1, x1+size, y1+size, w-(size*2), h-(size*2), c_white, 1);
	
#region CORNERS
	// Top Left
	draw_sprite_part(sprite, index, 0, 0, size, size, x1, y1);
	// Top Right
	draw_sprite_part(sprite, index, size*2, 0, size, size, x1+w-size, y1);
	// Bottom Left
	draw_sprite_part(sprite, index, 0, size*2, size, size, x1, y1+h-size);
	// Bottom Right
	draw_sprite_part(sprite, index, size*2, size*2, size, size, x1+w-size, y1+h-size);
#endregion
#region EDGES
	// Left Edge
	draw_sprite_part_ext(sprite, index, 0, size, size, 1, x1, y1+size, 1, h-(size*2), c_white, 1);
	// Right Edge
	draw_sprite_part_ext(sprite, index, size*2, size, size, 1, x1+w-size, y1+size, 1, h-(size*2), c_white, 1);
	// Top Edge
	draw_sprite_part_ext(sprite, index, size, 0, 1, size, x1+size, y1, w-(size*2), 1, c_white, 1);
	// Bottom Edge
	draw_sprite_part_ext(sprite, index, size, size*2, 1, size, x1+size, y1+h-size, w-(size*2), 1, c_white, 1);
#endregion
}