# holo:pong/start — init and run Pong
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Pong] No screen. Spawn the projector first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 1

# Paddle constants
scoreboard players set #PADDLE_H holo.v 4
scoreboard players set #LEFT_X holo.v 1
scoreboard players operation #RIGHT_X holo.v = #COLS holo.v
scoreboard players remove #RIGHT_X holo.v 2

# Center ball
scoreboard players operation #PB_X holo.tmp = #COLS holo.v
scoreboard players operation #PB_X holo.tmp /= #TWO holo.v
scoreboard players operation #PB_Y holo.tmp = #ROWS holo.v
scoreboard players operation #PB_Y holo.tmp /= #TWO holo.v
scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp

# Random initial velocity
execute store result score #PB_VX holo.tmp run random value 0..1
scoreboard players operation #PB_VX holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VX holo.tmp 1
execute store result score #PB_VY holo.tmp run random value 0..1
scoreboard players operation #PB_VY holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VY holo.tmp 1
execute if score #PB_VY holo.tmp matches 0 run scoreboard players set #PB_VY holo.tmp 1

# Paddles at middle
scoreboard players operation #P_LY holo.tmp = #ROWS holo.v
scoreboard players operation #P_LY holo.tmp -= #PADDLE_H holo.v
scoreboard players operation #P_LY holo.tmp /= #TWO holo.v
scoreboard players operation #P_RY holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_LY_PREV holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_RY_PREV holo.tmp = #P_RY holo.tmp

# Scores
scoreboard players set #P_LS holo.tmp 0
scoreboard players set #P_RS holo.tmp 0

# Clear screen
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Initial paddles + ball
scoreboard players operation #PAD_X_IN holo.tmp = #LEFT_X holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_LY holo.tmp
scoreboard players set #PAD_COLOR_IN holo.tmp -1
function holo:pong/draw_paddle
scoreboard players operation #PAD_X_IN holo.tmp = #RIGHT_X holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_RY holo.tmp
function holo:pong/draw_paddle
function holo:pong/render_ball

tellraw @a {"text":"[Pong] Game started! Look up/down to move paddle. CPU plays right.","color":"aqua"}
schedule function holo:pong/tick 2t
