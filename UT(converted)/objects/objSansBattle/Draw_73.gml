draw_sprite_ext(sprSansBodyDef, 0, x - 4 + animOffsetX, y + animOffsetY, imageScale, imageScale, 0, c_white, 1)
draw_sprite_ext(sprSansHead, 0, x + animOffsetX, y - 60 + animOffsetY*2, imageScale, imageScale, 0, c_white, 1)
draw_sprite_ext(sprSansLegs, 0, x, y + 80, imageScale, imageScale, 0, c_white, 1)

draw_text(1700, 15, string(x))

event_inherited()