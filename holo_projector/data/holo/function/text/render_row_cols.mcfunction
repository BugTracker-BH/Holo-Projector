# holo:text/render_row_cols — iterate 5 cols of row, check bits
execute if score #GC holo.tmp matches 5.. run return 0
scoreboard players set #DIV holo.tmp 0
execute if score #GC holo.tmp matches 0 run scoreboard players set #DIV holo.tmp 16
execute if score #GC holo.tmp matches 1 run scoreboard players set #DIV holo.tmp 8
execute if score #GC holo.tmp matches 2 run scoreboard players set #DIV holo.tmp 4
execute if score #GC holo.tmp matches 3 run scoreboard players set #DIV holo.tmp 2
execute if score #GC holo.tmp matches 4 run scoreboard players set #DIV holo.tmp 1
scoreboard players operation #BIT holo.tmp = #ROW_BITS holo.tmp
scoreboard players operation #BIT holo.tmp /= #DIV holo.tmp
scoreboard players operation #BIT holo.tmp %= #TWO holo.v
execute if score #BIT holo.tmp matches 1 run function holo:text/draw_cell
scoreboard players add #GC holo.tmp 1
function holo:text/render_row_cols
