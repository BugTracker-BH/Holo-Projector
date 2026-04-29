execute if score #RX_I holo.tmp >= #RW holo.tmp run return 0
scoreboard players operation #PX_T holo.tmp = #RX holo.tmp
scoreboard players operation #PX_T holo.tmp += #RX_I holo.tmp
scoreboard players operation #PY_T holo.tmp = #RY holo.tmp
scoreboard players operation #PY_T holo.tmp += #RY_I holo.tmp
execute store result storage holo:m px int 1 run scoreboard players get #PX_T holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PY_T holo.tmp
execute store result storage holo:m color int 1 run scoreboard players get #RCOLOR holo.tmp
function holo:text/set_pixel with storage holo:m
scoreboard players add #RX_I holo.tmp 1
function holo:pong/fill_rect_row
