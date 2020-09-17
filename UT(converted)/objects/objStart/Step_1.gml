if frisk.start = start
{
	if start < 10
	{
		frisk.x = x
		frisk.y+= offset
	}
	else
	{
		frisk.y = y	
		frisk.x+= offset
	}
}
else if start = 0 and frisk.start = 99
{
	frisk.x = x
	frisk.y = y
}
instance_destroy()