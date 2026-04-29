execute if score #JZ holo.tmp matches 4.. run return 0
execute store result storage holo:viz sx int 1 run scoreboard players get #JX holo.tmp
execute store result storage holo:viz sy int 1 run scoreboard players get #JY holo.tmp
execute store result storage holo:viz sz int 1 run scoreboard players get #JZ holo.tmp
function holo:viz/check_pos with storage holo:viz
scoreboard players add #JZ holo.tmp 1
function holo:viz/scan_z
