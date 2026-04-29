# holo:countdown/start (macro dispatcher)
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Countdown] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
$data modify storage holo:cd h set value $(h)
$data modify storage holo:cd m set value $(m)
$data modify storage holo:cd s set value $(s)
execute if score #LIVE_MODE holo.state matches 0 run function holo:countdown/start_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 2
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
