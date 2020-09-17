if x > 1500 then use = true

if use and !used //keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("X"))
{
	damage = clamp(105 - round(abs(x - 880) / 3), 0, 100)
	if damage = 100
	{
		damage = 150
		image_speed = 1
		speed = 0
		alarm[0] = 30
	}
	else
	{
		instance_destroy()	
	}
	used = true
		show_debug_message("Delete attack " + string(ds_list_find_value(objHeart.attacks, 0)))
	//ds_list_delete(objHeart.attacks, ds_list_find_index(objHeart.attacks, self))	
	ds_list_delete(objHeart.attacks, 0)	
}