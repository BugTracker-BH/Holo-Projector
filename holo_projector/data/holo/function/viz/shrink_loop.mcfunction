execute if score #FILL_H holo.tmp >= #PREV_H holo.tmp run return 0
scoreboard players operation #PY_T holo.tmp = #ROWS holo.v
scoreboard players remove #PY_T holo.tmp 1
scoreboard players operation #PY_T holo.tmp -= #FILL_H holo.tmp
data modify storage holo:m color set value -16777216

scoreboard players operation #PX_T holo.tmp = #BAR_X holo.tmp
execute store result storage holo:m px int 1 run scoreboard players get #PX_T holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PY_T holo.tmp
function holo:text/set_pixel with storage holo:m
scoreboard players add #PX_T holo.tmp 1
execute store result storage holo:m px int 1 run scoreboard players get #PX_T holo.tmp
function holo:text/set_pixel with storage holo:m

scoreboard players add #FILL_H holo.tmp 1
function holo:viz/shrink_loop
