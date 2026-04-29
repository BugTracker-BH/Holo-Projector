# holo:viz/start — EQ visualizer
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Viz] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 4

scoreboard players set #BAR_SPACING holo.v 3
scoreboard players set #BAR_WIDTH holo.v 2
scoreboard players operation #NUM_BARS holo.v = #COLS holo.v
scoreboard players operation #NUM_BARS holo.v /= #BAR_SPACING holo.v
scoreboard players operation #MAX_H holo.v = #ROWS holo.v
scoreboard players remove #MAX_H holo.v 2

function holo:viz/init_heights

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

schedule function holo:viz/tick 2t
tellraw @s {"text":"[Viz] EQ visualizer started. Trigger beats with /function holo:viz/pulse","color":"aqua"}
