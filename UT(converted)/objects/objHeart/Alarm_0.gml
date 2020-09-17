var att = instance_create_layer(140, 738, "FightInstances", objAttackLine)
att.speed = attackSpd
ds_list_add(attacks, att)
	show_debug_message("Added attack " + string(ds_list_size(attacks)) + " " + string(att))
shots--