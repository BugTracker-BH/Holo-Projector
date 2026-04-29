# holo:control/size_md — 64x36 (2,304 pixels, ~12.8x7.2 blocks)
scoreboard players set #COLS holo.v 64
scoreboard players set #ROWS holo.v 36
scoreboard players set #COLS_M1 holo.v 63
scoreboard players set #ROWS_M1 holo.v 35
scoreboard players set #MAX_PIX holo.v 2304
tellraw @s {"text":"[Holo] Size: Medium (64x36, 2304 px)","color":"green"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
