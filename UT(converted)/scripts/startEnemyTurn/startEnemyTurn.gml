function startEnemyTurn() {
		show_debug_message("Starting attack " + string(self.object_index) + " " + string(objHeart.object_index))
	with(objHeart)
	{
		if enemy.alarm[0] <= 0
		{
			yourTurn = false
			x = 880
			y = 735
			enemy.startAtt = true
		}
	}
}
