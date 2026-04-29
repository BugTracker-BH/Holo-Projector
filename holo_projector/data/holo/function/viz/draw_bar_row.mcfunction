# holo:viz/draw_bar_row — fill one horizontal line of a bar (BAR_WIDTH pixels wide at PY_T, starting at BAR_X)
execute if score #DX_BAR holo.tmp >= #BAR_WIDTH holo.v run return 0
scoreboard players operation #PX_T holo.tmp = #BAR_X holo.tmp
scoreboard players operation #PX_T holo.tmp += #DX_BAR holo.tmp
execute store result storage holo:m px int 1 run scoreboard players get #PX_T holo.tmp
execute store result storage holo:m py int 1 run scoreboard players get #PY_T holo.tmp
function holo:text/set_pixel with storage holo:m
scoreboard players add #DX_BAR holo.tmp 1
function holo:viz/draw_bar_row
