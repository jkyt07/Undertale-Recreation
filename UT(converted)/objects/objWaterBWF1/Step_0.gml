if y < frisk.y
{
	layer = layer_get_id("InstancesA")	
}
else
{
	layer = layer_get_id("InstancesB")	
}

if place_meeting(x,y, objFrisk)
{
	visible = false	
}
else
{
	visible = true	
}