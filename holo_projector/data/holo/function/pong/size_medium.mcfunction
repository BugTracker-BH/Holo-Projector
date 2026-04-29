# holo:pong/size_medium
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 2
tellraw @s {"text":"[Pong] Size: Medium (restart game to apply)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 1 run function holo:pong/start
