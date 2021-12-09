if interact
{
	image_index = 1	
}
else if !openText
{
	image_index = 0
}

if choice = 0
{
	audio_play_sound(snd_save, 2, 0)
	choice = -1
}

event_inherited();
