/// @description Progress transition
// Lock player in Transition state
with(oPlayer) state = PlayerStateTransition;

if(leading == OUT) {
	// Add the smaller of the two values to percent, prevents going above 1
	percent = min(1, percent+TRANSITION_SPEED);
	if(percent >= 1) { // Screen fully obscured
		room_goto(targetRoom);
		leading = IN;
	}
} else { // leading == IN
	// Add the larger of the two values to percent, prevents going below 0
	percent = max(0, percent-TRANSITION_SPEED);
	if(percent <= 0) { // Screen fully revealed
		with(oPlayer) state = PlayerStateFree; // Restore player state
		instance_destroy();
	}
}