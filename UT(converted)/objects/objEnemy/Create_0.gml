image_speed = 0

imageScale = 4
image_xscale = imageScale
image_yscale = imageScale


grid = sprBattleGrid
animated = false

startDial = ["* Aaron flexes in!"]

actOptions[0, 0] = "Check"
actOptions[0, 1] = [
@"* AARON 7 ATK 2 DEF
* This seahorse has a lot of 
  HP (Horsepower).", 
@"* All of his attacks are harder 
  to dodge at the bottom of the
  box."]
act = -1

alive = true
hp = 110
shownHp = hp
maxHp = hp
att = 7

startAtt = false
attCD = 0
nextAtt = 0

attacks = ds_list_create()
attacked = 0

sound = mus_EnemyApproaching