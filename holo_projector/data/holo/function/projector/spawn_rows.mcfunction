# holo:projector/spawn_rows — recursive row loop (0..17)
execute if score #R holo.row matches 18.. run return 0
scoreboard players set #C holo.col 0
# row y offset in tenths of a unit to feed float store: y = (17 - 2*r)  scaled by 0.1 gives (1.7 - 0.2r)
# simpler: store int (17 - 2*r) then float scale 0.1
scoreboard players operation #RY holo.tmp = #R holo.row
scoreboard players operation #RY holo.tmp *= #NEG2 holo.v
scoreboard players operation #RY holo.tmp += #SEVENTEEN holo.v
execute store result storage holo:m ly float 0.1 run scoreboard players get #RY holo.tmp
execute store result storage holo:m r int 1 run scoreboard players get #R holo.row
function holo:projector/spawn_cols
scoreboard players add #R holo.row 1
function holo:projector/spawn_rows
