# holo:control/size_xs — 32x18 (576 pixels, ~6.4x3.6 blocks)
scoreboard players set #COLS holo.v 32
scoreboard players set #ROWS holo.v 18
scoreboard players set #COLS_M1 holo.v 31
scoreboard players set #ROWS_M1 holo.v 17
scoreboard players set #MAX_PIX holo.v 576
tellraw @s {"text":"[Holo] Size: XS (32x18, 576 px)","color":"gray"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
