# holo:text/welcome_stage2_show — "to"
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless score #LIVE_MODE holo.state matches 6 run return 0
scoreboard players set #TEXT_COLOR holo.v -1
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "to"
function holo:text/render_from_storage
schedule function holo:text/welcome_transition 30t
schedule function holo:text/welcome_stage3_show 45t
