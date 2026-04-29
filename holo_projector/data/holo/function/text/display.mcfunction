# holo:text/display (macro dispatcher) — renders msg with smooth transition from current mode
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
$data modify storage holo:tx msg set value "$(msg)"
execute if score #LIVE_MODE holo.state matches 0 run function holo:text/display_actual
execute unless score #LIVE_MODE holo.state matches 0 run scoreboard players set #PENDING_MODE holo.state 5
execute unless score #LIVE_MODE holo.state matches 0 run function holo:mode/stop_smooth
