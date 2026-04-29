# holo:viz/start — EQ visualizer, passive (only pulses grow bars)
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Viz] No screen.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
function holo:mode/stop
scoreboard players set #LIVE_MODE holo.state 4

# 10 bars across the projector width
scoreboard players set #NUM_BARS holo.v 10
scoreboard players operation #BAR_STRIDE holo.v = #COLS holo.v
scoreboard players operation #BAR_STRIDE holo.v /= #NUM_BARS holo.v
scoreboard players operation #BAR_WIDTH holo.v = #BAR_STRIDE holo.v
scoreboard players remove #BAR_WIDTH holo.v 1
execute if score #BAR_WIDTH holo.v matches ..0 run scoreboard players set #BAR_WIDTH holo.v 1
scoreboard players operation #MAX_H holo.v = #ROWS holo.v
scoreboard players remove #MAX_H holo.v 1

function holo:viz/init_heights

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

schedule function holo:viz/tick 2t
tellraw @s {"text":"[Viz] EQ visualizer ready (passive mode). Bars rise only when pulsed:","color":"aqua"}
tellraw @s {"text":"  /function holo:viz/pulse  -- call when audio/music plays","color":"dark_aqua"}
