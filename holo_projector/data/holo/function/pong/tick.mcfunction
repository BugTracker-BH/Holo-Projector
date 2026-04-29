# holo:pong/tick — main loop
execute unless score #LIVE_MODE holo.state matches 1 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

# Erase ball at prev
function holo:pong/erase_ball

# Move ball
scoreboard players operation #PB_X holo.tmp += #PB_VX holo.tmp
scoreboard players operation #PB_Y holo.tmp += #PB_VY holo.tmp

# Wall collisions (top/bottom) using ball rectangle
execute if score #PB_Y holo.tmp matches ..-1 run scoreboard players set #PB_Y holo.tmp 0
execute if score #PB_Y holo.tmp matches 0 if score #PB_VY holo.tmp matches ..-1 run scoreboard players operation #PB_VY holo.tmp *= #NEG1 holo.v
scoreboard players operation #BOT_MAX holo.tmp = #ROWS holo.v
scoreboard players operation #BOT_MAX holo.tmp -= #BALL_SIZE holo.v
execute if score #PB_Y holo.tmp > #BOT_MAX holo.tmp run scoreboard players operation #PB_Y holo.tmp = #BOT_MAX holo.tmp
execute if score #PB_Y holo.tmp >= #BOT_MAX holo.tmp if score #PB_VY holo.tmp matches 1.. run scoreboard players operation #PB_VY holo.tmp *= #NEG1 holo.v

# Paddle collisions
function holo:pong/check_paddle_collide

# Scoring — ball past walls
scoreboard players operation #BX_END_S holo.tmp = #PB_X holo.tmp
scoreboard players operation #BX_END_S holo.tmp += #BALL_SIZE holo.v
execute if score #PB_X holo.tmp matches ..-1 run function holo:pong/score_r
execute if score #BX_END_S holo.tmp > #COLS holo.v run function holo:pong/score_l

# Update paddles
function holo:pong/update_paddles

# Draw ball
function holo:pong/render_ball

scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp

schedule function holo:pong/tick 2t
