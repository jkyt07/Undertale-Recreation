if interact
{
	talked = true	
}

if !openText and talked and dialogue != altDialogue and alarm[0] <= 0//interact
{
	alarm[0] = 2
}


if choice = 0
{
	nextEnemy = objSansBattle
	frisk.alarm[1] = 1
	frisk.fightStart = true
	choice = -1
}

event_inherited();
if y < frisk.y
{
	objStand.layer = layer_get_id("InstancesA")
	layer = layer_get_id("InstancesA")
}
else
{
	objStand.layer = layer_get_id("InstancesB")
	layer = layer_get_id("InstancesA")
}