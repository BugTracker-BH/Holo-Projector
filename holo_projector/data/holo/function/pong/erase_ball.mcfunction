# holo:pong/erase_ball — erase ball at previous position
scoreboard players operation #RX holo.tmp = #PB_PX holo.tmp
scoreboard players operation #RY holo.tmp = #PB_PY holo.tmp
scoreboard players operation #RW holo.tmp = #BALL_SIZE holo.v
scoreboard players operation #RH holo.tmp = #BALL_SIZE holo.v
scoreboard players set #RCOLOR holo.tmp -16777216
function holo:pong/fill_rect
