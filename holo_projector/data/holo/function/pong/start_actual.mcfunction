# holo:pong/start_actual — actual pong init
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 1

# Default auto-size
scoreboard players set #BALL_SIZE holo.v 1
scoreboard players set #PADDLE_W holo.v 1
scoreboard players set #PADDLE_H holo.v 4
execute if score #COLS holo.v matches 48..63 run function holo:pong/apply_small
execute if score #COLS holo.v matches 64..95 run function holo:pong/apply_medium
execute if score #COLS holo.v matches 96..127 run function holo:pong/apply_large
execute if score #COLS holo.v matches 128.. run function holo:pong/apply_xl
execute if score #PONG_SIZE_OVERRIDE holo.v matches 1 run function holo:pong/apply_small
execute if score #PONG_SIZE_OVERRIDE holo.v matches 2 run function holo:pong/apply_medium
execute if score #PONG_SIZE_OVERRIDE holo.v matches 3 run function holo:pong/apply_large
execute if score #PONG_SIZE_OVERRIDE holo.v matches 4 run function holo:pong/apply_xl

scoreboard players set #LEFT_X holo.v 1
scoreboard players operation #RIGHT_X_START holo.v = #COLS holo.v
scoreboard players remove #RIGHT_X_START holo.v 1
scoreboard players operation #RIGHT_X_START holo.v -= #PADDLE_W holo.v

scoreboard players operation #PB_X holo.tmp = #COLS holo.v
scoreboard players operation #PB_X holo.tmp /= #TWO holo.v
scoreboard players operation #PB_Y holo.tmp = #ROWS holo.v
scoreboard players operation #PB_Y holo.tmp /= #TWO holo.v
scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp

execute store result score #DIRX holo.tmp run random value 0..1
scoreboard players operation #DIRX holo.tmp *= #TWO holo.v
scoreboard players remove #DIRX holo.tmp 1
scoreboard players operation #PB_VX holo.tmp = #DIRX holo.tmp
scoreboard players operation #PB_VX holo.tmp *= #PONG_BALL_SPEED holo.v
execute store result score #DIRY holo.tmp run random value 0..1
scoreboard players operation #DIRY holo.tmp *= #TWO holo.v
scoreboard players remove #DIRY holo.tmp 1
execute if score #DIRY holo.tmp matches 0 run scoreboard players set #DIRY holo.tmp 1
scoreboard players operation #PB_VY holo.tmp = #DIRY holo.tmp
scoreboard players operation #PB_VY holo.tmp *= #PONG_BALL_SPEED holo.v

scoreboard players operation #P_LY holo.tmp = #ROWS holo.v
scoreboard players operation #P_LY holo.tmp -= #PADDLE_H holo.v
scoreboard players operation #P_LY holo.tmp /= #TWO holo.v
scoreboard players operation #P_RY holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_LY_PREV holo.tmp = #P_LY holo.tmp
scoreboard players operation #P_RY_PREV holo.tmp = #P_RY holo.tmp

scoreboard players set #P_LS holo.tmp 0
scoreboard players set #P_RS holo.tmp 0

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players operation #PAD_X_IN holo.tmp = #LEFT_X holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_LY holo.tmp
scoreboard players set #PAD_COLOR_IN holo.tmp -1
function holo:pong/draw_paddle
scoreboard players operation #PAD_X_IN holo.tmp = #RIGHT_X_START holo.v
scoreboard players operation #PAD_Y_IN holo.tmp = #P_RY holo.tmp
function holo:pong/draw_paddle
function holo:pong/render_ball

execute if score #DIFFICULTY holo.v matches 1 run tellraw @a {"text":"[Pong] Difficulty: EASY","color":"green"}
execute if score #DIFFICULTY holo.v matches 2 run tellraw @a {"text":"[Pong] Difficulty: MEDIUM","color":"yellow"}
execute if score #DIFFICULTY holo.v matches 3 run tellraw @a {"text":"[Pong] Difficulty: HARD","color":"gold"}
execute if score #DIFFICULTY holo.v matches 4 run tellraw @a {"text":"[Pong] Difficulty: VERY HARD","color":"red"}
tellraw @a [{"text":"[Pong] Game started! First to 5 wins. Sens: ","color":"aqua"},{"score":{"name":"#PONG_SENSITIVITY","objective":"holo.v"},"color":"white"},{"text":"  Speed: ","color":"aqua"},{"score":{"name":"#PONG_BALL_SPEED","objective":"holo.v"},"color":"white"}]
schedule function holo:pong/tick 2t
