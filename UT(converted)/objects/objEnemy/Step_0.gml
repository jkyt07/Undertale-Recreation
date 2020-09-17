randomize()

if shownHp <=0 
{
	alive = false
	//objHeart.yourTurn = 0
	objHeart.menuOption = -1
	image_index = 1
	if alarm[0] <=0
	{
		alarm[0] = 90
	}
}
else //if alarm[0] <= 0
{	
	if shownHp-2 >= hp
	{
		shownHp-= 2	
	}
	else if shownHp - 1 >= hp
	{
		shownHp--
	}
}

//image_index = objHeart.showDmg or instance_exists(objCut) or hp <= 0