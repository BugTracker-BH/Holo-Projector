# holo:control/size_sm — 48x27, pixel 0.2 (9.6x5.4 blocks), interlace 2
scoreboard players set #COLS holo.v 48
scoreboard players set #ROWS holo.v 27
scoreboard players set #COLS_M1 holo.v 47
scoreboard players set #ROWS_M1 holo.v 26
scoreboard players set #MAX_PIX holo.v 1296
scoreboard players set #PXSIZE_X100 holo.v 20
scoreboard players set #INTERLACE holo.v 2
tellraw @s {"text":"[Holo] Size: Small (48x27, 9.6x5.4 blocks)","color":"aqua"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
