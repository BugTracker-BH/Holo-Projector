# holo:text/fill_cell_cols
execute if score #DX holo.tmp >= #TSCALE holo.tmp run return 0
scoreboard players operation #PX_ABS holo.tmp = #CELL_X holo.tmp
scoreboard players operation #PX_ABS holo.tmp += #DX holo.tmp
scoreboard players operation #PY_ABS holo.tmp = #CELL_Y holo.tmp
scoreboard players operation #PY_ABS holo.tmp += #DY holo.tmp
scoreboard players set #OK holo.tmp 1
execute if score #PX_ABS holo.tmp >= #COLS holo.v run scoreboard players set #OK holo.tmp 0
execute if score #PX_ABS holo.tmp matches ..-1 run scoreboard players set #OK holo.tmp 0
execute if score #PY_ABS holo.tmp >= #ROWS holo.v run scoreboard players set #OK holo.tmp 0
execute if score #PY_ABS holo.tmp matches ..-1 run scoreboard players set #OK holo.tmp 0
execute if score #OK holo.tmp matches 1 store result storage holo:m px int 1 run scoreboard players get #PX_ABS holo.tmp
execute if score #OK holo.tmp matches 1 store result storage holo:m py int 1 run scoreboard players get #PY_ABS holo.tmp
execute if score #OK holo.tmp matches 1 store result storage holo:m color int 1 run scoreboard players get #TEXT_COLOR holo.v
execute if score #OK holo.tmp matches 1 run function holo:text/set_pixel with storage holo:m
scoreboard players add #DX holo.tmp 1
function holo:text/fill_cell_cols
