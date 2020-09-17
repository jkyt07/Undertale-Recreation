event_inherited();

grid = 0

startDial = [
@"* You feel like you're going 
  to have a bad time."]


actOptions[0, 1] = [
@"* SANS 1 ATK 1 DEF
* The easiest enemy. 
* Can only deal 1 damage."]
actOptions[1, 0] = 0

hp = 1
att = 1
shownHp = hp
maxHp = hp

dodge = 0
startPos = x

animated = true
idle = true

animLeft = true
animOffsetX = 0
animOffsetY = 0

objHeart.hitType = objCut //objMissHit

//audio_play_sound(megalovania, 1, 1)
sound = mus_Megalovania