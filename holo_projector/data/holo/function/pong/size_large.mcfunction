# holo:pong/size_large
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 3
tellraw @s {"text":"[Pong] Size: Large (restart game to apply)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 1 run function holo:pong/start
