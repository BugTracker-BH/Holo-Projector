# holo:text/welcome_stage4_show — "Holo"
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless score #LIVE_MODE holo.state matches 6 run return 0
scoreboard players set #TEXT_COLOR holo.v -16711681
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "Holo"
function holo:text/render_from_storage
schedule function holo:text/welcome_transition 30t
schedule function holo:text/welcome_stage5_show 45t
