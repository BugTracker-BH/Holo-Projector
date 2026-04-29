# holo:viz/shrink_loop — erase rows NEW_H..PREV_H-1
execute if score #FILL_H holo.tmp >= #PREV_H holo.tmp run return 0
scoreboard players operation #PY_T holo.tmp = #ROWS holo.v
scoreboard players remove #PY_T holo.tmp 1
scoreboard players operation #PY_T holo.tmp -= #FILL_H holo.tmp
data modify storage holo:m color set value -16777216
scoreboard players set #DX_BAR holo.tmp 0
function holo:viz/draw_bar_row
scoreboard players add #FILL_H holo.tmp 1
function holo:viz/shrink_loop
