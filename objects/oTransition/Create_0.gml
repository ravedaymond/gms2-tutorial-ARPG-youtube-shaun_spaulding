/// @description 

enum TRANSITION_TYPE {
	SLIDE,
	FADE,
	PUSH,
	STAR,
	WIPE
}

width = RESOLUTION_W;
height = RESOLUTION_H;
heightHalf = (height*0.5)+1; // Added +1 for overlap cover
percent = 0;
leading = OUT;

type = TRANSITION_TYPE.SLIDE;
targetRoom = -1;