/// @description Set Up Camera

camera = view_camera[0];
follow = oPlayer;

viewWidthHalf = camera_get_view_width(camera)*0.5;
viewHeightHalf = camera_get_view_height(camera)*0.5;

xTo = xstart;
yTo = ystart;

shakeLength = 0; // How many frames to last
shakeMagnitude = 0; // How strong
shakeRemain = 0; // Remaining
