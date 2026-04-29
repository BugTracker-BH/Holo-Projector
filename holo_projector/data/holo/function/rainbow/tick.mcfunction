# holo:rainbow/tick — render Ready-message with rainbow colors, cycle offset
execute unless score #LIVE_MODE holo.state matches 5 run return 0
execute unless entity @e[tag=projector_pixel,limit=1] run return 0

scoreboard players add #RAINBOW_OFFSET holo.v 1
scoreboard players set #D6V holo.v 6
scoreboard players operation #RAINBOW_OFFSET holo.v %= #D6V holo.v

scoreboard players operation #SAVED_TC holo.v = #TEXT_COLOR holo.v
scoreboard players set #RAINBOW holo.state 1
scoreboard players set #SILENT_ERROR holo.tmp 1
data modify storage holo:m msg set value "Ready when you are!"
function holo:text/render_from_storage
scoreboard players set #RAINBOW holo.state 0
scoreboard players operation #TEXT_COLOR holo.v = #SAVED_TC holo.v

schedule function holo:rainbow/tick 4t
