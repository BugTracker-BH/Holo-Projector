# holo:text/welcome_stage3 — READY (stays until scene activates)
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
execute unless score #SCENE holo.state matches 0 run return 0
scoreboard players set #TEXT_COLOR holo.v -256
data modify storage holo:m msg set value "READY"
function holo:text/render_from_storage
