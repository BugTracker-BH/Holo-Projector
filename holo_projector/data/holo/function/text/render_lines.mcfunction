# holo:text/render_lines — iterate committed lines, render each at scale 1
execute if score #LI holo.tmp >= #NUMLINES holo.tmp run return 0
execute store result storage holo:m li int 1 run scoreboard players get #LI holo.tmp
function holo:text/load_line with storage holo:m
execute store result score #MSGLEN holo.tmp run data get storage holo:m msg
scoreboard players operation #TWIDTH holo.tmp = #MSGLEN holo.tmp
scoreboard players set #SIXB holo.v 6
scoreboard players operation #TWIDTH holo.tmp *= #SIXB holo.v
scoreboard players operation #START_X holo.tmp = #COLS holo.v
scoreboard players operation #START_X holo.tmp -= #TWIDTH holo.tmp
scoreboard players operation #START_X holo.tmp /= #TWO holo.v
scoreboard players operation #START_Y holo.tmp = #LI holo.tmp
scoreboard players set #EIGHTB holo.v 8
scoreboard players operation #START_Y holo.tmp *= #EIGHTB holo.v
scoreboard players operation #START_Y holo.tmp += #BASE_Y holo.tmp
scoreboard players set #I holo.tmp 0
scoreboard players operation #CHAR_X holo.tmp = #START_X holo.tmp
function holo:text/render_loop
scoreboard players add #LI holo.tmp 1
function holo:text/render_lines
