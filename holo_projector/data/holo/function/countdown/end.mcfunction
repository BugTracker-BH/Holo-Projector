# holo:countdown/end — render end_msg in bold red
scoreboard players operation #SAVED_COLOR holo.v = #TEXT_COLOR holo.v
scoreboard players set #TEXT_COLOR holo.v -65536
data modify storage holo:m msg set from storage holo:cd end_msg
scoreboard players set #SILENT_ERROR holo.tmp 1
function holo:text/render_from_storage
scoreboard players operation #TEXT_COLOR holo.v = #SAVED_COLOR holo.v
scoreboard players set #LIVE_MODE holo.state 0
tellraw @a [{"text":"[Countdown] ","color":"aqua"},{"nbt":"end_msg","storage":"holo:cd","color":"red","bold":true}]
