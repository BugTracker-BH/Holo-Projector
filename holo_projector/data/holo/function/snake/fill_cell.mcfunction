# holo:snake/fill_cell — fill CELL_SIZE x CELL_SIZE at cell (FILL_CX, FILL_CY) with FILL_COLOR
scoreboard players operation #RX holo.tmp = #FILL_CX holo.tmp
scoreboard players operation #RX holo.tmp *= #CELL_SIZE holo.v
scoreboard players operation #RY holo.tmp = #FILL_CY holo.tmp
scoreboard players operation #RY holo.tmp *= #CELL_SIZE holo.v
scoreboard players operation #RW holo.tmp = #CELL_SIZE holo.v
scoreboard players operation #RH holo.tmp = #CELL_SIZE holo.v
scoreboard players operation #RCOLOR holo.tmp = #FILL_COLOR holo.tmp
function holo:pong/fill_rect
