# holo:pong/draw_paddle — draw vertical paddle at (#PAD_X_IN, #PAD_Y_IN..#PAD_Y_IN+PADDLE_H) in #PAD_COLOR_IN
scoreboard players set #PAD_I holo.tmp 0
function holo:pong/paddle_pixel_loop
