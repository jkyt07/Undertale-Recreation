var midCam = camera_get_view_width(view_camera[0]) / 2
draw_set_font(defFont)


if openText
{
	if y - camera_get_view_y(view_camera[0]) < window_get_height()/2 + sprite_height*imageScale/2
	{
		draw_sprite_ext(sprDialBox, 0, 150, 670, 5, 5, 0, c_white, 1)
		//draw_text_ext_transformed(200, 780, "*", 30, 1200, 3,3,0)
		draw_text_ext_transformed(250, 750, string_copy(text[textNum], 0, textCur), 30, 600, 2.7,2.7,0)
		
		if interactSelection >= 0
		{
			draw_sprite_ext(sprRedHeart, 0, 450 + 700*interactSelection, 930, 2.5, 2.5, 0, c_white, 1)
			
			for(var i = 0; i < array_length_1d(inter.choices); i++)
			{
				draw_text_transformed(530 + 700*i, 930, inter.choices[i], 2.7, 2.7, 0)	
			}
		}
	}
	else
	{
		draw_sprite_ext(sprDialBox, 0, 150, 100, 5, 5, 0, c_white, 1)
		//draw_text_ext_transformed(200, 180, "*", 10, 1200, 3,3,0)
		draw_text_ext_transformed(250, 180, string_copy(text[textNum], 0, textCur), 30, 600, 2.7,2.7,0)
	}
}

if openBox
{
	draw_rectangle_color(50, 50, 1697 - 50, 1080 - 50, c_white, c_white, c_white, c_white, 0)
	draw_rectangle_color(60, 60, 1697 - 60, 1080 - 60, c_black, c_black, c_black, c_black, 0)
	
	draw_text_transformed(300, 120, "INVENTORY", 2.5, 2.5, 0)
	draw_text_transformed(1150, 120, "BOX", 2.5, 2.5, 0)
	
	for(var i = 0; i < 8; i++)
	{
		if inventory[i, 0] != 0
		{
			if boxSelected != i
			{
				draw_text_transformed_color(250, 70*i + 250, inventory[i, 0], 2.5, 2.5, 0, c_white, c_white, c_white, c_white, 1)
			}
			else
			{
				draw_text_transformed_color(250, 70*i + 250, inventory[i, 0], 2.5, 2.5, 0, c_tan, c_tan, c_tan, c_tan, 1)
			}
		}
		else
		{
			draw_line_width_color(260, 70*i + 290, 260 + 400, 70*i + 290, 2, c_red, c_red)	
		}
	}
	
	draw_line_width(780, 260, 780, 900, 2)
	draw_line_width(784, 260, 784, 900, 2)
	
	for(var i = 0; i < 10; i++)
	{
		if boxInv[i, 0] != 0
		{
			if boxSelected != i+8
			{
				draw_text_transformed_color(1000, 70*i + 250, boxInv[i, 0], 2.5, 2.5, 0, c_white, c_white, c_white, c_white, 1)	
			}
			else
			{
				draw_text_transformed_color(1000, 70*i + 250, boxInv[i, 0], 2.5, 2.5, 0, c_tan, c_tan, c_tan, c_tan, 1)	
			}
		}
		else
		{
			draw_line_width_color(1000, 70*i + 290, 1000 + 400, 70*i + 290, 2, c_red, c_red)	
		}
	}
	
	if boxSelection < 8
	{
		draw_sprite_ext(sprRedHeart, 0, 180, 70*boxSelection + 280, 3, 3, 0, c_white, 1)
	}
	else
	{
		draw_sprite_ext(sprRedHeart, 0, 930, 70*(boxSelection - 8) + 280, 3, 3, 0, c_white, 1)	
	}
	
	draw_text_transformed(500, 970, "Press [X] to Finish", 2, 2, 0)
}

draw_text(10,15,string_char_at((keyboard_string), string_length(keyboard_string)))
draw_text(10,35, string(steps))