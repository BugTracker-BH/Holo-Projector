# holo:snake/render_apple — red cell at apple position
scoreboard players operation #FILL_CX holo.tmp = #APPLE_X holo.tmp
scoreboard players operation #FILL_CY holo.tmp = #APPLE_Y holo.tmp
scoreboard players set #FILL_COLOR holo.tmp -65536
function holo:snake/fill_cell
