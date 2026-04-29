# holo:countdown/tick — decrement and render
execute unless score #LIVE_MODE holo.state matches 2 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players remove #CD_TOTAL holo.tmp 1
execute if score #CD_TOTAL holo.tmp matches ..0 run function holo:countdown/end
execute if score #CD_TOTAL holo.tmp matches ..0 run return 0
function holo:countdown/render_current
schedule function holo:countdown/tick 20t
