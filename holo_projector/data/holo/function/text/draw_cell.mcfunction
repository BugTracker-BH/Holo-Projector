# holo:text/draw_cell — fill TSCALE x TSCALE block at (CHAR_X + GC*TSCALE, START_Y + GR*TSCALE)
scoreboard players operation #CELL_X holo.tmp = #GC holo.tmp
scoreboard players operation #CELL_X holo.tmp *= #TSCALE holo.tmp
scoreboard players operation #CELL_X holo.tmp += #CHAR_X holo.tmp
scoreboard players operation #CELL_Y holo.tmp = #GR holo.tmp
scoreboard players operation #CELL_Y holo.tmp *= #TSCALE holo.tmp
scoreboard players operation #CELL_Y holo.tmp += #START_Y holo.tmp
scoreboard players set #DY holo.tmp 0
function holo:text/fill_cell_rows
