//var midCam = camera_get_view_width(view_camera[0]) / 2

draw_rectangle_color(0,0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black,c_black,c_black,c_black,0)
if enemy.grid != 0
draw_sprite_ext(enemy.grid, 0, midCam, 290, 2.8, 2.2, 0, c_white, 1)	

if alive
{
	if yourTurn
	{
		draw_sprite_ext(sprDialBox, 0, 120, 565, 5.2, 4.5, 0, c_white, 1)
	
		if attacking
		{
			draw_sprite_ext(sprAttackBar, 0, midCam, 730, 2.5, 2.5, 0, c_white, 1)
		}
		else if options != -1
		{
			for(var i = 0; i < optionsSize; i++)
			{
				if options[i, 0] != ""
				{
					if optionsOption != i
					{
						draw_text_transformed(250 + 550*(i%2), 630+100*floor(i/2), "* " + string(options[i, 0]), 2.7, 2.7, 0)	
					}
					else
					{
						draw_text_transformed(250 + 550*(i%2), 630+100*floor(i/2), "  " + string(options[i, 0]), 2.7, 2.7, 0) // c_tan, c_tan, c_tan, c_tan, 1)
					}
				}
			}
		}
	}
	else
	{
		draw_rectangle_color(midCam - 248, 567, midCam + 251, 898, c_white, c_white, c_white, c_white, 0)
		draw_rectangle_color(midCam - 238, 577, midCam + 241, 888, c_black, c_black, c_black, c_black, 0)
	
	}

	//if showDmg and enemy != -1
	//{
	//	draw_text_transformed_color(enemy.x - 20*string_length(string(turnDmg)), enemy.y - 280, string(turnDmg), 3, 3, 0, c_red, c_red, c_red, c_red, 1)	
	//}

	//if onMenu
	//{
	//	draw_text_ext_transformed(250, 650, string_copy(menuDial[textNum], 0, textCur), 30, 600, 2.7,2.7,0)	
	//}

	////if
	//{
	//	draw_sprite_ext(sprFightButton, menuOption = 0, 120, 990, 2.5, 2.5, 0, c_white, 1)
	//	draw_sprite_ext(sprActButton, menuOption = 1, 120 + 408, 990, 2.5, 2.5, 0, c_white, 1)
	//	draw_sprite_ext(sprItemButton, menuOption = 2, 120 + 408*2, 990, 2.5, 2.5, 0, c_white, 1)
	//	draw_sprite_ext(sprSpareButton, menuOption = 3, 120 + 408*3, 990, 2.5, 2.5, 0, c_white, 1)
	
	//	draw_text_transformed(80, 950, "Chara	LV " + string(frisk.lv), 2.3, 2.3, 0)
	//	draw_text_transformed(midCam - 100, 950, "HP", 2, 2, 0)
	
	//	draw_rectangle_color(midCam - 40, 920, midCam + 60, 970, c_red,c_red,c_red,c_red, 0)
	//	draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(friskHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
	//}


	//if viewable
	//{
	//	draw_self()
	//}
}

draw_text(10, 65, string(menuOption))
draw_text(10, 100, string(turnDmg))