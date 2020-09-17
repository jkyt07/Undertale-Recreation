if interact
{
	image_speed = 1	
	if objEchoFlow.first and objEchoFlow.dialogue != dialogue
	{
		dialogue = altDialogue	
	}
	objEchoFlow.dialogue = dialogue
}
else if !openText
{
	image_speed = 0
	image_index = 0
}

event_inherited();
