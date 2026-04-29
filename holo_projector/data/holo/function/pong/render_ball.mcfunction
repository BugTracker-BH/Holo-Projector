# holo:pong/render_ball — draw ball rect at (PB_X, PB_Y) size BALL_SIZE x BALL_SIZE, white
scoreboard players operation #RX holo.tmp = #PB_X holo.tmp
scoreboard players operation #RY holo.tmp = #PB_Y holo.tmp
scoreboard players operation #RW holo.tmp = #BALL_SIZE holo.v
scoreboard players operation #RH holo.tmp = #BALL_SIZE holo.v
scoreboard players set #RCOLOR holo.tmp -1
function holo:pong/fill_rect
