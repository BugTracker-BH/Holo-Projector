# holo:xray/start — dispatcher with smooth transition
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[X-Ray] No screen. Spawn the projector first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute if score #LIVE_MODE holo.state matches 0 run function holo:xray/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 9
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
