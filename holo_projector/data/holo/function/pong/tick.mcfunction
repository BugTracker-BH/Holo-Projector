# holo:pong/tick — per-tick Pong update
execute unless score #LIVE_MODE holo.state matches 1 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

# Erase ball at previous position
function holo:pong/erase_ball

# Move ball
scoreboard players operation #PB_X holo.tmp += #PB_VX holo.tmp
scoreboard players operation #PB_Y holo.tmp += #PB_VY holo.tmp

# Wall collisions (top/bottom)
execute if score #PB_Y holo.tmp matches ..-1 run scoreboard players set #PB_Y holo.tmp 0
execute if score #PB_Y holo.tmp matches ..0 run scoreboard players operation #PB_VY holo.tmp *= #NEG1 holo.v
scoreboard players operation #PB_Y_MAX holo.tmp = #ROWS holo.v
scoreboard players remove #PB_Y_MAX holo.tmp 1
execute if score #PB_Y holo.tmp > #PB_Y_MAX holo.tmp run scoreboard players operation #PB_Y holo.tmp = #PB_Y_MAX holo.tmp
execute if score #PB_Y holo.tmp >= #PB_Y_MAX holo.tmp run scoreboard players operation #PB_VY holo.tmp *= #NEG1 holo.v

# Paddle collisions
function holo:pong/check_paddle_collide

# Scoring
execute if score #PB_X holo.tmp matches ..0 if score #PB_VX holo.tmp matches ..-1 run function holo:pong/score_r
scoreboard players operation #PB_X_LIMIT holo.tmp = #COLS holo.v
scoreboard players remove #PB_X_LIMIT holo.tmp 1
execute if score #PB_X holo.tmp >= #PB_X_LIMIT holo.tmp if score #PB_VX holo.tmp matches 1.. run function holo:pong/score_l

# Update paddles (input + AI)
function holo:pong/update_paddles

# Draw ball at new position
function holo:pong/render_ball

# Update prev ball
scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp

schedule function holo:pong/tick 2t
