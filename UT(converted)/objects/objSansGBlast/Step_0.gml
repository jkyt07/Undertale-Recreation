if image_index >= image_number and alarm[0] <= 0
{
	image_speed = 0
	alarm[0] = 15
}

if image_index >= 3 and laserWidth < 24
{
	laserWidth+=2
}

if laserWidth == 24
{
	objHeart.hit = dmg
	audio_play_sound(snd_hurt, 2, 0)
}

//if point