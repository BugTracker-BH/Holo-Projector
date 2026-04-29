# holo:mode/clear_row_at — set py from score and call macro clear_row
execute store result storage holo:m py int 1 run scoreboard players get #CLEAR_Y holo.tmp
function holo:mode/clear_row with storage holo:m
