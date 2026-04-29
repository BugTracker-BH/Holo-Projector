# holo:control/size_xl — 128x72 (9,216 pixels, ~25.6x14.4 blocks) -- MASSIVE
scoreboard players set #COLS holo.v 128
scoreboard players set #ROWS holo.v 72
scoreboard players set #COLS_M1 holo.v 127
scoreboard players set #ROWS_M1 holo.v 71
scoreboard players set #MAX_PIX holo.v 9216
tellraw @s {"text":"[Holo] Size: XL (128x72, 9216 px) -- HEAVY! Use static sphere or low-cost shaders.","color":"red"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
