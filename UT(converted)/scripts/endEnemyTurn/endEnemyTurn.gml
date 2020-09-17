function endEnemyTurn() 
{
	with(objHeart)
	{
		yourTurn = true
		onMenu = true
		menuOption = 0
		viewable = true
		displayText = true
		onText = true
		//textCur = 0
		//textNum = 0
	}

	startAtt = false
	attCD = 0
	//nextAtt = irandom_range(0, 1)

	for(var i = 0; i < ds_list_size(attacks); i++)
	{
		instance_destroy(ds_list_find_value(attacks, i))	
	}


}
