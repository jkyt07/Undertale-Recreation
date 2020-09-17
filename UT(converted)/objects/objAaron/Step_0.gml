randomize()

event_inherited()

//if shownHp <=0 
//{
//	//objHeart.yourTurn = 0
//	objHeart.menuOption = -1
//	image_index = 1
//	if alarm[0] <=0
//	{
//		alarm[0] = 90
//	}
//}
if shownHp > 0 //else //if alarm[0] <= 0
{
	if startAtt
	{
		if alarm[1] <= 0
		{
			alarm[1] = 30 * 12
		}
	
		if attCD <= 0
		{
			//nextAtt = 1
			switch(nextAtt)
			{
				case 0:
					if muscleRight
					{
						var muscle = instance_create_layer(880 - 240, 890 - 30, "FightInstances", objAaronMuscleAtt)
					}
					else
					{
						var muscle = instance_create_layer(880 - 240 + 490, 890 - 30, "FightInstances", objAaronMuscleAtt)
						muscle.image_xscale*=-1
					}
					ds_list_add(attacks, muscle)
					attCD = 75
					muscleRight = !muscleRight
					break;
				case 1:
					var sweat = instance_create_layer(845 - 240, 547, "FightInstances", objAaronSweatAtt)
					var sweatWall = irandom_range(0,3)
					switch(sweatWall)
					{
						case 0:
							sweat.direction = irandom_range(270 + 45, 270 + 180 - 45)
							sweat.y+= irandom_range(10, 301)
							break;
						case 1:
							sweat.direction = irandom_range(180 + 45, 360 - 45)
							sweat.x+= irandom_range(10, 469)
							break;
						case 2:
							sweat.direction = irandom_range(90 + 45, 270 - 45)
							sweat.y+= irandom_range(10, 301)
							sweat.x+=544
							break;
						case 3:
							sweat.direction = irandom_range(0 + 45, 180 - 45)
							sweat.x+= irandom_range(10, 469)
							sweat.y+=371
							break;
					}
					sweat.image_angle = direction + 90
					ds_list_add(attacks, sweat)
					attCD = 12
					break;
			}
		}
		attCD--
	}
	
	if act >= 0
	{
		switch(act)
		{
			case 1:
				nextAtt = 0
				att++
				objHeart.dmg++
				switch(att)
				{
					case 8:
						actOptions[1, 1] = [
@"* You flex harder. 
* Aaron flexes thrice as hard. 
* ATTACK increases for you two."]
						break;
					case 9:
						actOptions[1, 1] = [
@"* You flex. 
* Aaron flexes very hard... 
* He flexes himself out of the room!"]
						break;
					case 10:
						direction = 90
						alive = false
						//speed = 3
						//if alarm[0] <=0
						//{
						//	alarm[0] = 120
						//}
						break;
				}
				break;
			default:
				nextAtt = 1
		}
		act = -1
	}
	
	if direction = 90 and objHeart.displayText = false and alarm[0] <=0
	{
		//alive = false
		speed = 4
		alarm[0] = 120
	}
	
	//if shownHp-2 >= hp
	//{
	//	shownHp-= 2	
	//}
	//else if shownHp - 1 >= hp
	//{
	//	shownHp--
	//}
}

if image_index < 2
image_index = objHeart.showDmg or instance_exists(objCut) or hp <= 0