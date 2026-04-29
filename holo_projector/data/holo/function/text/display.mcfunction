# holo:text/display — pixel-rendered text (L/XL only)
# Usage: /function holo:text/display {msg:"HELLO"}
execute unless score #COLS holo.v matches 96.. run tellraw @s {"text":"[Holo] Text display requires Large or XL projector.","color":"red"}
execute unless score #COLS holo.v matches 96.. run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run tellraw @s {"text":"[Holo] No screen. Run /function holo:projector/spawn first.","color":"red"}
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

# Default text color = cyan (ARGB 0xFF00FFFF = -16711681)
scoreboard players set #TEXT_COLOR holo.v -16711681

$data modify storage holo:m msg set value "$(msg)"
function holo:text/render_from_storage

$tellraw @s [{"text":"[Holo] Displaying: ","color":"aqua"},{"text":"$(msg)","color":"white","bold":true}]
