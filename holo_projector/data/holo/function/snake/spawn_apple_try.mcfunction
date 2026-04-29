scoreboard players add #TRIES holo.tmp 1
execute if score #TRIES holo.tmp matches 11.. run return 0

scoreboard players operation #CC_M1 holo.tmp = #CELL_COLS holo.v
scoreboard players remove #CC_M1 holo.tmp 1
scoreboard players operation #CR_M1 holo.tmp = #CELL_ROWS holo.v
scoreboard players remove #CR_M1 holo.tmp 1
execute store result storage holo:snake cmax int 1 run scoreboard players get #CC_M1 holo.tmp
execute store result storage holo:snake rmax int 1 run scoreboard players get #CR_M1 holo.tmp
function holo:snake/rand_apple with storage holo:snake

scoreboard players set #OVERLAP holo.tmp 0
execute store result storage holo:snake hx int 1 run scoreboard players get #APPLE_X holo.tmp
execute store result storage holo:snake hy int 1 run scoreboard players get #APPLE_Y holo.tmp
function holo:snake/check_overlap with storage holo:snake
execute if score #OVERLAP holo.tmp matches 1 run function holo:snake/spawn_apple_try
