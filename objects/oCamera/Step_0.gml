/// @description Update camera
if(instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update Object position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

// Keep camera centered inside room
x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);

// Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);
// Remove one tenth of the shake magnitude from shake remain
shakeRemain = max(0, shakeRemain-((1/shakeLength)*shakeMagnitude));

camera_set_view_pos(camera, x-viewWidthHalf, y-viewHeightHalf);