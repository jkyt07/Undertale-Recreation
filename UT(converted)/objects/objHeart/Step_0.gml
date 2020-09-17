randomize()

if shownHp != friskHp and alarm[5] <= 0
{
	//if shownHp + 2*sign(friskHp - shownHp) >= friskHp
	//{
	//	shownHp+= 2*sign(friskHp - shownHp)
	//}
	//else if shownHp + sign(friskHp - shownHp) >= friskHp
	//{
	//	shownHp+= sign(friskHp - shownHp)
	//}
	alarm[5] = 2
}

if enemy = 0
{
	instance_destroy()
}

if friskHp = 0 or !alive
{
	alive = false
	menuOption = -1
	yourTurn = true
	onMenu = false
	if drawSplit != -2
	{
		if drawSplit = -1
		{
			drawSplit = 0
			audio_stop_all()
			audio_play_sound(snd_break1, 1, 0)
		}
		else if splitCD > 0
		{
			splitCD--
		}
		else if drawSplit < 3 and alarm[11] <= 0
		{
			alarm[11] = 4
		}
		else if alarm[11] <= 0 and alarm[10] <= 0
		{
			alarm[10] = 45	
		}
	}
	else if !instance_exists(objHeartShard) and gameOverAlpha < 1
	{
		gameOverAlpha+=.01
		
		if !audio_is_playing(mus_Determination)
		{
			audio_play_sound(mus_Determination, 1, 1)	
		}
	}
	else if gameOverAlpha = 1 and onText = false
	{
			menuDial = [
@"You cannot give 
up just yet...",
@"Frisk!
Stay determined..."]
			textCur = 0
			textNum = 0
			onText = true
	}
	
	if onText
	{
		if textCur < string_length(menuDial[textNum]) - 1 and alarm[1] < 0
		{
			alarm[1] = 1	
		}
	
		if keyboard_check_pressed(vk_space)
		{
			if textCur < string_length(menuDial[textNum]) - 1 
			{
				textCur = 69420	
			}
			else if textNum < array_length_1d(menuDial) - 1
			{
				textNum++
				textCur = 0
			}	
			else
			{
				onText = false
				if !alive
				{
					game_restart()	
				}
			}
		}
	}
	
	//exit;
}
else
{
	if yourTurn
	{
		x = 162 + 407 * menuOption
		y = 1045 
	
		if onMenu
		{
			if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
			{
				menuOption = clamp(menuOption-1, 0, 3)	
			}
			else if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
			{
				menuOption = clamp(menuOption+1, 0, 3)	
			}
		}
		else if options!= -1
		{
			if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"))
			{
				optionsOption = clamp(optionsOption-1, 0, optionsSize-1)	
			}
			else if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"))
			{
				optionsOption = clamp(optionsOption+1, 0, optionsSize-1)	
			}
			else if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
			{
				optionsOption = clamp(optionsOption-2, 0, optionsSize-1)	
			}
			else if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))
			{
				optionsOption = clamp(optionsOption+2, 0, optionsSize-1)	
			}
			x = 250 + 550*(optionsOption%2)
			y = 630 + 100*floor(optionsOption/2)
		}
	
		if keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("X"))
		{
			if onText
			{
				if textCur < string_length(menuDial[textNum]) - 1 
				{
					textCur = 69420	
				}
				else if textNum < array_length_1d(menuDial) - 1
				{
					textNum++
					textCur = 0
				}	
				else
				{
					onText = false
					if !alive
					{
						game_restart()	
					}
					else if !onMenu
					{
						displayText = false	
						textCur = 0
						textNum = 0
						if enemy.alive
							startEnemyTurn()
					}
				}
			}
			else if onMenu
			{
				onMenu = false
				displayText = false
				textCur = 0
				textNum = 0
				switch(menuOption)
				{
					case 0:
						attacking = true
						shots =  numShots
						attackSpd = irandom_range(7, 9)
						//instance_create_layer(120, 750, "InstancesB", objAttackLine)
						alarm[0] = 5
						turnDmg = 0
						break;
					case 1:
						//startEnemyTurn()
						options = enemy.actOptions
						optionsSize = array_height_2d(enemy.actOptions)
						optionsOption = 0
						usingItem = false
						break;
					case 2:
						options = inventory
						optionsSize = 6 //array_height_2d(inventory)-1
						optionsOption = 0
						usingItem = true
						break;
					case 3:
						showDmg = true
						turnDmg = 99999 *100 / dmg
						enemy.hp-=turnDmg
						enemy.image_index = 2
						instance_create_depth(enemy.x, enemy.y, -10000, objCut)
						break;
				}
				menuOption = -1
			}
			else if ds_list_size(attacks) > 0
			{
				var att = ds_list_find_value(attacks, 0)
					show_debug_message("Attacks: " + string(ds_list_size(attacks)) + " " + string(att))
				//if object_exists(att)
					att.use = true
			}
			else if options != -1 and options[optionsOption, 0] != ""
			{
				menuDial = options[optionsOption, 1]
				displayText = true
				onText = true
				textCur = 0
				textNum = 0
			
				if usingItem
				{
					friskHp = clamp(friskHp + options[optionsOption, 2], 0, friskMaxHp)
					inventory[optionsOption, 0] = ""
					inventory[optionsOption, 1] = 0
					inventory[optionsOption, 2] = 0
					usingItem = false
				}
				else
				{
					enemy.act = optionsOption	
				}
			
				options = -1
				optionsSize = 0
				//onMenu = true
				//menuOption = 0
				//startEnemyTurn()
			
			
			}
		}
	
		if menuDial != 0
		{
			if textCur < string_length(menuDial[textNum]) and alarm[1] < 0
			{
				alarm[1] = 1
			}
			else if onMenu
			{
				onText = false
				//textCur = 0
			}
		}
	
		if alarm[0] <= 0
		{
			if shots > 0
			{
				alarm[0] = irandom_range(8, 45)	
			}
			else if attacking and ds_list_size(attacks) = 0 and !instance_exists(objAttackLine)
			{
					attacking = false
					//onMenu = true
					//menuOption = 0
				
					enemy.hp-=round(dmg*(turnDmg/100))
					showDmg = true
					enemy.attacked++
					//alarm[2] = 60
					instance_create_layer(enemy.x, enemy.y, "FightInstances", hitType)
					if enemy.hp > 0
					{
						enemy.startAtt = true
						startEnemyTurn()	
					}
					
					audio_play_sound(snd_damage, 3, 0)
			}	
		}
	}
	else
	{
		var moveHoriz = (keyboard_check(ord("D")) + keyboard_check(vk_right)) - (keyboard_check(ord("A")) + keyboard_check(vk_left))
		var moveVert = (keyboard_check(ord("S")) + keyboard_check(vk_down)) - (keyboard_check(ord("W")) + keyboard_check(vk_up))
	
		if moveHoriz !=0
		{
			dir = sign(moveHoriz)*-1 + 1
			if x+wlkSpd*moveHoriz < 880 + 240 - 19 and x+wlkSpd*moveHoriz > 880 - 240 + 20
			{
				x+=wlkSpd*moveHoriz
			}
			//else while((x+wlkSpd < 880 + 60 or x+wlkSpd < 880 - 40))
			//{
			//	x+=moveHoriz	
			//}
		}
		if moveVert !=0
		{
			dir = sign(moveVert)*-1 + 1
			if y+wlkSpd*moveVert < 890 - 19 and y+wlkSpd*moveVert > 570 + 25
			{
				y+=wlkSpd*moveVert
			}
			//else while((y+wlkSpd < 890 or y+wlkSpd > 575))
			//{
			//	y+=moveVert	
			//}
		}
	
		if hit >= 0 and !invuln
		{
			friskHp = clamp(friskHp - hit, 0, friskMaxHp)
			invuln = true
			alarm[3] = 30
		}
		hit = -1
	
		if invuln and alarm[4] <= 0
		{
			alarm[4] = 5	
		}
		else if !invuln
		{
			image_index = 0	
		}
	}

	if showDmg
	{
		if !(enemy.hp > enemy.shownHp) and alarm[2] < 0
		{
			alarm[2] = 40	
		}
	}
}
