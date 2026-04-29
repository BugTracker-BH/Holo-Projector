# holo:viz/tick — passive decay only (grows only from /viz/pulse)
execute unless score #LIVE_MODE holo.state matches 4 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #BI holo.tmp 0
function holo:viz/decay_loop
schedule function holo:viz/tick 2t
