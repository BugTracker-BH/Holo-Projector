# holo:projector/spawn_rows — recursive row loop (0..#ROWS-1)
execute if score #R holo.row >= #ROWS holo.v run return 0
scoreboard players set #C holo.col 0
# y = (ROWS_M1 - 2r) * 0.1
scoreboard players operation #RY holo.tmp = #R holo.row
scoreboard players operation #RY holo.tmp *= #NEG2 holo.v
scoreboard players operation #RY holo.tmp += #ROWS_M1 holo.v
execute store result storage holo:m ly float 0.1 run scoreboard players get #RY holo.tmp
execute store result storage holo:m r int 1 run scoreboard players get #R holo.row
function holo:projector/spawn_cols
scoreboard players add #R holo.row 1
function holo:projector/spawn_rows
