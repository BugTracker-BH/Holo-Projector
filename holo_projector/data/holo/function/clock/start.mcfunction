# holo:clock/start (dispatcher)
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Clock] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute if score #LIVE_MODE holo.state matches 0 run function holo:clock/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 3
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
