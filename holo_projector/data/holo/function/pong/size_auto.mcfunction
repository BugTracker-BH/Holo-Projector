# holo:pong/size_auto — auto-size based on projector size
scoreboard players set #PONG_SIZE_OVERRIDE holo.v 0
tellraw @s {"text":"[Pong] Size: Auto (scales with projector)","color":"aqua"}
execute if score #LIVE_MODE holo.state matches 1 run function holo:pong/start
