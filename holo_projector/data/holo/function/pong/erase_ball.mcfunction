# holo:pong/erase_ball — black out ball at prev position
execute store result storage holo:m px int 1 run scoreboard players get #PB_PX holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PB_PY holo.tmp
data modify storage holo:m color set value -16777216
function holo:text/set_pixel with storage holo:m
