textCur++

//if !audio_is_playing(snd_txt2)

if string_ord_at(text[textNum], textCur - 1) != ord(" ") and string_ord_at(text[textNum], textCur - 1) != ord("*")
{
	if inter.object_index = objSans
	{
		audio_play_sound(snd_txtSnans1, 3, 0)
	}
	else
	{
		audio_play_sound(snd_txt1, 3, 0)
	}
}