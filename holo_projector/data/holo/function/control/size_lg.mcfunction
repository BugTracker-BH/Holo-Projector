# holo:control/size_lg — 96x54, pixel 0.5 (48x27 blocks), interlace 8
scoreboard players set #COLS holo.v 96
scoreboard players set #ROWS holo.v 54
scoreboard players set #COLS_M1 holo.v 95
scoreboard players set #ROWS_M1 holo.v 53
scoreboard players set #MAX_PIX holo.v 5184
scoreboard players set #PXSIZE_X100 holo.v 50
scoreboard players set #INTERLACE holo.v 8
tellraw @s {"text":"[Holo] Size: Large (96x54, 48x27 blocks) -- ENORMOUS","color":"gold"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
