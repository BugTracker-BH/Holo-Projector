# holo:text/fill_cell_rows
execute if score #DY holo.tmp >= #TSCALE holo.tmp run return 0
scoreboard players set #DX holo.tmp 0
function holo:text/fill_cell_cols
scoreboard players add #DY holo.tmp 1
function holo:text/fill_cell_rows
