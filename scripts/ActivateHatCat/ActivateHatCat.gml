function ActivateHatCat() {
	var _hasHat = (global.iLifted != noone && global.iLifted.object_index == oHat);
	switch(global.questStatus[? "TheHatQuest"]) {
		case 0: // not started
			if(_hasHat) { // Player might have had hat anyways
				// Complete Quest
				NewTextBox("You found it! My hat!", 2);
				NewTextBox("I was just about to\nlook for an adventurer to help out.", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with(oHat) instance_destroy();
				with(oNpcQuest) sprite_index = sQuestyHat;
				global.iLifted = noone;
				with(oPlayer) {
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			} else {
				// Offer Quest
				NewTextBox("Hello there! You look like a brave adventurer,\nwhat with the cape and all.", 2)
				NewTextBox("Could you help me find my missing hat?",2, ["4:Of Course!", "5:This task is beneath me."]);
			}
		break;
		case 1: // in progress
			if(_hasHat) {
				// Complete Quest
				NewTextBox("You found it! My hat!", 2);
				NewTextBox("Thanks for helping me out with that.", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with(oHat) instance_destroy();
				with(oNpcQuest) sprite_index = sQuestyHat;
				global.iLifted = noone;
				with(oPlayer) {
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			} else {
				// Clue / Reminder
				NewTextBox("I think I left my hat in that scary\ncave to the north east.", 2);
				NewTextBox("You might need some items to get there!", 2);
			}
		break;
		case 2:
			// Quest is already completed
			NewTextBox("Hey! Thanks again for getting\nmy hat back!", 2);
		break;
	}
	
}