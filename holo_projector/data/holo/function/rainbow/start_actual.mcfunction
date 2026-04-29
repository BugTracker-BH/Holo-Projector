# holo:rainbow/start_actual — renders msg in rainbow, animates letter-by-letter color cycle
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 5
scoreboard players set #RAINBOW_OFFSET holo.v 0
function holo:rainbow/tick
