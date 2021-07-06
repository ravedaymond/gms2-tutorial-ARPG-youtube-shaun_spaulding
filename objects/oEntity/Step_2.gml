/// @description Global Entity Loop
if(!global.gamePaused) depth = -bbox_bottom;

// Reduce flash by 0.04 until smaller than 0, then remain 0.
if(flash > 0) flash = max(flash-0.04, 0);