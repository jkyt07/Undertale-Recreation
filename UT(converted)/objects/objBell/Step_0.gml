if interact and alarm[0] <= 0
{
	image_speed = 1
	alarm[0] = 30
	for(var i = instance_number(objLily); i >= 0 ; i--)
    {
		instance_destroy(instance_find(objLily, i))
    }
	for(var i = instance_number(objLilyFlower); i >= 0 ; i--)
    {
		instance_destroy(instance_find(objLilyFlower, i))
    }
	
	for(var i = 0; i < 2; i++)
	for(var j = 0; j < 2; j++)
	instance_create_layer(1400 + 160*i, 840+160*j, "InstancesA", objLily)
	
	interact = false
}
	
	