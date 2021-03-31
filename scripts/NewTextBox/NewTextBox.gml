// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_text){
	var _obj;
	if(instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with(instance_create_layer(0, 0, "Instances", _obj)) {
		text = _text;
		if(instance_exists(other)) originInstance = other.id; else originInstance = noone;
		if(argument_count > 1) background = argument[1]; else background = 1;
	}
	
	with(oPlayer) {
		if(state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}