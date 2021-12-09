objHeart.hit = dmg
if !objHeart.invuln
audio_play_sound(snd_hurt, 2, 0)

if destroyOnContact
instance_destroy()