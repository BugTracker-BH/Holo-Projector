# holo:text/render_from_storage — dispatches single-line or word-wrapped render
scoreboard players set #SCENE holo.state 0
execute store result score #MSGLEN holo.tmp run data get storage holo:m msg
execute if score #MSGLEN holo.tmp matches ..0 run return 0

# Determine effective render scale (forced if set, else 1 — adaptive upscale happens in single-line path)
scoreboard players set #TSCALE holo.tmp 1
execute if score #FORCED_SCALE holo.v matches 1.. run scoreboard players operation #TSCALE holo.tmp = #FORCED_SCALE holo.v

# Effective stride (pixels per char at current scale)
scoreboard players operation #EFF_STRIDE holo.tmp = #CHAR_STRIDE holo.v
scoreboard players operation #EFF_STRIDE holo.tmp *= #TSCALE holo.tmp
execute if score #EFF_STRIDE holo.tmp matches ..0 run scoreboard players set #EFF_STRIDE holo.tmp 1

# MAX_CHARS per line at effective scale
scoreboard players operation #MAX_CHARS holo.tmp = #COLS holo.v
scoreboard players operation #MAX_CHARS holo.tmp /= #EFF_STRIDE holo.tmp

# Runtime warning: very tight line capacity
execute if score #SILENT_ERROR holo.tmp matches 0 if score #MAX_CHARS holo.tmp matches ..2 run tellraw @s {"text":"[Holo] Warning: current scale/spacing only fits 2 or fewer chars per line. Long messages will error. Try /function holo:text/reset_style","color":"yellow"}

# If message fits on one line at effective scale, render single-line (adaptive up-scale still applies if FORCED_SCALE=0)
execute if score #MSGLEN holo.tmp <= #MAX_CHARS holo.tmp run function holo:text/render_single_line
execute if score #MSGLEN holo.tmp <= #MAX_CHARS holo.tmp run return 0

# Word-wrap path (uses current TSCALE)
function holo:text/wrap_reset
function holo:text/wrap_loop
function holo:text/wrap_flush_done

execute if score #WRAP_ERROR holo.tmp matches 1 run function holo:text/show_error
execute if score #WRAP_ERROR holo.tmp matches 1 run return 0

execute store result score #NUMLINES holo.tmp run data get storage holo:m lines

# Vertical fit at effective scale: each line is 8 * TSCALE rows tall
scoreboard players operation #LINE_H holo.tmp = #TSCALE holo.tmp
scoreboard players set #EIGHT6 holo.v 8
scoreboard players operation #LINE_H holo.tmp *= #EIGHT6 holo.v
scoreboard players operation #THEIGHT holo.tmp = #NUMLINES holo.tmp
scoreboard players operation #THEIGHT holo.tmp *= #LINE_H holo.tmp

execute if score #THEIGHT holo.tmp > #ROWS holo.v run scoreboard players set #WRAP_ERROR holo.tmp 2
execute if score #WRAP_ERROR holo.tmp matches 2 run function holo:text/show_error
execute if score #WRAP_ERROR holo.tmp matches 2 run return 0

scoreboard players operation #BASE_Y holo.tmp = #ROWS holo.v
scoreboard players operation #BASE_Y holo.tmp -= #THEIGHT holo.tmp
scoreboard players operation #BASE_Y holo.tmp /= #TWO holo.v

execute as @e[tag=projector_pixel] run data modify entity @s background set value -16777216

scoreboard players set #LI holo.tmp 0
function holo:text/render_lines
