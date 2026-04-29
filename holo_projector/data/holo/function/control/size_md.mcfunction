# holo:control/size_md — 64x36, pixel 0.25 (16x9 blocks), interlace 4
scoreboard players set #COLS holo.v 64
scoreboard players set #ROWS holo.v 36
scoreboard players set #COLS_M1 holo.v 63
scoreboard players set #ROWS_M1 holo.v 35
scoreboard players set #MAX_PIX holo.v 2304
scoreboard players set #PXSIZE_X100 holo.v 25
scoreboard players set #INTERLACE holo.v 4
tellraw @s {"text":"[Holo] Size: Medium (64x36, 16x9 blocks)","color":"green"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
