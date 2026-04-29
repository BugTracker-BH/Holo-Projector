# holo:text/render_from_storage — dispatches single-line or word-wrapped render
scoreboard players set #SCENE holo.state 0
execute store result score #MSGLEN holo.tmp run data get storage holo:m msg
execute if score #MSGLEN holo.tmp matches ..0 run return 0

scoreboard players operation #MAX_CHARS holo.tmp = #COLS holo.v
scoreboard players operation #MAX_CHARS holo.tmp /= #CHAR_STRIDE holo.v

execute if score #MSGLEN holo.tmp <= #MAX_CHARS holo.tmp run function holo:text/render_single_line
execute if score #MSGLEN holo.tmp <= #MAX_CHARS holo.tmp run return 0

# Word-wrap path — uses scale 1 (or forced scale if set)
scoreboard players set #TSCALE holo.tmp 1
execute if score #FORCED_SCALE holo.v matches 1.. run scoreboard players operation #TSCALE holo.tmp = #FORCED_SCALE holo.v

function holo:text/wrap_reset
function holo:text/wrap_loop
function holo:text/wrap_flush_done

execute if score #WRAP_ERROR holo.tmp matches 1 run function holo:text/show_error
execute if score #WRAP_ERROR holo.tmp matches 1 run return 0

execute store result score #NUMLINES holo.tmp run data get storage holo:m lines
scoreboard players operation #THEIGHT holo.tmp = #NUMLINES holo.tmp
scoreboard players set #EIGHT6 holo.v 8
scoreboard players operation #THEIGHT holo.tmp *= #EIGHT6 holo.v
scoreboard players operation #THEIGHT holo.tmp *= #TSCALE holo.tmp
execute if score #THEIGHT holo.tmp > #ROWS holo.v run scoreboard players set #WRAP_ERROR holo.tmp 2
execute if score #WRAP_ERROR holo.tmp matches 2 run function holo:text/show_error
execute if score #WRAP_ERROR holo.tmp matches 2 run return 0

scoreboard players operation #BASE_Y holo.tmp = #ROWS holo.v
scoreboard players operation #BASE_Y holo.tmp -= #THEIGHT holo.tmp
scoreboard players operation #BASE_Y holo.tmp /= #TWO holo.v

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players set #LI holo.tmp 0
function holo:text/render_lines
