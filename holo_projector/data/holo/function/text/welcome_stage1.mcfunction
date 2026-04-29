# holo:text/welcome_stage1 — WELCOME (silent if too big)
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #TEXT_COLOR holo.v -16711681
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "WELCOME"
function holo:text/render_from_storage
schedule function holo:text/welcome_stage2 40t
