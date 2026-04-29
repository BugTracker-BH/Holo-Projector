# holo:pong/size_xl — Extra Large (largest ball + paddle)
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 4
tellraw @s {"text":"[Pong] Size: Extra Large (restart game to apply)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 1 run function holo:pong/start
