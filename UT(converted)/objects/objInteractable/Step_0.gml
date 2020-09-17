if layered
if y < frisk.y
{
	layer = layer_get_id("InstancesA")	
}
else
{
	layer = layer_get_id("InstancesB")	
}

if interact
{
	if dialogue != 0
	{
		text = dialogue
		openText = true
	}
	interact = false
}