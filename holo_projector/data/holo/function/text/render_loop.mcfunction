# holo:text/render_loop — iterate chars of msg, render each (supports rainbow)
execute if score #I holo.tmp >= #MSGLEN holo.tmp run return 0
scoreboard players operation #J holo.tmp = #I holo.tmp
scoreboard players add #J holo.tmp 1
execute store result storage holo:m si int 1 run scoreboard players get #I holo.tmp
execute store result storage holo:m sj int 1 run scoreboard players get #J holo.tmp
function holo:text/extract_char with storage holo:m
function holo:text/char_to_idx
execute store result storage holo:m gidx int 1 run scoreboard players get #CHAR_IDX holo.tmp
function holo:text/load_glyph with storage holo:m
execute if score #RAINBOW holo.state matches 1 run function holo:text/rainbow_color
scoreboard players set #GR holo.tmp 0
function holo:text/render_glyph
scoreboard players operation #STRIDE holo.tmp = #CHAR_STRIDE holo.v
scoreboard players operation #STRIDE holo.tmp *= #TSCALE holo.tmp
scoreboard players operation #CHAR_X holo.tmp += #STRIDE holo.tmp
scoreboard players add #I holo.tmp 1
function holo:text/render_loop
