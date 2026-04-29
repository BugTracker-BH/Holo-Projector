# holo:pong/start — size-aware init, start loop
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Pong] No screen. Spawn the projector first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 1

# Size-based dimensions (defaults for XS)
scoreboard players set #BALL_SIZE holo.v 1
scoreboard players set #PADDLE_W holo.v 1
scoreboard players set #PADDLE_H holo.v 4
# Small
execute if score #COLS holo.v matches 48..63 run scoreboard players set #BALL_SIZE holo.v 2
execute if score #COLS holo.v matches 48..63 run scoreboard players set #PADDLE_W holo.v 2
execute if score #COLS holo.v matches 48..63 run scoreboard players set #PADDLE_H holo.v 7
# Medium
execute if score #COLS holo.v matches 64..95 run scoreboard players set #BALL_SIZE holo.v 3
execute if score #COLS holo.v matches 64..95 run scoreboard players set #PADDLE_W holo.v 2
execute if score #COLS holo.v matches 64..95 run scoreboard players set #PADDLE_H holo.v 10
# Large
execute if score #COLS holo.v matches 96..127 run scoreboard players set #BALL_SIZE holo.v 4
execute if score #COLS holo.v matches 96..127 run scoreboard players set #PADDLE_W holo.v 3
execute if score #COLS holo.v matches 96..127 run scoreboard players set #PADDLE_H holo.v 14
# XL
execute if score #COLS holo.v matches 128.. run scoreboard players set #BALL_SIZE holo.v 6
execute if score #COLS holo.v matches 128.. run scoreboard players set #PADDLE_W holo.v 4
execute if score #COLS holo.v matches 128.. run scoreboard players set #PADDLE_H holo.v 20

scoreboard players set #LEFT_X holo.v 1
scoreboard players operation #RIGHT_X_START holo.v = #COLS holo.v
scoreboard players remove #RIGHT_X_START holo.v 1
scoreboard players operation #RIGHT_X_START holo.v -= #PADDLE_W holo.v

# Center ball
scoreboard players operation #PB_X holo.tmp = #COLS holo.v
scoreboard players operation #PB_X holo.tmp /= #TWO holo.v
scoreboard players operation #PB_Y holo.tmp = #ROWS holo.v
scoreboard players operation #PB_Y holo.tmp /= #TWO holo.v
scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp

# Random ball velocity
execute store result score #PB_VX holo.tmp run random value 0..1
scoreboard players operation #PB_VX holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VX holo.tmp 1
execute store result score #PB_VY holo.tmp run random value 0..1
scoreboard players operation #PB_VY holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VY holo.tmp 1
execute if score #PB_VY holo.tmp matches 0 run scoreboard players set #PB_VY holo.tmp 1

# Paddles centered
scoreboard players operation #P_LY holo.tmp = #ROWS holo.v
scoreboard players operation #P_LY holo.tmp -= #PADDLE_H holo.v
scoreboard players operation #P_LY holo.tmp /= #TWO holo.v
scoreboard players operation #P_RY holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_LY_PREV holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_RY_PREV holo.tmp = #P_RY holo.tmp

scoreboard players set #P_LS holo.tmp 0
scoreboard players set #P_RS holo.tmp 0

# Clear screen
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Initial render
scoreboard players operation #PAD_X_IN holo.tmp = #LEFT_X holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_LY holo.tmp
scoreboard players set #PAD_COLOR_IN holo.tmp -1
function holo:pong/draw_paddle
scoreboard players operation #PAD_X_IN holo.tmp = #RIGHT_X_START holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_RY holo.tmp
function holo:pong/draw_paddle
function holo:pong/render_ball

# Show difficulty on start
execute if score #DIFFICULTY holo.v matches 1 run tellraw @a {"text":"[Pong] Difficulty: EASY","color":"green"}
execute if score #DIFFICULTY holo.v matches 2 run tellraw @a {"text":"[Pong] Difficulty: MEDIUM","color":"yellow"}
execute if score #DIFFICULTY holo.v matches 3 run tellraw @a {"text":"[Pong] Difficulty: HARD","color":"gold"}
execute if score #DIFFICULTY holo.v matches 4 run tellraw @a {"text":"[Pong] Difficulty: VERY HARD","color":"red"}
tellraw @a {"text":"[Pong] Game started! Look up/down to move paddle.","color":"aqua"}
schedule function holo:pong/tick 2t
