# holo:pong/size_small — force Small dims on next /pong/start
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 1
tellraw @s {"text":"[Pong] Size: Small (restart game to apply)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 1 run function holo:pong/start
