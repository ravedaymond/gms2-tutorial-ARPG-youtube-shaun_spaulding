/// @description Draw Textbox and message text
NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_set_font(fText);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

// Prepare text to draw
var _print = string_copy(text, 1, textProgress);
// If the response messages have initialized 
if(responseMessages[0] != -1 && textProgress >= string_length(text)) {
	
	// Loop through all messages in response and draw each
	// Add a '> ' and ' <' to the left and right side indicating
	// current selected response
	for(var i=0; i<array_length(responseMessages); i++) {
		_print += "\n";
		if(i == responseSelected) _print += "> ";
		_print += responseMessages[i];
		if(i == responseSelected) _print += " <";
	}
}

// Draw text
draw_text((x1+x2)*0.5, y1+8, _print);
draw_set_color(c_white);
draw_text((x1+x2)*0.5, y1+7, _print);

