# holo:control/size_xl — 128x72, pixel 1.0 (128x72 blocks), interlace 16
scoreboard players set #COLS holo.v 128
scoreboard players set #ROWS holo.v 72
scoreboard players set #COLS_M1 holo.v 127
scoreboard players set #ROWS_M1 holo.v 71
scoreboard players set #MAX_PIX holo.v 9216
scoreboard players set #PXSIZE_X100 holo.v 100
scoreboard players set #INTERLACE holo.v 16
tellraw @s {"text":"[Holo] Size: XL (128x72, 128x72 BLOCKS) -- MASSIVE","color":"red"}
scoreboard players set #WAS_A holo.tmp 0
execute if score #ACTIVE holo.state matches 1 run scoreboard players set #WAS_A holo.tmp 1
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/despawn
execute if score #WAS_A holo.tmp matches 1 run function holo:projector/spawn
