scoreboard players operation #PAD_X_IN holo.tmp = #LEFT_X holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_LY_PREV holo.tmp
scoreboard players set #PAD_COLOR_IN holo.tmp -16777216
function holo:pong/draw_paddle
scoreboard players operation #PAD_Y_IN holo.tmp = #P_LY holo.tmp
scoreboard players set #PAD_COLOR_IN holo.tmp -1
function holo:pong/draw_paddle
