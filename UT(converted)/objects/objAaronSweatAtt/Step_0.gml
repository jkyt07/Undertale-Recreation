image_angle = direction + 90
direction = direction%360

if y < 547 - sprite_height or x < 632 - sprite_width or y > 898 + sprite_height or x > 1120 + sprite_width
{
	instance_destroy()	
}

if abs(direction - 270) > 5
{
	alarm[0] = 1
}