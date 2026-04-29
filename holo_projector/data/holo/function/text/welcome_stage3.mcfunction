# holo:text/welcome_stage3 — READY
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #TEXT_COLOR holo.v -256
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "READY"
function holo:text/render_from_storage
