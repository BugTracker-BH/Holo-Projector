# holo:snake/start — dispatcher with smooth transition
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Snake] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute if score #LIVE_MODE holo.state matches 0 run function holo:snake/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 7
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
