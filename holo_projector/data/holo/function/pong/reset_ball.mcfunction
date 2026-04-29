# holo:pong/reset_ball — re-center ball, random direction, velocity scaled by PONG_BALL_SPEED
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
