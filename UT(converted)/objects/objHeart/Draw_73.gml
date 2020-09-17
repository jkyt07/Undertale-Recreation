//var midCam = camera_get_view_width(view_camera[0]) / 2

if !alive
{
	draw_rectangle_color(0,0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black,c_black,c_black,c_black,0)
	if drawSplit >= 0
	{
		draw_sprite_ext(sprHeartBreak, 0, x - (drawSplit + 4)*imageScale, y, imageScale, imageScale, 0, c_white, 1)
		draw_sprite_ext(sprHeartBreak, 1, x + (drawSplit + 4)*imageScale, y, imageScale, imageScale, 0, c_white, 1)
	}
	else if gameOverAlpha > 0
	{
		draw_set_alpha(gameOverAlpha)
		draw_text_transformed(500, 300, "GAME OVER", 6, 6, 0)
		draw_set_alpha(1)
	}
	
	if gameOverAlpha = 1 and onText
	{
		draw_text_transformed(500, 500, string_copy(menuDial[textNum], 0, textCur), 3, 3, 0)
	}
	
	exit;
}

if !yourTurn
{
	draw_rectangle_color(0, 899, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), 566, c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(midCam - 380, 530, midCam - 247, 920, c_black, c_black, c_black, c_black, 0)
	draw_rectangle_color(midCam + 252, 530, midCam + 350, 920, c_black, c_black, c_black, c_black, 0)
	
	
	draw_rectangle_color(midCam - 248, 567, midCam + 251, 577, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam - 248, 567, midCam - 238, 898, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam + 241, 567, midCam + 251, 898, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(midCam - 248, 888, midCam + 251, 898, c_white, c_white, c_white, c_white, 0)
}

if enemy.grid != 0
draw_sprite_ext(sprBattleGrid, 0, midCam, 290, 2.8, 2.2, 0, c_white, 1)	

if showDmg and enemy != -1 and hitType != objMissHit and enemy.maxHp != 1
{
	draw_text_transformed_color(enemy.x - 20*string_length(string(round(dmg*(turnDmg/100)))), enemy.y - 280, string(round(dmg*(turnDmg/100))), 3, 3, 0, c_red, c_red, c_red, c_red, 1)	
}

if displayText and menuDial != 0
{
	draw_text_ext_transformed(250, 650, string_copy(menuDial[textNum], 0, textCur), 30, 600, 2.7,2.7,0)	
}

//if
{
	draw_sprite_ext(sprFightButton, menuOption = 0, 120, 990, 2.5, 2.5, 0, c_white, 1)
	draw_sprite_ext(sprActButton, menuOption = 1, 120 + 408, 990, 2.5, 2.5, 0, c_white, 1)
	draw_sprite_ext(sprItemButton, menuOption = 2, 120 + 408*2, 990, 2.5, 2.5, 0, c_white, 1)
	draw_sprite_ext(sprSpareButton, menuOption = 3, 120 + 408*3, 990, 2.5, 2.5, 0, c_white, 1)
	
	draw_text_transformed(80, 950, "Chara   LV " + string(frisk.lv), 2.3, 2.3, 0)
	
	draw_text_transformed(midCam - 100, 950, "HP", 2, 2, 0)
	draw_rectangle_color(midCam - 40, 920, midCam + 60, 970, c_red,c_red,c_red,c_red, 0)
	
	if shownHp < friskHp
	{
		draw_text_color(15, 20, string(shownHp), c_green, c_green, c_green, c_green, 1)
		draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(friskHp/friskMaxHp), 970, c_green,c_green,c_green,c_green, 0)
		draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(shownHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
	}
	else if shownHp > friskHp
	{
		//draw_text_color(15, 20, string(shownHp), c_purple, c_purple, c_purple, c_purple, 1)
		//draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(shownHp/friskMaxHp), 970, c_purple,c_purple,c_purple,c_purple, 0)
		draw_text_color(15, 20, string(shownHp), c_red, c_red, c_red, c_red, 1)
		//draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(shownHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
		draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(friskHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
	}
	else
	{
		draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(friskHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
		draw_text(15, 20, string(shownHp))	
	}
	
	//draw_rectangle_color(midCam - 40, 920, midCam - 40 + 100*(friskHp/friskMaxHp), 970, c_yellow,c_yellow,c_yellow,c_yellow, 0)
	
	
	draw_text_transformed(midCam + 100, 950, string(friskHp) + " / " + string(friskMaxHp), 1.7, 1.7, 0)
}


if viewable
{
	draw_self()
}

draw_text(15, 980, string(instance_number(objCut)))
//draw_text(1650, 40, string(enemy.x))