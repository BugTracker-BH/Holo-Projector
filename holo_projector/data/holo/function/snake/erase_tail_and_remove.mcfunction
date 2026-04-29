# holo:snake/erase_tail_and_remove — erase last segment's pixels and remove from list
execute store result score #FILL_CX holo.tmp run data get storage holo:snake body[-1].x
execute store result score #FILL_CY holo.tmp run data get storage holo:snake body[-1].y
scoreboard players set #FILL_COLOR holo.tmp -16777216
function holo:snake/fill_cell
data remove storage holo:snake body[-1]
