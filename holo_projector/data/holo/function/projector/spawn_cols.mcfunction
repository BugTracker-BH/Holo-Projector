# holo:projector/spawn_cols — recursive col loop
execute if score #C holo.col >= #COLS holo.v run return 0
# x = (2c - COLS_M1) * PXSIZE_X100 / 200
scoreboard players operation #CX holo.tmp = #C holo.col
scoreboard players operation #CX holo.tmp *= #TWO holo.v
scoreboard players operation #CX holo.tmp -= #COLS_M1 holo.v
scoreboard players operation #CX holo.tmp *= #PXSIZE_X100 holo.v
execute store result storage holo:m lx float 0.005 run scoreboard players get #CX holo.tmp
execute store result storage holo:m c int 1 run scoreboard players get #C holo.col
function holo:projector/spawn_pixel with storage holo:m
scoreboard players add #C holo.col 1
function holo:projector/spawn_cols
