# holo:pong/start — dispatcher: if another mode is active, smooth-transition first
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Pong] No screen. Spawn the projector first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute if score #LIVE_MODE holo.state matches 0 run function holo:pong/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 1
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
