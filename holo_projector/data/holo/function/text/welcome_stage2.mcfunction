# holo:text/welcome_stage2 — HOLO PROJECTOR
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "HOLO PROJECTOR"
function holo:text/render_from_storage
schedule function holo:text/welcome_stage3 40t
