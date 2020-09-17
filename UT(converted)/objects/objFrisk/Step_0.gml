var moveHoriz = (keyboard_check(ord("D")) + keyboard_check(vk_right)) - (keyboard_check(ord("A")) + keyboard_check(vk_left))
var moveVert = (keyboard_check(ord("S")) + keyboard_check(vk_down)) - (keyboard_check(ord("W")) + keyboard_check(vk_up))
var moveHorizPressed = (keyboard_check_pressed(ord("D")) + keyboard_check_pressed(vk_right)) - (keyboard_check_pressed(ord("A")) + keyboard_check_pressed(vk_left))
var moveVertPressed = (keyboard_check_pressed(ord("S")) + keyboard_check_pressed(vk_down)) - (keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up))
//var moveHoriz = keyboard_check(vk_right) - keyboard_check(vk_left)
//var moveVert = keyboard_check(vk_down) - keyboard_check(vk_up)
if steps >= fightSteps and fightSteps > 0 and !fightStart
{
	fightStart = true
	image_speed = 0
	image_index = 0
	instance_create_layer(x+40,y-70, "InstancesB", objFightBox)
	audio_play_sound(snd_b, 1, 0)
	alarm[1] = 30
}
else if !fightStart
{
	if openBox
	{
		if moveHorizPressed != 0 and boxSelection < 16
		{
			if boxSelection >= 8 and moveHorizPressed > 0
			{
				boxSelection = 17	
			}
			else
			{
				boxSelection = clamp(boxSelection + moveHorizPressed*8, 0, 17)
			}
		}
		else if boxSelection >= 16 and moveHorizPressed < 0
		{
			boxSelection = 7
		}
		boxSelection = clamp(boxSelection + moveVertPressed, 0, 17)
	}
	else if !openText
	{
		if moveHoriz !=0
		{
			image_speed = abs(moveHoriz)
			sprite_index = sprFLR
			image_xscale = sign(moveHoriz)*imageScale*-1
			dir = sign(moveHoriz)*-1 + 1
			if !(place_meeting(x+wlkSpd*moveHoriz, y, objSolid) and instance_place(x+wlkSpd*moveHoriz, y, objSolid).isSolid and isSolid)
			{
				x+=wlkSpd*moveHoriz
			}
			else while(!(place_meeting(x+moveHoriz, y, objSolid) and instance_place(x+moveHoriz, y, objSolid).isSolid and isSolid))
			{
				x+=moveHoriz	
			}
		}
		if moveVert >= 1
		{
			image_speed = abs(moveVert)
			sprite_index = sprFDown
			dir = 3
			if !(place_meeting(x, y+wlkSpd*moveVert, objSolid) and instance_place(x, y+wlkSpd*moveVert, objSolid).isSolid and isSolid)
			{
				y+=wlkSpd*moveVert
			}
			else while(!(place_meeting(x, y+moveVert, objSolid) and instance_place(x, y+moveVert, objSolid).isSolid and isSolid))
			{
				y+=moveVert	
			}
		}
		else if moveVert <= -1
		{
			image_speed = 1
			sprite_index = sprFUp
			dir = 1
			if !(place_meeting(x, y+wlkSpd*moveVert, objSolid) and instance_place(x, y+wlkSpd*moveVert, objSolid).isSolid and isSolid)
			{
				y+=wlkSpd*moveVert
			}
			else while(!(place_meeting(x, y+moveVert, objSolid) and instance_place(x, y+moveVert, objSolid).isSolid and isSolid))
			{
				y+=moveVert	
			}
		}
	}


	if moveHoriz == 0 and moveVert == 0
	{
		image_speed = 0
		image_index = 0
	}
	else
	{
		steps++	
	}

	if keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z"))
	{
		if openBox
		{
			if boxSelected = -1 //nothing selected
			{
				boxSelected = boxSelection
				if boxSelection < 8 and inventory[boxSelection, 0] != 0
				{
					boxTemp[0] = inventory[boxSelection, 0]
					boxTemp[1] = inventory[boxSelection, 1]
					boxTemp[2] = inventory[boxSelection, 2]
				}
				else if  boxSelection >=8 and boxInv[-8 + boxSelection, 0] != 0
				{
					boxTemp[0] = boxInv[-8 + boxSelection, 0]
					boxTemp[1] = boxInv[-8 + boxSelection, 1]
					boxTemp[2] = boxInv[-8 + boxSelection, 2]
				}
				else
				{
					boxSelected = -1	
				}
			}
			else //something selected
			{
				if boxSelected < 8
				{
					if boxSelection < 8
					{
						inventory[boxSelected, 0] = inventory[boxSelection, 0]
						inventory[boxSelected, 1] = inventory[boxSelection, 1]
						inventory[boxSelected, 2] = inventory[boxSelection, 2]
					}
					else
					{
						inventory[boxSelected, 0] = boxInv[-8 + boxSelection, 0]
						inventory[boxSelected, 1] = boxInv[-8 + boxSelection, 1]
						inventory[boxSelected, 2] = boxInv[-8 + boxSelection, 2]
					}
				}
				else
				{
					if boxSelection < 8
					{
						boxInv[-8 + boxSelected, 0] = inventory[boxSelection, 0]
						boxInv[-8 + boxSelected, 1] = inventory[boxSelection, 1]
						boxInv[-8 + boxSelected, 2] = inventory[boxSelection, 2]
					}
					else
					{
						boxInv[-8 + boxSelected, 0] = boxInv[-8 + boxSelection, 0]
						boxInv[-8 + boxSelected, 1] = boxInv[-8 + boxSelection, 1]
						boxInv[-8 + boxSelected, 2] = boxInv[-8 + boxSelection, 2]
					}
				}
				
				if boxSelection < 8
				{
					inventory[boxSelection, 0] = boxTemp[0]
					inventory[boxSelection, 1] = boxTemp[1]
					inventory[boxSelection, 2] = boxTemp[2]
				}
				else
				{
					boxInv[-8 + boxSelection, 0] = boxTemp[0]
					boxInv[-8 + boxSelection, 1] = boxTemp[1]
					boxInv[-8 + boxSelection, 2] = boxTemp[2]
				}
				
				boxTemp[0] = 0
				boxSelected = -1
			}
		}
		else if !openText
		{
			if sprite_index = sprFDown and !place_empty(x,y+1,objInteractable)
			{
				inter = instance_place(x,y+1,objInteractable)
				inter.interact = true
			}
			else if sprite_index = sprFUp and !place_empty(x,y-1,objInteractable)
			{
				inter = instance_place(x,y-1,objInteractable)
				inter.interact = true
			}
			else if sprite_index = sprFLR and !place_empty(x+image_xscale/imageScale*-1,y,objInteractable)
			{
				inter = instance_place(x+image_xscale/imageScale*-1,y,objInteractable)
				inter.interact = true
			}
		}
		else
		{
			if textCur < string_length(text[textNum]) - 1
			{
				textCur = 69420	
			}
			else if !inter.hasChoice or textNum < array_length_1d(text) - 1
			{
				textNum++
				textCur = 0
			}
		}
	
	}
	
	if keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_escape)
	{
		if openBox
		{
			openBox = false
			boxSelected = -1
			boxSelection = 0
			boxTemp[0] = 0
		}
	}

	if openText
	{	
		if textNum >= array_length_1d(text)
		{
			openText = false
			text = 0
			textNum = 0
			textCur = 0
		}
		else if textCur < string_length(text[textNum]) and alarm[0] < 0
		{
			alarm[0] = 2
		}
		else if textNum = array_length_1d(text)-1 and textCur >= string_length(text[textNum]) - 1 and interactSelection < 0 and inter.hasChoice
		{
			interactSelection = 0	
		}
		else if interactSelection >= 0
		{
			interactSelection = clamp(interactSelection + moveHorizPressed, 0, 1)
			
			if keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("Z"))
			{
				inter.choice = interactSelection
				interactSelection = -1
				openText = false
				text = 0
				textNum = 0
				textCur = 0
			}
		}
	}
}

var lastNum = string_digits(string_char_at((keyboard_string), string_length(keyboard_string)))
if string_length(lastNum) > 0
{
	room_goto(real(lastNum))
	//isSolid = false
	//alarm[11] = 4 * 30
	start = 99
	keyboard_lastchar = -1
	x = 80
	y = 80
}
if keyboard_check_pressed(vk_tab)
{
	isSolid = !isSolid	
}