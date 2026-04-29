execute store result score #BODY_LEN holo.tmp run data get storage holo:snake body
execute if score #BI holo.tmp >= #BODY_LEN holo.tmp run return 0
execute store result storage holo:snake bi int 1 run scoreboard players get #BI holo.tmp
function holo:snake/load_segment with storage holo:snake
scoreboard players set #FILL_COLOR holo.tmp -16744448
execute if score #BI holo.tmp matches 0 run scoreboard players set #FILL_COLOR holo.tmp -16711936
function holo:snake/fill_cell
scoreboard players add #BI holo.tmp 1
function holo:snake/render_body_loop
