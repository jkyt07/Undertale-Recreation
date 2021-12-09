image_index = frisk.image_index

x = frisk.x
y = frisk.y + 50

if x >= 910  and x <= 1480 and y < 960
{
	visible = true
	if objFrisk.image_speed != 0 and alarm[0] <= 0
	{
		alarm[0] = 20
	}
}
else
{
	visible = false	
}
