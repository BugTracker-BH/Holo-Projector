# holo:text/display_actual — render msg stored at holo:tx
execute unless entity @e[tag=projector_pixel,limit=1] run return 0
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players set #SILENT_ERROR holo.tmp 0
data modify storage holo:m msg set from storage holo:tx msg
function holo:text/render_from_storage
tellraw @s [{"text":"[Holo] Displaying: ","color":"aqua"},{"nbt":"msg","storage":"holo:tx","color":"white","bold":true}]
