// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @arg Message
/// @arg Background
/// @arg Responses[]
function NewTextBox(_text){
	var _obj;
	if(instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with(instance_create_layer(0, 0, "Instances", _obj)) {
		text = _text;
		if(instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if(argument_count > 1) background = argument[1]; else background = 1;
		if(argument_count > 2) {
			// Trim responses string
			responseMessages = argument[2];
			for(var i = 0; i < array_length(responseMessages); i++) {
				// Target ':' to split response messages
				var _markerPosition = string_pos(":", responseMessages[i]);
				// Copy number identifier for response 
				responseScripts[i] = string_copy(responseMessages[i], 1, _markerPosition-1);
				responseScripts[i] = real(responseScripts[i]);
				responseMessages[i] = string_delete(responseMessages[i], 1, _markerPosition);
			}
		} else { 
			responseMessages = [-1];
			responseScripts = [-1];
		}
	}
	
	with(oPlayer) {
		if(state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}