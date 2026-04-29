# holo:snake/init_body — places 3 segments horizontally, head at INIT_X+1
scoreboard players operation #IB_X holo.tmp = #INIT_X holo.tmp
scoreboard players add #IB_X holo.tmp 1
execute store result storage holo:snake nx int 1 run scoreboard players get #IB_X holo.tmp
execute store result storage holo:snake ny int 1 run scoreboard players get #INIT_Y holo.tmp
function holo:snake/append_segment with storage holo:snake
execute store result storage holo:snake nx int 1 run scoreboard players get #INIT_X holo.tmp
function holo:snake/append_segment with storage holo:snake
scoreboard players operation #IB_X holo.tmp = #INIT_X holo.tmp
scoreboard players remove #IB_X holo.tmp 1
execute store result storage holo:snake nx int 1 run scoreboard players get #IB_X holo.tmp
function holo:snake/append_segment with storage holo:snake
