# holo:text/render_from_storage — render storage holo:m msg to projector pixels
# Prereqs: #TEXT_COLOR holo.v already set, #COLS/#ROWS set, pixels exist
scoreboard players set #SCENE holo.state 0
execute store result score #MSGLEN holo.tmp run data get storage holo:m msg
execute if score #MSGLEN holo.tmp matches ..0 run return 0

# Adaptive scale: min((COLS-4)/(MSGLEN*6), (ROWS-2)/8), clamp 1..10
scoreboard players operation #HSCALE holo.tmp = #COLS holo.v
scoreboard players remove #HSCALE holo.tmp 4
scoreboard players set #SIX holo.v 6
scoreboard players operation #HNEED holo.tmp = #MSGLEN holo.tmp
scoreboard players operation #HNEED holo.tmp *= #SIX holo.v
execute if score #HNEED holo.tmp matches ..0 run scoreboard players set #HNEED holo.tmp 1
scoreboard players operation #HSCALE holo.tmp /= #HNEED holo.tmp

scoreboard players operation #VSCALE holo.tmp = #ROWS holo.v
scoreboard players remove #VSCALE holo.tmp 2
scoreboard players set #EIGHT holo.v 8
scoreboard players operation #VSCALE holo.tmp /= #EIGHT holo.v

scoreboard players operation #TSCALE holo.tmp = #HSCALE holo.tmp
execute if score #VSCALE holo.tmp < #TSCALE holo.tmp run scoreboard players operation #TSCALE holo.tmp = #VSCALE holo.tmp
execute if score #TSCALE holo.tmp matches ..0 run scoreboard players set #TSCALE holo.tmp 1
execute if score #TSCALE holo.tmp matches 11.. run scoreboard players set #TSCALE holo.tmp 10

# Text bounds
scoreboard players operation #TWIDTH holo.tmp = #MSGLEN holo.tmp
scoreboard players operation #TWIDTH holo.tmp *= #SIX holo.v
scoreboard players operation #TWIDTH holo.tmp *= #TSCALE holo.tmp
scoreboard players operation #THEIGHT holo.tmp = #TSCALE holo.tmp
scoreboard players set #SEVEN holo.v 7
scoreboard players operation #THEIGHT holo.tmp *= #SEVEN holo.v

scoreboard players operation #START_X holo.tmp = #COLS holo.v
scoreboard players operation #START_X holo.tmp -= #TWIDTH holo.tmp
scoreboard players operation #START_X holo.tmp /= #TWO holo.v

scoreboard players operation #START_Y holo.tmp = #ROWS holo.v
scoreboard players operation #START_Y holo.tmp -= #THEIGHT holo.tmp
scoreboard players operation #START_Y holo.tmp /= #TWO holo.v

# Clear pixels to black (ARGB 0xFF000000 = -16777216)
execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

# Render
scoreboard players set #I holo.tmp 0
scoreboard players operation #CHAR_X holo.tmp = #START_X holo.tmp
function holo:text/render_loop
