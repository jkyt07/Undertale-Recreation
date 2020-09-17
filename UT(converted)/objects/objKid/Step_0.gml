if interact
{
	if frisk.sprite_index = sprFLR
	{
		if frisk.image_xscale < 0
		{
			sprite_index = sprKidL
		}
		else
		{
			sprite_index = sprKidR
		}
	}
	else if frisk.sprite_index = sprFDown
	{
		sprite_index = sprKidUp	
	}
	
}
else if !openText
{
	sprite_index = sprKidDown
}


event_inherited();

