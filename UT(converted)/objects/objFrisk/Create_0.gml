imageScale = 4
image_xscale = imageScale
image_yscale = imageScale

wlkSpd = 6
isSolid = true
inter = 0
dir = 3
steps = 0

globalvar c_tan; c_tan = make_color_rgb(255,255,60);

globalvar text, openText, frisk, saveX, saveY, inventory, friskHp, friskMaxHp, boxInv, canFight, nextEnemy;
text = 0
openText = 0
textNum = 0
textCur = 0
frisk = self

defFont = font_add_sprite_ext(sprDefFont, "gyjqpW%#m&Mw$Q*\\,:/XIohNc4xBG36Ant7Cefv51JTK0RHaO9PUl28izsb@?DVYFESLudrkZ+>}{<_~=-])[(!^\";.|'`", 0, 2)

start = 0


fightSteps = -1
fightStart = 0

saveX = 0
saveY = 0

friskMaxHp = 20
friskHp = friskMaxHp
lv = 1

for(var i = 0; i < 8; i++)
{
	for(var j = 0; j < 3; j++)
	{
		inventory[i, j] = 0
	}
}

inventory[0, 0] = "Bisicle"
inventory[0, 2] = 11
inventory[0, 1] = [
@"* You eat one half of the 
  Bisicle."]
inventory[1, 0] = "Bisicle"
inventory[1, 2] = 11
inventory[1, 1] = [
@"* You eat one half of the 
  Bisicle."]
inventory[2, 0] = "Unisicle"
inventory[2, 2] = 11
inventory[2, 1] = [
@"* You ate the Unisicle."]
inventory[3, 0] = "FaceSteak"
inventory[3, 2] = 60
inventory[3, 1] = [
@"* You ate the Face Steak."]
inventory[4, 0] = "Bisicle"
inventory[4, 2] = 11
inventory[4, 1] = [
@"* You eat one half of the 
  Bisicle."]
inventory[5, 0] = "Butts Pie"
inventory[5, 2] = 999
inventory[5, 1] = [
@"* You ate the Butterscotch 
  Pie."]
  
//inventory[6,0] = 0
//inventory[7,0] = 0

for(var i = 0; i < 10; i++)
{
	for(var j = 0; j < 3; j++)
	{
		boxInv[i, j] = 0
	}
}

canFight = false
  
openBox = false

boxSelection = 0
boxSelected = -1
boxTemp[0] = 0

interactSelection = -1

nextEnemy = objAaron

audio_play_sound(mus_Waterfall, 2, 1)