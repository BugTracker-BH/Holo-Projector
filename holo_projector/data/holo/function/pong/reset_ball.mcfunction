scoreboard players operation #PB_X holo.tmp = #COLS holo.v
scoreboard players operation #PB_X holo.tmp /= #TWO holo.v
scoreboard players operation #PB_Y holo.tmp = #ROWS holo.v
scoreboard players operation #PB_Y holo.tmp /= #TWO holo.v
scoreboard players operation #PB_PX holo.tmp = #PB_X holo.tmp
scoreboard players operation #PB_PY holo.tmp = #PB_Y holo.tmp
execute store result score #PB_VX holo.tmp run random value 0..1
scoreboard players operation #PB_VX holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VX holo.tmp 1
execute store result score #PB_VY holo.tmp run random value 0..1
scoreboard players operation #PB_VY holo.tmp *= #TWO holo.v
scoreboard players remove #PB_VY holo.tmp 1
execute if score #PB_VY holo.tmp matches 0 run scoreboard players set #PB_VY holo.tmp 1
