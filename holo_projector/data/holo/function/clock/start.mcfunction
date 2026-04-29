# holo:clock/start — enable live clock
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Clock] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 3
function holo:clock/tick
tellraw @s {"text":"[Clock] Live MC clock running. Stop with /function holo:clock/stop. Toggle 12/24h with /function holo:clock/toggle_12h","color":"aqua"}
