# holo:pong/update_paddles — input + AI + diff render
execute at @e[tag=holo_anchor,limit=1] run function holo:pong/read_input
function holo:pong/cpu_ai

execute unless score #P_LY holo.tmp = #P_LY_PREV holo.tmp run function holo:pong/redraw_paddle_l
execute unless score #P_RY holo.tmp = #P_RY_PREV holo.tmp run function holo:pong/redraw_paddle_r

scoreboard players operation #P_LY_PREV holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_RY_PREV holo.tmp = #P_RY holo.tmp
