audio_stop_all()
audio_resume_sound(mus_Waterfall)

if instance_exists(enemy)
{
	instance_destroy(enemy)	
}

for(var i = 0; i < ds_list_size(attacks); i++)
{
	instance_destroy(ds_list_find_value(attacks, i))	
}

with(frisk)
{
	visible = true
	x = saveX
	y = saveY
	steps = 0
	if fightSteps > 0
	fightSteps+= irandom(30 * 5)
	fightStart = 0
}

//instance_destroy(bg)