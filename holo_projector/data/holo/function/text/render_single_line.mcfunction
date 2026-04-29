# holo:text/render_single_line — render msg at adaptive or forced scale (fits single line)
scoreboard players operation #HSCALE holo.tmp = #COLS holo.v
scoreboard players remove #HSCALE holo.tmp 4
scoreboard players operation #HNEED holo.tmp = #MSGLEN holo.tmp
scoreboard players operation #HNEED holo.tmp *= #CHAR_STRIDE holo.v
execute if score #HNEED holo.tmp matches ..0 run scoreboard players set #HNEED holo.tmp 1
scoreboard players operation #HSCALE holo.tmp /= #HNEED holo.tmp

scoreboard players operation #VSCALE holo.tmp = #ROWS holo.v
scoreboard players remove #VSCALE holo.tmp 2
scoreboard players set #EIGHTA holo.v 8
scoreboard players operation #VSCALE holo.tmp /= #EIGHTA holo.v

scoreboard players operation #TSCALE holo.tmp = #HSCALE holo.tmp
execute if score #VSCALE holo.tmp < #TSCALE holo.tmp run scoreboard players operation #TSCALE holo.tmp = #VSCALE holo.tmp
execute if score #TSCALE holo.tmp matches ..0 run scoreboard players set #TSCALE holo.tmp 1
execute if score #TSCALE holo.tmp matches 21.. run scoreboard players set #TSCALE holo.tmp 20

# Forced scale override
execute if score #FORCED_SCALE holo.v matches 1.. run scoreboard players operation #TSCALE holo.tmp = #FORCED_SCALE holo.v

scoreboard players operation #TWIDTH holo.tmp = #MSGLEN holo.tmp
scoreboard players operation #TWIDTH holo.tmp *= #CHAR_STRIDE holo.v
scoreboard players operation #TWIDTH holo.tmp *= #TSCALE holo.tmp
scoreboard players operation #THEIGHT holo.tmp = #TSCALE holo.tmp
scoreboard players set #SEVENA holo.v 7
scoreboard players operation #THEIGHT holo.tmp *= #SEVENA holo.v

scoreboard players operation #START_X holo.tmp = #COLS holo.v
scoreboard players operation #START_X holo.tmp -= #TWIDTH holo.tmp
scoreboard players operation #START_X holo.tmp /= #TWO holo.v
scoreboard players operation #START_Y holo.tmp = #ROWS holo.v
scoreboard players operation #START_Y holo.tmp -= #THEIGHT holo.tmp
scoreboard players operation #START_Y holo.tmp /= #TWO holo.v

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players set #I holo.tmp 0
scoreboard players operation #CHAR_X holo.tmp = #START_X holo.tmp
function holo:text/render_loop
