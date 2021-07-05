// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @desc

function DialogueResponses(_selectedResponse){
	switch(_selectedResponse) {
		case 0: break;
		case 1: NewTextBox("Selected Response A."); break;
		case 2: NewTextBox("Selected Response B. Further response?", 1, ["3:Yes","0:No"]); break;
		case 3: NewTextBox("Second response received."); break;
		default: show_debug_message("DialogeResponses: default triggered"); break;
	}
}