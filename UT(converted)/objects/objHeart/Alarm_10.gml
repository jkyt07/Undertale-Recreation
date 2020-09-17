randomize()

drawSplit = -2

var numShards = irandom_range(4, 7)
for(var i = 0; i < numShards; i++)
{
	var shard = instance_create_layer(x + irandom_range(-22, 22), y + irandom_range(-22, 22), "FightChar", objHeartShard)
	shard.direction = irandom(360)//irandom_range(30, 150)
	//show_debug_message(string(shard.direction))
	//shard.image_index = i
}

audio_play_sound(snd_break2, 1, 0)