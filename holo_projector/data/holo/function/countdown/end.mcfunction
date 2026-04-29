# holo:countdown/end — render TIME! and start alarm chain
scoreboard players set #LIVE_MODE holo.state 0
scoreboard players set #TEXT_COLOR holo.v -65536
scoreboard players set #FORCED_SCALE holo.v 0
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "TIME"
function holo:text/render_from_storage

scoreboard players set #ALARM_COUNT holo.tmp 6
function holo:countdown/alarm

scoreboard players operation #TEXT_COLOR holo.v = #SAVED_COLOR holo.v
scoreboard players operation #FORCED_SCALE holo.v = #SAVED_FS holo.v
tellraw @a {"text":"[Countdown] TIME'S UP!","color":"red","bold":true}
