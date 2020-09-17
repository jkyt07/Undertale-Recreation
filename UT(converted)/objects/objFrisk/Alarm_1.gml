//room_goto(rmFight)
instance_destroy(objFightBox)
saveX = x
saveY = y
x = -1000
y = -1000
visible = false

instance_create_layer(0, 1900, "FightChar", objHeart)