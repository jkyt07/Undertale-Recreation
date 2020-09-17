for(var i = 0; i < ds_list_size(attacks); i++)
{
	instance_destroy(ds_list_find_value(attacks, i))	
}

objHeart.enemy = -1

instance_destroy(objHeart)