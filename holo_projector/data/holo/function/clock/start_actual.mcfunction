# holo:clock/start_actual
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 3
function holo:clock/tick
tellraw @s {"text":"[Clock] Live MC clock running.","color":"aqua"}
