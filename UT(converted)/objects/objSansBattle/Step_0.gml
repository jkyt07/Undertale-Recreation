if hp <= 0 or shownHp <= 0
{
	hp = 1
	shownHp = 1
	animDodge = 1
	idle = false
	instance_create_layer(x,y, "FightInstances", objMissHit)
}

if animDodge = 1 and x > 650
{
	x-=20
}
else if animDodge = 1 and alarm[2] <= 0
{
	animDodge = 0 //2
	alarm[2] = 15
	objMissHit.alarm[1] = 1
}

if animDodge = 2 and x < startPos
{
	x+=12
}
else if animDodge = 2
{
	show_debug_message("dodge animation end")
	animDodge = 0
	idle = true
	startEnemyTurn()
}

if idle 
{
	if alarm[3] <= 0
	{
		//if animLeft
		//{
		//	animOffsetX--
		//	if animOffsetX < 0
		//	{
		//		animOffsetY--	
		//	}
		//	else
		//	{
		//		animOffsetY++	
		//	}
		//}
		//else
		//{
		//	animOffsetX++
		//	if animOffsetX > 0
		//	{
		//		animOffsetY--	
		//	}
		//	else
		//	{
		//		animOffsetY++	
		//	}
		//}
		//if animOffsetX <= -4 or animOffsetX >= 4
		//{
		//	animLeft = !animLeft	
		//}
		alarm[3] = 6
	}
}
else
{
	animLeft = true
	animOffsetX = 0
	animOffsetY = 0
}

if startAtt
{
	for(var i = 0; i < 8; i++)
	{
		with(instance_create_layer(objHeart.x + lengthdir_x(300, i*45), objHeart.y + lengthdir_y(300, i*45), "FightInstances", objSansGBlast))
		{
			direction = i*45
			//if direction % 90 = 0
			//{
			//	x = objHeart.x + lengthdir_x(350, i*45)
			//}
			image_angle = direction + 270
		}
	}
	startAtt = false
	//endEnemyTurn()	
}


event_inherited();