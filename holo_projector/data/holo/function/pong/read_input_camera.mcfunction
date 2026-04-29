# holo:pong/read_input_camera — pitch -> paddle Y with sensitivity
execute store result score #PITCH holo.tmp run data get entity @p Rotation[1] 1
execute if score #PITCH holo.tmp matches ..-60 run scoreboard players set #PITCH holo.tmp -60
execute if score #PITCH holo.tmp matches 60.. run scoreboard players set #PITCH holo.tmp 60
scoreboard players operation #LYT holo.tmp = #PITCH holo.tmp
scoreboard players add #LYT holo.tmp 60
scoreboard players operation #PR_RANGE holo.tmp = #ROWS holo.v
scoreboard players operation #PR_RANGE holo.tmp -= #PADDLE_H holo.v
scoreboard players operation #LYT holo.tmp *= #PR_RANGE holo.tmp
scoreboard players set #D120 holo.tmp 120
scoreboard players operation #LYT holo.tmp /= #D120 holo.tmp
execute if score #LYT holo.tmp matches ..-1 run scoreboard players set #LYT holo.tmp 0
execute if score #LYT holo.tmp > #PR_RANGE holo.tmp run scoreboard players operation #LYT holo.tmp = #PR_RANGE holo.tmp

execute if score #PONG_SENSITIVITY holo.v matches 20.. run scoreboard players operation #P_LY holo.tmp = #LYT holo.tmp
execute unless score #PONG_SENSITIVITY holo.v matches 20.. run function holo:pong/apply_sensitivity
