# holo:pong/draw_paddle — draw paddle rect at (#PAD_X_IN, #PAD_Y_IN) size PADDLE_W x PADDLE_H in #PAD_COLOR_IN
scoreboard players operation #RX holo.tmp = #PAD_X_IN holo.tmp
scoreboard players operation #RY holo.tmp = #PAD_Y_IN holo.tmp
scoreboard players operation #RW holo.tmp = #PADDLE_W holo.v
scoreboard players operation #RH holo.tmp = #PADDLE_H holo.v
scoreboard players operation #RCOLOR holo.tmp = #PAD_COLOR_IN holo.tmp
function holo:pong/fill_rect
