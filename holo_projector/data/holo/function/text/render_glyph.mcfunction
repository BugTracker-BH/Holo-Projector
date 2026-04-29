# holo:text/render_glyph — iterate 7 rows of glyph
execute if score #GR holo.tmp matches 7.. run return 0
execute store result storage holo:m gr int 1 run scoreboard players get #GR holo.tmp
function holo:text/load_row with storage holo:m
scoreboard players set #GC holo.tmp 0
function holo:text/render_row_cols
scoreboard players add #GR holo.tmp 1
function holo:text/render_glyph
