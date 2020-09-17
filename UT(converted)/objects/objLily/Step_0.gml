if interact and !placed
{
	carried = true
	isSolid = false
	layered = false
	layer = layer_get_id("InstancesB")
	x = round((x - 40) / 80) * 80 + 40
	y = round((y - 40) / 80) * 80 + 40
	//interact = false
}

if placed and speed != 0 and (!place_meeting(x + lengthdir_x(speed + 80, direction), y + lengthdir_y(speed + 80, direction), objWater) or place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), objLily))
{
	nextLily = instance_place(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), objLily)
	if nextLily != noone
	{
		numLine = nextLily.numLine +1	
	}
	else
	{
		numLine = 1	
	}
	speed = 0
	//image_speed = 1
	x = round((x - 40) / 80) * 80 + 40
	y = round((y - 40) / 80) * 80 + 40
}

if nextLily != 0 and nextLily != noone
{
	nextLily.numLine = numLine	
}
if numLine = 4
{
	image_speed = 1	
}
if image_index = 7
{
	image_speed = 0	
	instance_create_layer(x,y, "InstancesA", objLilyFlower)
	instance_destroy()
}

if carried
{
	x = frisk.x
	y = frisk.y - 40
	image_xscale = frisk.image_xscale
	image_yscale = frisk.image_yscale
	direction = frisk.dir*90
	if place_meeting(x + lengthdir_x(79, direction), (round(frisk.y / 80) * 80 + 40) + lengthdir_y(79, direction), objWater) and (keyboard_check_pressed(vk_space) or keyboard_check(ord("X")))
	{
		placed = true
		carried = false
		y = (round(frisk.y / 80) * 80 + 40) + lengthdir_y(79, direction)
		x+=lengthdir_x(79, direction)
		speed = 4
		layer = layer_get_id("InstancesA")
	}
}

if layered
if y < frisk.y
{
	layer = layer_get_id("InstancesA")	
}
else
{
	layer = layer_get_id("InstancesB")	
}