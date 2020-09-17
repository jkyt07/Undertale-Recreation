event_inherited()
//if objHeart.alive
//{
//	draw_self()
//}

//if image_index = 1
//{
//	draw_rectangle_color(objHeart.midCam - 80, 500, objHeart.midCam + 80, 550, c_red, c_red, c_red, c_red, 0)
//	if shownHp > 0
//	draw_rectangle_color(objHeart.midCam - 80, 500, objHeart.midCam - 80 + 160*(shownHp/maxHp), 550, c_yellow, c_yellow, c_yellow, c_yellow, 0)
//}

draw_text(15, 1000, string(hp))
draw_text(15, 1020, string(shownHp))
draw_text(15, 1040, string(objHeart.alarm[2]))