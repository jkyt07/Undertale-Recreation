while direction < 0
{
	direction+=360	
}

direction = direction%360

//if abs(direction - 270) > 8 and alarm[0] <= 0
//{
//	alarm[0] = 1
//}

//if speed > 1.5
//{
//	speed-= .01 
//}

if abs(direction - 270) > 8
{
	if direction > 90 and direction < 270
	{
		direction++	
	}
	else if direction <= 90 or direction > 270
	{
		direction--	
	}
}