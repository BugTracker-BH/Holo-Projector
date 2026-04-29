# holo:text/display — render msg to projector pixels, honoring current style config
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players set #SILENT_ERROR holo.tmp 0
$data modify storage holo:m msg set value "$(msg)"
function holo:text/render_from_storage
$tellraw @s [{"text":"[Holo] Displaying: ","color":"aqua"},{"text":"$(msg)","color":"white","bold":true}]
