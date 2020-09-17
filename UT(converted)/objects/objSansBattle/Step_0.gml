if hp <= 0 or shownHp <= 0
{
	hp = 1
	shownHp = 1
	dodge = 1
	idle = false
	instance_create_layer(x,y, "FightInstances", objMissHit)
}

if dodge = 1 and x > 650
{
	x-=20
}
else if dodge = 1 and alarm[2] <= 0
{
	dodge = 0 //2
	alarm[2] = 15
	objMissHit.alarm[1] = 1
}

if dodge = 2 and x < startPos
{
	x+=12
}
else if dodge = 2
{
	dodge = 0
	idle = true
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
	endEnemyTurn()	
}


event_inherited();