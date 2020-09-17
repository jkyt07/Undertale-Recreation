//show_debug_message(string(direction))
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