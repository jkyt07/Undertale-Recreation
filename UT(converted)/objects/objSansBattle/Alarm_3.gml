if idle
{
	if animLeft
	{
		animOffsetX--
		if animOffsetX < 0
		{
			animOffsetY--	
		}
		else
		{
			animOffsetY++	
		}
	}
	else
	{
		animOffsetX++
		if animOffsetX > 0
		{
			animOffsetY--	
		}
		else
		{
			animOffsetY++	
		}
	}
	if animOffsetX <= -3 or animOffsetX >= 3
	{
		animLeft = !animLeft	
	}	
}