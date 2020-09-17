image_speed = 0

imageScale = 2.75
image_xscale = imageScale
image_yscale = imageScale
viewable = true

//bg = instance_create_layer(0,0,"FightBG", objFightBG)

alive = true
drawSplit = -1
splitCD = 30
gameOverAlpha = 0

yourTurn = true
dir = 0
wlkSpd = 4
menuOption = 0
onMenu = true
options = -1
optionsOption = 0
optionsSize = 0
displayText = true
onText = true

usingItem = false

attacking = false
turnDmg = 0
dmg = 10
numShots = 3
shots = 0
attackSpd = 0
attacks = ds_list_create()
	show_debug_message("Attacks Created")
showDmg = 0
shownHp = friskHp
hit = -1
hitType = objPanHit
invuln = false

enemy = instance_create_layer(camera_get_view_width(view_camera[0]) / 2, 300, "FightInstances", nextEnemy)

menuDial = enemy.startDial
textNum = 0
textCur = 0

midCam = camera_get_view_width(view_camera[0]) / 2

audio_pause_sound(mus_Waterfall)
audio_play_sound(enemy.sound, 2, 1)